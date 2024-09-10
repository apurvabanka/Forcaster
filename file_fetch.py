import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset from the URL
url = 'https://covid.ourworldindata.org/data/owid-covid-data.csv'
df = pd.read_csv(url)

# Display first few rows and metadata
print(df.head())
print(df.info())