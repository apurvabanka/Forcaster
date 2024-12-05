from django.db import models


class DeliveryRecord(models.Model):
    id = models.AutoField(primary_key=True)  # Auto-generated primary key
    Delivery_person_Age = models.PositiveIntegerField(null=True, blank=True)
    Delivery_person_Ratings = models.FloatField(null=True, blank=True)
    Restaurant_latitude = models.FloatField()
    Restaurant_longitude = models.FloatField()
    Delivery_location_latitude = models.FloatField()
    Delivery_location_longitude = models.FloatField()
    Time_Orderd = models.DateTimeField(null=True, blank=True)
    Time_Order_picked = models.DateTimeField(null=True, blank=True)
    Time_taken_min = models.FloatField()  # Delivery time in minutes
    Prep_time_min = models.FloatField(null=True, blank=True)  # Order preparation time in minutes
    Type_of_order = models.CharField(max_length=100)  # E.g., "Food", "Drinks"
    multiple_deliveries = models.PositiveIntegerField(null=True, blank=True)
    weather_conditions = models.CharField(max_length=100, null=True, blank=True)  # E.g., "Sunny", "Rainy"
    road_traffic_density = models.CharField(max_length=50, null=True, blank=True)  # E.g., "Low", "Medium", "High"
    distance = models.FloatField(null=True, blank=True)  # Distance in kilometers
    type_of_vehicle = models.CharField(max_length=50, null=True, blank=True)  # E.g., "Bike", "Car"
    Time_of_day = models.CharField(max_length=50, null=True, blank=True)  # Morning, Afternoon, Evening, Night

    def __str__(self):
        return f"Delivery ID: {self.id} | Type: {self.Type_of_order} | Time Taken: {self.Time_taken_min}"


class PredictionResult(models.Model):
    id = models.AutoField(primary_key=True)
    created_at = models.DateTimeField(auto_now_add=True)
    input_features = models.JSONField()  # Storing the features used for prediction
    predicted_prep_time = models.FloatField(null=True, blank=True)
    predicted_delivery_time = models.FloatField()

    def __str__(self):
        return f"Prediction - {self.created_at}: Prep Time: {self.predicted_prep_time} | Delivery Time: {self.predicted_delivery_time}"
