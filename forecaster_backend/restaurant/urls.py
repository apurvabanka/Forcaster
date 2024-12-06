from django.urls import path
from .views import (
    run_and_save_regression,
    run_and_save_clustering,
    list_regression_results,
    list_clustering_results,
)

urlpatterns = [
    path('run-regression/', run_and_save_regression, name='run_and_save_regression'),
    path('run-clustering/', run_and_save_clustering, name='run_and_save_clustering'),
    path('list-regression-results/', list_regression_results, name='list_regression_results'),
    path('list-clustering-results/', list_clustering_results, name='list_clustering_results'),
]
