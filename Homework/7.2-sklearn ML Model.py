import pandas as pd
import numpy as np
df = pd.read_excel("House Price India.xlsx")
df = df.rename(columns = {
    "date": "Date",
    "number of bedrooms": "number_of_bedroom",
    "number of bathrooms": "number_of_bathroom",
    "living area": "living_area",
    "lot area": "lot_area",
    "number of floors": "number_of_floor",
    "waterfront present": "waterfront_present",
    "number of views": "number_of_view",
    "condition of the house": "condition_of_the_house",
    "grade of the house": "grade_of_the_house",
    "Area of the house(excluding basement)": "area_of_the_house",
    "Area of the basement": "area_of_basement",
    "Built Year": "built_year",
    "Renovation Year": "renovation_year",
    "Postal Code": "postal_code",
    "Lattitude": "lt_tude",
    "Longitude": "ln_tude",
    "Number of schools nearby": "number_of_school_nearby",
    "Distance from the airport": "distance_from_the_airport",
    "Price": "price"
})
df["norm_price"] = np.log(df["price"])
from sklearn.model_selection import train_test_split
# prepare data
x = df[ ["number_of_bedroom", "number_of_bathroom", "living_area", "lot_area", "number_of_floor", "waterfront_present", "number_of_view", "condition_of_the_house", "area_of_the_house"] ]
y = df[["norm_price"]]
# split data 70% train, 30% test
# set.seed(11)
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.3, random_state = 11)

from sklearn.linear_model import LinearRegression
# train model
model = LinearRegression()
model.fit(x_train, y_train)
# test model / scoring model
pred = model.predict(x_test)
# MAE mean absolute error
mae = np.mean(np.absolute((y_test - pred)))
# MSE
mse = np.mean((y_test - pred)**2)

from sklearn.tree import DecisionTreeRegressor
# train model
model2 = DecisionTreeRegressor()
model2.fit(x_train, y_train)
# test model / scoring model
pred2 = model2.predict(x_test)
# MAE mean absolute error
mae2 = np.mean(np.absolute((y_test - pred2)))
# MSE
mse2 = np.mean((y_test - pred2)**2)

from sklearn.ensemble import RandomForestRegressor
# train model
model3 = RandomForestRegressor()
model3.fit(x_train, y_train)
# test model / scoring model
pred3 = model3.predict(x_test)
# MAE mean absolute error
mae3 = np.mean(np.absolute((y_test - pred3)))
# MSE
mse3 = np.mean((y_test - pred3)**2)
