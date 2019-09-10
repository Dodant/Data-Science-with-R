mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  mutate(tot = (cty + hwy)/2) %>% 
  filter(class == "complact" | class == "suv") %>% 
  group_by(class) %>% 
  summarise(mean_tot = mean(tot))

mpg$avr <- (mpg$cty + mpg$hwy)/2
aggregate(data=mpg[mpg$class == c("compact", "suv"),], avr~class, mean)
