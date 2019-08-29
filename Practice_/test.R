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
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (city + highway) / 2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)


mpg %>% 
  group_by(class) %>% 
  summarise(mean_ct = mean(city)) %>% 
  arrange(desc(mean_ct))
mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(highway)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))


fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

mpg <- left_join(mpg, fuel, by = "fl")
mpg

mpg %>% 
  select(model, fl, price_fl)


mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))


boxplot(mpg$hwy)$stats
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))


mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)

table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)

boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$hwy)
mpg %>% 
  filter(!is.na(mpg$cty))
boxplot(mpg$cty)

mpg %>% 
  filter(!is.na(mpg$cty) & !is.na(mpg$drv)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
