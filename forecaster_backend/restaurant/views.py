import pandas as pd
import numpy as np
from django.http import JsonResponse
from .models import DeliveryRecord, PredictionResult
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error


def clean_and_prepare_data():
    """
    Load data, clean, and preprocess it for training and prediction.
    """
    # Load data from the database
    data = DeliveryRecord.objects.all().values(
        'Delivery_person_Age', 'Delivery_person_Ratings', 'Restaurant_latitude', 'Restaurant_longitude',
        'Delivery_location_latitude', 'Delivery_location_longitude', 'Time_Orderd', 'Time_Order_picked',
        'Time_taken(min)', 'Type_of_order', 'multiple_deliveries', 'weather_conditions', 'road_traffic_density',
        'distance', 'type_of_vehicle'
    )
    df = pd.DataFrame(list(data))

    # Replacing 'NaN' with NaN
    df = df.replace('NaN', np.nan, regex=True)

    # Cleaning numeric columns
    df['Delivery_person_Age'] = pd.to_numeric(df['Delivery_person_Age'], errors='coerce')
    df['Delivery_person_Ratings'] = pd.to_numeric(df['Delivery_person_Ratings'], errors='coerce')
    df['multiple_deliveries'] = pd.to_numeric(df['multiple_deliveries'], errors='coerce')

    # Filling missing values
    df['Delivery_person_Age'].fillna(int(df['Delivery_person_Age'].mean()), inplace=True)
    df['Delivery_person_Ratings'].fillna(round(df['Delivery_person_Ratings'].mean(), 1), inplace=True)
    df['multiple_deliveries'].fillna(df['multiple_deliveries'].mode()[0], inplace=True)

    # Clean 'Time_taken(min)' column
    df['Time_taken(min)'] = df['Time_taken(min)'].str.replace(r'\(min\) ', '', regex=True).astype(float)

    # Handling geolocation data
    threshold = 0.01
    valid_rest_lat = df[df['Restaurant_latitude'] > threshold]['Restaurant_latitude']
    valid_rest_long = df[df['Restaurant_longitude'] > threshold]['Restaurant_longitude']
    valid_del_lat = df[df['Delivery_location_latitude'] > threshold]['Delivery_location_latitude']
    valid_del_long = df[df['Delivery_location_longitude'] > threshold]['Delivery_location_longitude']

    min_rest_lat, max_rest_lat = valid_rest_lat.min(), valid_rest_lat.max()
    min_rest_long, max_rest_long = valid_rest_long.min(), valid_rest_long.max()
    min_del_lat, max_del_lat = valid_del_lat.min(), valid_del_lat.max()
    min_del_long, max_del_long = valid_del_long.min(), valid_del_long.max()

    # Replace zero or near-zero geolocation values with random values
    df['Restaurant_latitude'] = df['Restaurant_latitude'].apply(
        lambda x: round(np.random.uniform(min_rest_lat, max_rest_lat), 4) if x <= threshold else x
    )
    df['Restaurant_longitude'] = df['Restaurant_longitude'].apply(
        lambda x: round(np.random.uniform(min_rest_long, max_rest_long), 4) if x <= threshold else x
    )
    df['Delivery_location_latitude'] = df['Delivery_location_latitude'].apply(
        lambda x: round(np.random.uniform(min_del_lat, max_del_lat), 4) if x <= threshold else x
    )
    df['Delivery_location_longitude'] = df['Delivery_location_longitude'].apply(
        lambda x: round(np.random.uniform(min_del_long, max_del_long), 4) if x <= threshold else x
    )

    # Process time data
    df['Time_Orderd'] = pd.to_datetime(df['Time_Orderd'], errors='coerce')
    df['Time_Order_picked'] = pd.to_datetime(df['Time_Order_picked'], errors='coerce')
    df['Hour_Order'] = df['Time_Orderd'].dt.hour

    # Create 'Time_of_day' bins
    def time_of_day(hour):
        if 5 <= hour < 12:
            return 'Morning'
        elif 12 <= hour < 17:
            return 'Afternoon'
        elif 17 <= hour < 21:
            return 'Evening'
        else:
            return 'Night'

    df['Time_of_day'] = df['Hour_Order'].apply(time_of_day)

    # Calculate order preparation time
    df['Prep_time(min)'] = (df['Time_Order_picked'] - df['Time_Orderd']).dt.total_seconds() / 60

    # Drop unnecessary columns and rows with NaN in critical fields
    df.dropna(subset=['Time_Orderd', 'Time_Order_picked', 'Time_taken(min)', 'Prep_time(min)'], inplace=True)
    return df


def train_models(df):
    """
    Train Random Forest models for delivery time and preparation time prediction.
    """
    # Preprocess data
    df = pd.get_dummies(df, columns=['Time_of_day', 'Type_of_order', 'weather_conditions', 'road_traffic_density', 'type_of_vehicle'], drop_first=True)

    # Define features and targets
    features = df.drop(columns=['Time_taken(min)', 'Prep_time(min)'])
    delivery_target = df['Time_taken(min)']
    prep_target = df['Prep_time(min)']

    # Train-test split
    X_train, X_test, y_train_delivery, y_test_delivery = train_test_split(features, delivery_target, test_size=0.2, random_state=42)
    _, _, y_train_prep, y_test_prep = train_test_split(features, prep_target, test_size=0.2, random_state=42)

    # Train Random Forest models
    delivery_model = RandomForestRegressor(n_estimators=100, random_state=42)
    delivery_model.fit(X_train, y_train_delivery)

    prep_model = RandomForestRegressor(n_estimators=100, random_state=42)
    prep_model.fit(X_train, y_train_prep)

    # Evaluate models
    delivery_mae = mean_absolute_error(y_test_delivery, delivery_model.predict(X_test))
    prep_mae = mean_absolute_error(y_test_prep, prep_model.predict(X_test))
    print(f"Delivery Time MAE: {delivery_mae}")
    print(f"Preparation Time MAE: {prep_mae}")

    return delivery_model, prep_model


def predict_times(request):
    """
    Predict both delivery time and preparation time based on user-provided input features.
    """
    # Clean and prepare the dataset
    df = clean_and_prepare_data()

    # Train the models
    delivery_model, prep_model = train_models(df)

    # Example user input
    user_input = {
        'Time_of_day': 'Evening',
        'Type_of_order': 'Food',
        'multiple_deliveries': 2,
        'distance': 5.0,
        'weather_conditions': 'Rainy',
        'road_traffic_density': 'High',
        'type_of_vehicle': 'Bike'
    }

    # Convert user input to DataFrame
    input_df = pd.DataFrame([user_input])

    # Preprocess user input
    input_df = pd.get_dummies(input_df, columns=['Time_of_day', 'Type_of_order', 'weather_conditions', 'road_traffic_density', 'type_of_vehicle'], drop_first=True)

    # Add missing columns to match the training dataset
    missing_cols = set(delivery_model.feature_names_in_) - set(input_df.columns)
    for col in missing_cols:
        input_df[col] = 0  # Add missing columns with default values

    # Predict delivery and preparation times
    delivery_time = delivery_model.predict(input_df)[0]
    prep_time = prep_model.predict(input_df)[0]

    # Save the prediction result in the database
    result = PredictionResult.objects.create(
        input_features=user_input,
        predicted_prep_time=prep_time,
        predicted_delivery_time=delivery_time,
    )

    response = {
        'id': result.id,
        'input_features': user_input,
        'predicted_prep_time': prep_time,
        'predicted_delivery_time': delivery_time,
    }

    return JsonResponse(response)
