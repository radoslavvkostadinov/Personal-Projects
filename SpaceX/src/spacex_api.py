import requests
import pandas as pd

response = requests.get('https://api.spacexdata.com/v5/launches')
data = response.json()

df = pd.DataFrame(data)
print(df.head(5))
