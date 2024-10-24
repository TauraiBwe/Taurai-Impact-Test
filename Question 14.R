# Install and load the necessary libraries
install.packages("readxl")
install.packages("dplyr")
library(readxl)
library(dplyr)

# Load the dataset
dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA.xlsm", sheet = 1)

# Calculate the count and proportion of the type of household for each round of data collection
summary_table <- dataset %>%
  group_by(data_collection_round, house_type) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n)) %>%
  ungroup() %>%
  arrange(data_collection_round, desc(n)) %>%
  slice(1:10)

# Display the summary table
print(summary_table)

# Save the summary table to a CSV file
write.csv(summary_table, "C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/summary_table.csv", row.names = FALSE)