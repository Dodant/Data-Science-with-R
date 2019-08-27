df_fruits <- data.frame(prod = c('apple', 'strawberry', 'watermelon'),
                        price = c(1800, 1500, 3000),
                        quan = c(24, 38, 13))
df_fruits

mean(df_fruits$price)
mean(df_fruits$quan)

mpg = as.data.frame(ggplot2::mpg)
mpg <- rename(mpg, city = cty, highway = hwy)
View(mpg)


displ4 <- mpg %>% filter(displ <= 4)
displ5 <- mpg %>% filter(displ >= 5)
mean(displ4$highway)
mean(displ5$highway)

audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$city)
mean(toyota$city)

high <- mpg %>% filter(manufacturer %in% c("chervolet", "ford", "honda"))
mean(high$highway)


mpg_cc <- mpg %>% select(class, city)
mpg_cc

mpg_cc_suv <- mpg_cc %>% filter(class == "suv")
mpg_cc_com <- mpg_cc %>% filter(class == "compact")
mean(mpg_cc_suv$city)
mean(mpg_cc_com$city)


mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(highway)) %>% 
  head(5)


mpg <- mpg %>% mutate(sum = city + highway)
mpg <- mpg %>% mutate(sum = city + highway,
                      mean = sum / 2)
mpg %>% 
  arrange(desc(mean)) %>% 
  head(3)
mpg %>% 
  mutate(sum = city + highway,
               mean = sum / 2) %>% 
  arrange(desc(mean)) %>% 
  head(3)


mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_city = mean(city))
