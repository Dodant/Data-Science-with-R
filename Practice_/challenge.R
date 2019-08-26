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
