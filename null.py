import pandas as pd

# Sample DataFrame
# Ensure that "Time Ordered" and "Time Packed" columns are datetime objects
df['Time_Orderd'] = pd.to_datetime(df['Time_Orderd'], errors='coerce')
df['Time_Order_picked'] = pd.to_datetime(df['Time_Order_picked'], errors='coerce')

# Step 1: Calculate the time difference where "Time Ordered" is not NULL
df['Time_Difference'] = df['Time_Order_picked'] - df['Time_Orderd']

# Step 2: Calculate the average time difference (exclude rows where Time Ordered is NULL)
average_time_diff = df['Time_Difference'].mean()

# Step 3: Replace NULL values in "Time Ordered" by subtracting the average time difference from "Time Packed"
df['Time_Orderd'] = df.apply(
    lambda row: row['Time_Order_picked'] - average_time_diff if pd.isnull(row['Time_Orderd']) else row['Time_Orderd'],
    axis=1
)

# Drop the Time_Difference column if it's no longer needed
df.drop('Time_Difference', axis=1, inplace=True)

# Display the updated DataFrame
print(df[['Time_Orderd', 'Time_Order_picked']])