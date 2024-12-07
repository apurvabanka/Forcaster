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

- `reports`
    - All the reports are present in the `reports` folder. Every file is following the naming convension <First_name>_<Last_name>_<Phase_number>.pdf
    - There is a final report present inside the `reports` folder by the name `FINAL_REPORT.pdf`. This should have the compilation of all the phases.
- `forecaster-analytics`
    - This folder contains all the data cleaning, EDA, hypothesis and Modeling code in the IPYNB file.    
    - There are folders named for each individual. The folders follow the naming convension <First_name>.
    - All the codes are inside the folder.
- `forecaster_app`
    - This folder contians the front-end code for the application.
    - The code base used is Flutter.
    - The use case for the hypothesis are included in the UI. You need to navigate to the Analytics Tab.
- `forecaster_backend`
    - This folder contians the back-end code for the application.
    - The code base used is Django.
    - The code contains the Dataset, Models and API for the hypothesis.

# Demo Video

- A demo video is included in the repository by the name `demo_video.mov`.

![Video Preview](demo_video.mov)

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
 - Hypothesis 1 - Motorcycles are able to do multiple deliveries compare to bicycle, electric_scooter and scooter.
   - code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Raj/Rajkumar_Alikatte_Phase2.ipynb
   - The file contains the logistic regression from the class
   - The file contains the Multinomial logistic regression which is from outside of the class
 - Hypothesis 2 - The Weather conditions impact the time taken to deliver
   - code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Raj/Rajkumar_Alikatte_Phase2.ipynb
   - The file contains the Naive Bayes from the class
   - The file contains the DBSCAN Clustering Algorithm from the outside of the class

 
 # Questions for Sai Harshitha Karri
 - Hypothesis 1 -The multiple deliveries are among afternoon, morning and evening times.
   - code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Harshita/Harshitha_DIC_project_phase_2.ipynb
   - In this file implemented ANOVA from outside of the class
   - In this file implemented KNN from the class
 - Hypothesis 2 -Customers in urban areas leave lower ratings compared to suburban areas.
   - code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Harshita/Harshitha_DIC_project_phase_2.ipynb
   - In this file implemented Random Forest which is inside from the class
   - In this file implemented Gradient Boosting Regressor from the outside of the class
 
 # Questions for Patanjali Uppugandla
 - Hypothesis 1 - The delivery timings in the Evening would be higher compared to other parts of the day (like Morning, Afternoon, Night), especially when road 
   traffic density is high or multiple deliveries are being handled by the delivery person.
 - The file implements Decision tree, XGBoost classifier for hypothesis-1
 - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Patanjali/Patanjai_Uppugandla_50587096_phase2.ipynb
 - Hypothesis 2 - The Order preparation time for various types of orders would be longer in the peak hours, day, how far the restaurant is located from the ordered 
   place and the weather.
 - The file implements Logistic regression, LSTM
 - Code Analysis - https://github.com/apurvabanka/Forcaster/blob/main/Patanjali/Patanjai_Uppugandla_50587096_phase2.ipynb

# Instruction to build the app from the source code

- Make sure you have Docker installed on your machine.
- Clone the repository.
```CMD
git clone https://github.com/apurvabanka/Forcaster.git
```
- CD into the cloned folder. Run the below command.
```CMD
docker compose up --build
```
- This should run the backend and the frontend.
- Go to the following URL. http://127.0.0.1:3000/
