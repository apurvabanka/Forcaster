from django.contrib import admin
from import_export.admin import ImportExportActionModelAdmin
from delivery.models import PredictionResult, DeliveryRecord

admin.site.register(DeliveryRecord, ImportExportActionModelAdmin)
admin.site.register(PredictionResult)
