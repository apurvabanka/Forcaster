from django.contrib import admin
from import_export.admin import ImportExportActionModelAdmin
from delivery.models import DeliveryRecord

admin.site.register(DeliveryRecord, ImportExportActionModelAdmin)