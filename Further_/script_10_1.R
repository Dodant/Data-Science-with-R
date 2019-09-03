dyn.load('/Library/Java/JavaVirtualMachines/openjdk-12.0.1.jdk/Contents/Home/lib/server/libjvm.dylib')

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(KoNLP)
library(dplyr)

useNIADic()

Sys.getenv("JAVA_HOME")
