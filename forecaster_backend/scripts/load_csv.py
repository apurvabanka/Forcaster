import csv
from datetime import datetime
from delivery.models import DeliveryRecord

csv_file_path = "scripts/clean_data.csv"

# Open and read the CSV file
with open(csv_file_path, mode='r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        parse_order_date = datetime.strptime(row['order_date'], '%d-%m-%Y').strftime('%Y-%m-%d')
        DeliveryRecord.objects.create(
            # id=row['id'],
            delivery_person_id=row['delivery_person_id'],
            delivery_person_age=float(row['delivery_person_age']),
            delivery_person_ratings=row['delivery_person_ratings'],
            restaurant_latitude=row['restaurant_latitude'],
            restaurant_longitude=row['restaurant_longitude'],
            delivery_location_latitude=row['delivery_location_latitude'],
            delivery_location_longitude=row['delivery_location_longitude'],
            order_date=parse_order_date,
            time_ordered=row['time_ordered'],
            time_order_picked=row['time_order_picked'],
            weather_conditions=row['weather_conditions'],
            road_traffic_density=row['road_traffic_density'],
            vehicle_condition=row['vehicle_condition'],
            type_of_order=row['type_of_order'],
            type_of_vehicle=row['type_of_vehicle'],
            multiple_deliveries=float(row['multiple_deliveries']),
            festival=row['festival'],
            city=row['city'],
            time_taken=row['time_taken'],
        )

print("Data loaded successfully!")