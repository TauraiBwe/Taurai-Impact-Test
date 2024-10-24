library(readxl)
library(dplyr)

dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex1_REACH_TEST_DATA.xlsm", sheet = 1)
check_outliers <- function(household_size) {
  # Calculate the mean and standard deviation, ignoring missing values
  mean_value <- mean(household_size, na.rm = TRUE)
  sd_value <- sd(household_size, na.rm = TRUE)
  
  
  lower_bound <- mean_value - 3 * sd_value
  upper_bound <- mean_value + 3 * sd_value
  
  
  outliers <- household_size < lower_bound | household_size > upper_bound
  
  return(outliers)
}


outliers <- check_outliers(Sheet1$household_size)