install.packages("purrr")
library(readxl)
library(purrr)


dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA.xlsm", sheet = 1)

# Count 
na_counts <- map(dataset, ~sum(is.na(.)))

# Display the result
print(na_counts)