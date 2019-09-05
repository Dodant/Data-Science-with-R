install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
library(dplyr)
library(ggiraphExtra)

options(encoding = "UTF-8")
str(changeCode(korpop1))
korpop1 <- rename(korpop1, pop = 총인구_명, name = 행정구역별_읍면동)
str(changeCode(kormap1))

ggChoropleth(data = korpop1, 
             aes(fill = pop, 
                 map_id = code, 
                 tooltip = name),
             map = kormap1,
             interactive = T)
