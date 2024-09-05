# data_cleaning.R

# Load necessary libraries
library(dplyr)
library(tidyr)
library(readr)
library(stringr)

# Load the data
fortune_data <- read_csv("/Users/arnavbhattacharjee/Desktop/Programming Applications/Fortune1000/fortune1000.csv")

# View the first few rows of the data
head(fortune_data)

# Clean column names (optional, depending on the structure)
fortune_data <- fortune_data %>%
  rename_with(~ str_replace_all(., " ", "_")) %>%
  rename_with(~ tolower(.))

# Handle missing values
fortune_data <- fortune_data %>%
  drop_na()  # Drops rows with any NA values

# Clean up specific columns (assuming columns like 'revenue' might need numeric conversion)
fortune_data <- fortune_data %>%
  mutate(across(contains("revenue"), ~ as.numeric(str_replace_all(., ",", ""))),
         across(contains("profit"), ~ as.numeric(str_replace_all(., ",", ""))))

# Save cleaned data to a new CSV file
write_csv(fortune_data, "/Users/arnavbhattacharjee/Desktop/Programming Applications/Fortune1000/fortune1000.csv")

