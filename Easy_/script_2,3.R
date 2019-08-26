install.packages("ggplot2")
library(ggplot2)

x <- c("a", "b", "c", "d", "a")
qplot(x)

qplot(data = mpg, x = hwy)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg, x = drv, y = hwy, geom = "line")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

?qplot
