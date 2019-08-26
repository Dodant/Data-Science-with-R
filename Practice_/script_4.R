eng <- c(90,80,60,70)
math <- c(50,60,100,20)

df_mid <- data.frame(eng, math)
df_mid

class <- c(1,1,2,2)

df_mid <- data.frame(eng, math, class)
df_mid

mean(df_mid$eng)
mean(df_mid$math)

df_mid <- data.frame(eng = c(90,80,60,70),
                     math = c(50,60,100,20),
                     class = c(1,1,2,2))
df_mid



install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$math)

df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

df_csv_exam <- read.csv("csv_exam.csv")
# df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_csv_exam

write.csv(df_mid, file = "df_mid.csv")
save(df_mid, file = "df_midterm.rda")
rm(df_mid)
load("df_midterm.rda")
df_mid

# df_exam <- read_excel("excel_exam.xlsx")
# df_csv_exam <- read.csv("csv_exam.csv")
# load("df_midterm.rda")