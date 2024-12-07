from django.db import models


class PredictionResult(models.Model):
    id = models.AutoField(primary_key=True)
    created_at = models.DateTimeField(auto_now_add=True)
    input_features = models.JSONField()  # Storing the features used for prediction
    predicted_prep_time = models.FloatField(null=True, blank=True)
    predicted_delivery_time = models.FloatField()

    def __str__(self):
        return f"Prediction - {self.created_at}: Prep Time: {self.predicted_prep_time} | Delivery Time: {self.predicted_delivery_time}"
