# Install and load the necessary libraries

library(readxl)
library(dplyr)

# dataset
dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA.xlsm", sheet = 1)

# list of villages
villages <- read_xlsx("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/village.xlsm")

# Merge the dataset
updated_dataset <- dataset %>%
  left_join(villages, by = c("InterviewID" = "uuid"))

# Save 
write_xlsx(updated_dataset, "C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Taurai Test/updated_dataset.xlsm")