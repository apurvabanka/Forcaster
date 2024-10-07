import pandas as pd
import numpy as np

# Define a threshold for "near-zero" values
threshold = 0.01

# Task 1: Identify the valid range for Restaurant Latitude and Longitude
valid_restaurant_latitude = df[df['Restaurant_latitude'] > threshold]['Restaurant_latitude']
valid_restaurant_longitude = df[df['Restaurant_longitude'] > threshold]['Restaurant_longitude']

# Task 2: Identify the valid range for Delivery Latitude and Longitude
valid_delivery_latitude = df[df['Delivery_location_latitude'] > threshold]['Delivery_location_latitude']
valid_delivery_longitude = df[df['Delivery_location_longitude'] > threshold]['Delivery_location_longitude']

# Task 3: Calculate the min and max for each of the valid columns
min_rest_lat, max_rest_lat = valid_restaurant_latitude.min(), valid_restaurant_latitude.max()
min_rest_long, max_rest_long = valid_restaurant_longitude.min(), valid_restaurant_longitude.max()
min_del_lat, max_del_lat = valid_delivery_latitude.min(), valid_delivery_latitude.max()
min_del_long, max_del_long = valid_delivery_longitude.min(), valid_delivery_longitude.max()

# Task 4: Replace zero or near-zero values with random values from the respective range
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

# Display the updated DataFrame
print(df[['Restaurant_latitude', 'Restaurant_longitude', 'Delivery_location_latitude', 'Delivery_location_longitude']])
