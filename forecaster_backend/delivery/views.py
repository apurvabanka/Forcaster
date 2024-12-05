import pandas as pd

from django.http import JsonResponse
from .models import ClusteringResult, RegressionResult, DeliveryRecord
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression
from sklearn.cluster import KMeans
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error


def run_and_save_regression(request):
    data = DeliveryRecord.objects.all().values('delivery_person_ratings', 'time_taken')
    df = pd.DataFrame(list(data))
    
    ratings = df['delivery_person_ratings']
    delivery_time = df['time_taken']
    poly = PolynomialFeatures(degree=3)
    X_poly = poly.fit_transform(delivery_time.values.reshape(-1, 1))

    model = LinearRegression()
    model.fit(X_poly, ratings)

    X_train, X_test, y_train, y_test = train_test_split(X_poly, ratings, test_size=0.2, random_state=42)

    # Predict values
    y_pred = model.predict(X_test)

    mse = mean_squared_error(y_test, y_pred)

    # Save results in the database
    result = RegressionResult.objects.create(
        coefficients=model.coef_.tolist(),
        intercept=model.intercept_,
        degree=3,
        mean_squared_error=mse,
        predictions=y_pred.tolist(),
        actuals=y_test.tolist()
    )

    response = {
        'id': result.id,
        'coefficients': model.coef_.tolist(),
        'intercept': model.intercept_,
        'mean_squared_error': mse,
        'test_predictions': y_pred.tolist(),
        'test_actuals': y_test.tolist(),
    }

    return JsonResponse(response)


def run_and_save_clustering(request):
    data = DeliveryRecord.objects.all().values('delivery_location_latitude', 'delivery_location_longitude')
    df = pd.DataFrame(list(data))

    k = 4  # Optimal k from the elbow method
    kmeans = KMeans(n_clusters=k)
    df['cluster'] = kmeans.fit_predict(df)

    df['distance_from_centroid'] = kmeans.transform(df[['delivery_location_latitude', 'delivery_location_longitude']]).min(axis=1)

    results = [
        ClusteringResult(
            point_id=index,
            cluster=row['cluster'],
            delivery_location_latitude=row['delivery_location_latitude'],
            delivery_location_longitude=row['delivery_location_longitude'],
            distance_from_centroid=row['distance_from_centroid'],
        )
        for index, row in df.iterrows()
    ]

    ClusteringResult.objects.bulk_create(results)

    return JsonResponse({'msg': 'Clustering executed sucessfully'})


def list_regression_results(request):
    results = RegressionResult.objects.all().values('id', 'created_at', 'degree', 'coefficients', 'intercept', 'mean_squared_error')
    return JsonResponse({'results': list(results)})

def list_clustering_results(request):
    results = ClusteringResult.objects.all().values('point_id', 'cluster', 'delivery_location_latitude', 'delivery_location_longitude', 'distance_from_centroid')
    return JsonResponse({'results': list(results)})

