library(readxl)
library(dplyr)
library(ggplot2)


dataset <- read_excel("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Annex 1 - REACH TEST DATA.xlsm", sheet = 1)


handwashing_summary <- dataset %>%
  group_by(data_collection_round, handwashingfull) %>%
  summarise(n = n()) %>%
  mutate(prop = n / sum(n) * 100) %>%
  ungroup()


ggplot(handwashing_summary, aes(x = data_collection_round, y = prop, fill = handwashingfull)) +
  geom_col(position = "dodge") +
  labs(title = "Percentage of Handwashing by Data Collection Round",
       x = "Data Collection Round",
       y = "Percentage",
       fill = "Handwashing") +
  theme_minimal()


ggsave("C:/Users/tabwerinofa/OneDrive - International Organization for Migration - IOM/Desktop/Impact Test 2024/Taurai Test/handwashing_percentage_plot.png")