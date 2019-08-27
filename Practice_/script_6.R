library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

exam %>% filter(class == 1)
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)

exam %>% filter(math >= 90 | english >= 80)
exam %>% filter(math < 90 | science < 50)

exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)
mean(class2$math)


exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)

exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>% 
  select(english)
exam %>% 
  select(id, math) %>% 
  head
exam %>% 
  select(id, math) %>% 
  head(10)


exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)


exam %>% 
  mutate(total = math + english + science,
         mean = total / 3) %>% 
  head
exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(desc(total)) %>% 
  head


exam %>% summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
