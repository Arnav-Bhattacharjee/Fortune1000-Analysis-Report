# visualization.R

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(ggcorrplot)

# Load the cleaned data
fortune_data <- read_csv("/Users/arnavbhattacharjee/Desktop/Programming Applications/Fortune1000/fortune1000.csv")

# Correlation matrix
cor_matrix <- fortune_data %>%
  select_if(is.numeric) %>%
  cor()

ggcorrplot(cor_matrix, hc.order = TRUE, type = "lower", lab = TRUE)

# Revenue vs. Profit
ggplot(fortune_data, aes(x = revenue, y = profits)) +
  geom_point(alpha = 0.6, color = "darkred") +
  theme_minimal() +
  labs(title = "Revenue vs. Profit", x = "Revenue (in billions)", y = "Profit (in billions)")

# Revenue distribution by sector (assuming there is a 'sector' column)
ggplot(fortune_data, aes(x = sector, y = revenue)) +
  geom_boxplot(fill = "orange", color = "black") +
  theme_minimal() +
  coord_flip() +
  labs(title = "Revenue Distribution by Sector",
       x = "Sector", y = "Revenue (in billions)")

