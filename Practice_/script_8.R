library(ggplot2)

ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  xlim(3,6) +
  ylim(10,30)


df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + 
  geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) + 
  geom_col()

ggplot(data = mpg, aes(x = drv)) + 
  geom_bar()
ggplot(data = mpg, aes(x = hwy)) + 
  geom_bar()


ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()
ggplot(data = economics, aes(x = date, y = psavert)) +
  geom_line()


ggplot(data = mpg, aes(x = drv, y = hwy)) + 
  geom_boxplot()
