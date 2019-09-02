library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare <- raw_welfare
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
welfare$age <- 2015 - welfare$birth + 1
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))

sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income))

head(sex_age)

ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) +
  geom_line()


#### test
female <- sex_age %>% 
  filter(!is.na(mean_income) & sex == "female") %>% 
  select(-sex)
female <- rename(female, female_income = mean_income)
head(female)

male <- sex_age %>% 
  filter(!is.na(mean_income) & sex == "male") %>% 
  select(-sex)
male <- rename(male, male_income = mean_income)
head(male)

total <- left_join(male, female, by = "age")
head(total)

total <- total %>% 
  mutate(gap = male_income - female_income)

ggplot(data = total, aes(x = age, y = gap)) +
  geom_line()
