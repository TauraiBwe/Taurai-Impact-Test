# Load necessary library for Excel file handling
library(tidyverse)
library(readxl)
library(writexl)

# Load the Excel file
file_path <- "C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA - Copy.xlsm"
df <- read_excel(file_path, sheet = "SHeet2")

# Create the new column 'handwashing_check'
df$handwashing_check <- (df$handwashingfull == "No Handwashing facility") & 
  (df$Frequency.respondant.report.handwhashing.a.day == "7 times and more")

# Save the dataframe with the new column to a new Excel file
output_path <- "C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/REACH_DATA_with_handwashing_check.xlsx"
write_xlsx(df, output_path)
