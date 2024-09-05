# modeling.R

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(caret)

# Load the cleaned data
fortune_data <- read_csv("/Users/arnavbhattacharjee/Desktop/Programming Applications/Fortune1000/fortune1000.csv")

# Simple linear regression model to predict profit based on revenue
model <- lm(profits ~ revenue, data = fortune_data)

# Model summary
summary(model)

# Predict profit using the model
fortune_data <- fortune_data %>%
  mutate(predicted_profit = predict(model, newdata = fortune_data))

# Plot actual vs. predicted profit
ggplot(fortune_data, aes(x = profits, y = predicted_profit)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +
  theme_minimal() +
  labs(title = "Actual vs. Predicted Profit",
       x = "Actual Profit", y = "Predicted Profit")

