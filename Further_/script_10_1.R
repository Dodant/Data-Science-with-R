library(rJava)
library(KoNLP)
library(dplyr)

useNIADic()

txt <- readLines(file("hiphop.txt", encoding = "EUC-KR"))
head(txt)

install.packages("stringr")
library(stringr)
