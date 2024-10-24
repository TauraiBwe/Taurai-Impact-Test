
library(readxl)
library(dplyr)


dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA.xlsm")


cleaning_log <- read_xlsx("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/cleaninglog.xlsm")


# Function to apply changes based on cleaning log
apply_changes <- function(dataset, cleaning_log) {
  for (i in 1:nrow(cleaning_log)) {
    interview_id <- cleaning_log$InterviewID[i]
    variable <- cleaning_log$variable[i]
    old_value <- cleaning_log$old.value[i]
    new_value <- cleaning_log$new.value[i]
    
    # Apply the change
    dataset <- dataset %>%
      mutate(!!sym(variable) := ifelse(InterviewID == interview_id & !!sym(variable) == old_value, new_value, !!sym(variable)))
  }
  return(dataset)
}

# Apply the changes
cleaned_dataset <- apply_changes(dataset, cleaning_log)


write_xlsx(cleaned_dataset, "C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/cleaned_dataset.xlsm", row.names = FALSE)