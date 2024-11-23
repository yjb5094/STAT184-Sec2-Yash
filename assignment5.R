library(tidyverse)
library(readr)

armed_forces_data <- read_csv("/Users/yashbotre/Downloads/armed_forces_data.csv")
pay_grade_rank_data <- read_csv("/Users/yashbotre/Downloads/pay_grade_rank_data.csv")

glimpse(armed_forces_data)
View(armed_forces_data)
str(armed_forces_data)

grouped_soldiers <- armed_forces_data %>%
  select(Branch, Pay_Grade, Gender, Total) %>%
  group_by(Branch, Pay_Grade, Gender) %>%
  summarize(Total_Soldiers = sum(Total))

individual_soldiers <- grouped_soldiers %>%
  uncount(Total_Soldiers)

final_data <- individual_soldiers %>%
  left_join(pay_grade_rank_data, by = "Pay_Grade")

write_csv(grouped_soldiers, "grouped_soldiers_data.csv")
write_csv(final_data, "individual_soldiers_data.csv")

glimpse(final_data)
head(final_data)
summary(final_data)

