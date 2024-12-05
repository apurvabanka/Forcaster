from django.contrib import admin
from import_export.admin import ImportExportActionModelAdmin
from delivery.models import ClusteringResult, DeliveryRecord, RegressionResult

admin.site.register(DeliveryRecord, ImportExportActionModelAdmin)
admin.site.register(RegressionResult)
admin.site.register(ClusteringResult)