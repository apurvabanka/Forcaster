"""
URL configuration for forecaster_backend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from xml.etree.ElementInclude import include
from django.contrib import admin
from django.urls import path

from delivery.views import list_clustering_results, list_regression_results, run_and_save_clustering, run_and_save_regression

urlpatterns = [
    path('admin/', admin.site.urls),
    path('run-regression', run_and_save_regression, name='run_and_save_regression'),
    path('list-regression-results/', list_regression_results, name='list_regression_results'),
    path('run-clustering', run_and_save_clustering, name='run_and_save_clustering'),
    path('list-clustering-results/', list_clustering_results, name='list_regression_results'),
]
