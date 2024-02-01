library(caret)
library(tidyverse)
library(readxl)
library(randomForest)

## import data
price_df <- read_excel("House Price India.xlsx")
View(price_df)


## visualize for checking trend
ggplot(price_df, aes(Price)) +
  geom_histogram(bins = 10, color = "red", fill = "darkblue")

## rename header name
price_df <- price_df %>%
  rename(date = Date,
         number_of_bedrooms = `number of bedrooms`,
         number_of_bathrooms = `number of bathrooms`,
         living_area = `living area`,
         lot_area = `lot area`,
         number_of_floors = `number of floors`,
         waterfont_present = `waterfront present`,
         number_of_views = `number of views`,
         condition_of_the_house = `condition of the house`,
         grade_of_the_house = `grade of the house`,
         area_of_the_house = `Area of the house(excluding basement)`,
         area_of_the_basement = `Area of the basement`,
         built_year = `Built Year`,
         renovation_year = `Renovation Year`,
         postal_code = `Postal Code`,
         lattitude = Lattitude,
         longitude = Longitude,
         number_of_schools_nearby = `Number of schools nearby`,
         distance_from_the_airport = `Distance from the airport`,
         price = Price)

## normalize data
price_df <- price_df %>%
  mutate(normalize_price = log(price))

## split data
glimpse(price_df)
train_test_split <- function(data, trainRatio=0.7) {
  set.seed(10)
  n <- nrow(data)
  id <- sample(1:n, size=trainRatio*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  list(train = train_data, test = test_data)
}

splitData <- train_test_split(price_df, 0.8)
train_data <- splitData$train
test_data <- splitData[[2]]

## train model
(lm_model <- train(normalize_price ~ area_of_the_house + area_of_the_basement + living_area +
                 number_of_bedrooms + number_of_bathrooms,
               data = train_data,
               method = "lm"))

## score model
pred <- predict(lm_model, newdata = test_data)

## evaluate model
rmse_metric <- function(actual, prediction) {
  sq_error <- (actual - prediction) ** 2
  sqrt(mean(sq_error)) ## back to normal unit
}
rmse_metric(test_data$normalize_price, pred)

## save linear regression model
saveRDS(lm_model, "linear_regression_price.RDS")

## random forest model
ctrl <- trainControl(
  method = "cv",
  number = 5,
  verboseIter =TRUE
)
(rf_model <- train(normalize_price ~ area_of_the_house + area_of_the_basement + living_area +
                    number_of_bedrooms + number_of_bathrooms,
                  data = train_data,
                  method = "rf",
                  trControl = ctrl))
pred2 <- predict(rf_model, newdata = test_data)
rmse_metric(test_data$normalize_price, pred2)
saveRDS(rf_model, "random_forest_price.RDS")

## knn model
(knn_model <- train(normalize_price ~ area_of_the_house + area_of_the_basement + living_area +
                     number_of_bedrooms + number_of_bathrooms,
                   data = train_data,
                   method = "knn",
                   trControl = ctrl))
pred3 <- predict(knn_model, newdata = test_data)
rmse_metric(test_data$normalize_price, pred3)
saveRDS(knn_model, "knn_price.RDS")
