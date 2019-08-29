midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

midwest <- rename(midwest, total = poptotal, asian = popasian)

midwest$asianratio <- midwest$asian / midwest$total * 100
hist(midwest$asianratio)
mean(midwest$asianratio)

midwest$test <- ifelse(midwest$asianratio >= 0.4872762, "large", "small")
table(midwest$test)
qplot(midwest$test)


midwest <- midwest %>% 
  mutate(popamature = (total - popadults) / total * 100)

midwest %>% 
  arrange(desc(popamature)) %>% 
  head(5) %>% 
  select(county, popamature)

midwest <- midwest %>% 
  mutate(popamatureclass = ifelse(popamature >= 40.0, "large", 
                                  ifelse(popamature >= 30.0, "middle", "small")))
table(midwest$popamatureclass)

midwest %>% 
  mutate(popasian = asian / total * 100)%>% 
  arrange(popasian) %>% 
  select(state, county, popasian) %>% 
  head(10)
