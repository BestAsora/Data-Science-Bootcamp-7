import requests
import pandas as pd

url = "http://universities.hipolabs.com/search?country=United States"

result = requests.get(url)

data_json = result.json()

df = pd.DataFrame(data_json)

df.to_csv("university_in_united_states")
