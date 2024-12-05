from django.db import models

# Create your models here.
class DeliveryRecord(models.Model):
    id = models.AutoField(primary_key=True)  # Auto-generated primary key
    delivery_person_id = models.CharField(max_length=50)
    delivery_person_age = models.PositiveIntegerField()
    delivery_person_ratings = models.FloatField()
    restaurant_latitude = models.FloatField()
    restaurant_longitude = models.FloatField()
    delivery_location_latitude = models.FloatField()
    delivery_location_longitude = models.FloatField()
    order_date = models.DateField()
    time_ordered = models.TimeField(null=True, blank=True)  # Allowing null for optional data
    time_order_picked = models.TimeField(null=True, blank=True)  # Allowing null for optional data
    weather_conditions = models.CharField(max_length=100, null=True, blank=True)  # E.g., "Sunny", "Rainy"
    road_traffic_density = models.CharField(max_length=50, null=True, blank=True)  # E.g., "High", "Medium"
    vehicle_condition = models.PositiveSmallIntegerField()  # Assuming condition is rated 1-10
    type_of_order = models.CharField(max_length=100)  # E.g., "Food", "Groceries"
    type_of_vehicle = models.CharField(max_length=50)  # E.g., "Bike", "Car"
    multiple_deliveries = models.PositiveIntegerField(null=True, blank=True)  # Allowing null for optional data
    festival = models.CharField(max_length=50, null=True, blank=True)  # E.g., "Diwali", "None"
    city = models.CharField(max_length=100)  # E.g., "Delhi", "Mumbai"
    time_taken = models.PositiveIntegerField()  # Delivery time in minutes

    def __str__(self):
        return f"Delivery ID: {self.id} | City: {self.city}"

class RegressionResult(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    degree = models.IntegerField()  # Degree of the polynomial
    coefficients = models.JSONField()  # List of coefficients
    intercept = models.FloatField()
    mean_squared_error = models.FloatField()
    predictions = models.JSONField()  # List of predicted values
    actuals = models.JSONField()  # List of actual target values

    def __str__(self):
        return f"Polynomial Regression (Degree {self.degree}) - {self.created_at}"

class ClusteringResult(models.Model):
    point_id = models.IntegerField()  # ID or index of the data point
    cluster = models.IntegerField()  # Cluster ID
    delivery_location_latitude = models.FloatField()  # Feature 1
    delivery_location_longitude = models.FloatField()  # Feature 2
    distance_from_centroid = models.FloatField(null=True, blank=True)  # Optional

    def __str__(self):
        return f"Point {self.point_id} in Cluster {self.cluster}"
