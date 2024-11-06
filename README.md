## Members

| Name                 | UB ID     |
|----------------------|-----------|
| Apurva Banka         |  50610491 |
| Raj Kumar Alikatte   |  50600978 | 
| Patanjali Uppugandla |  50587096 | 
| Sai Harshitha Karri  |  50604558 |

# Forcaster
Using TimeSeries Forecasting To Predict Order Patterns For Restaurants

## Description

In this project we want to predict the order patterns for various restaurants using time-series forecasting. We want to explore different time-series forecasting models to understand and analyse the order patterns for specific SKUs for a particular restaurant and determine the perfect model for the use case. The models can help figure out patterns based on order volume, weather conditions, order type etc. which can then help in making better business decisions and rectifying flaws is any. Furthermore, we want to leverage recommendation system to enhance the user experience.

## Dataset

For our project, we are planning to use the "Food Delivery Dataset" available on Kaggle. The dataset consists of delivery location, order details, delivery conditions and city for a particular order. We need to filter out the required fields for specific use cases.

Link - https://www.kaggle.com/datasets/gauravmalik26/food-delivery-dataset/data


## Folder Structure

- All the reports are present in the `Report` folder. Every file is following the naming convension <First_name>_<Last_name>_<Phase_number>.pdf
- There are folders named for each individual. The folders follow the naming convension <First_name>. All the codes are inside the folder.


# Questions for Apurva Banka
- Hypothesis 1 - If the time taken for the order increases, the average rating decreases.
   - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Apurva/regression_for_rating.ipynb
   - The file contains the multiple Regression models used to fit the data.
   - The accuracy calculation is done for each model to determine the best model.
- Hypothesis 2 - If the distance increases, the time taken to deliver the order incrases.
   - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Apurva/clustering_for_coordinates.ipynb
   - The file contains different clustering models used to cluster the data points.
   - We have leaveraged Elbow method to determine the optimal number of clusters.
- Time Series Forecasting
  - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Apurva/forecasting_current_dataset.ipynb
  - The file contains implementation for Time Series Forecasting for predicting the number of orders.
  - We have used SARIMA model to predict the number of orders on a daily basis.
- Time Series Forecasting for Bigger Dataset
  - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Apurva/forecasting.ipynb
  - The file contains implementation for Time Series Forecasting for a bigger dataset.
  - Here we see the difference in continiuity of the graph when the dataset size increases.

 # Questions for Raj Kumar Alikatte
 -
 -
 -

 # Questions for Sai Harshitha Karri
 -
 -
 -

 # Questions for Patanjali Uppugandla
 -
 -
 -
