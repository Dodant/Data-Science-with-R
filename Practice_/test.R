df_fruits <- data.frame(prod = c('apple', 'strawberry', 'watermelon'),
                        price = c(1800, 1500, 3000),
                        quan = c(24, 38, 13))
df_fruits

mean(df_fruits$price)
mean(df_fruits$quan)

mpg = as.data.frame(ggplot2::mpg)
mpg <- rename(mpg, city = cty, highway = hwy)
View(mpg)
