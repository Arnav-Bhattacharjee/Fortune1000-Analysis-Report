# exploratory_analysis.R

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

# Load the cleaned data
fortune_data <- read_csv("/Users/arnavbhattacharjee/Desktop/Programming Applications/Fortune1000/fortune1000.csv")

# Check the column names
colnames(fortune_data)

# Summary statistics
summary(fortune_data)

# Top 10 companies by revenue
top_10_revenue <- fortune_data %>%
  arrange(desc(revenue)) %>%
  head(10)

print(top_10_revenue)

# Top 10 companies by profit (assuming the column is named 'Profit')
top_10_profit <- fortune_data %>%
  arrange(desc(profits)) %>%
  head(10)

print(top_10_profit)

# Revenue distribution
ggplot(fortune_data, aes(x = revenue)) +
  geom_histogram(binwidth = 1e9, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Revenue among Fortune 1000 Companies",
       x = "Revenue (in billions)", y = "Number of Companies")

# Profit distribution (assuming the column is named 'Profit')
ggplot(fortune_data, aes(x = profits)) +
  geom_histogram(binwidth = 1e9, fill = "green", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Profit among Fortune 1000 Companies",
       x = "Profit (in billions)", y = "Number of Companies")

