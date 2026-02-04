library(tidyverse)
library(dplyr)
n<-read.csv("~/Desktop/UNIMIB/DATA_SCIENCE/DataVis/StudentPerformanceFactors.csv") #file directory
getwd()
anyNA(n) #check to see if there are any NAs
summary(n) #statistics for every column
null<-filter(n,Teacher_Quality=="")
n$gruppi<-ifelse(n$Hours_Studied<=10,"0-10",ifelse(n$Hours_Studied<=20,"11-20",ifelse(n$Hours_Studied<=30,"21-30","30+"))) #hours studied levels



n$Previous_Level <- ifelse(
  n$Previous_Scores <= 63, "Low",
  ifelse(
    n$Previous_Scores < 88, "Medium",
    "High"
  )
) #previous scores levels



n$Score_Groups<-ifelse(
  n$Exam_Score <= 65, "1",
  ifelse(
    n$Exam_Score < 70, "2",
    "3"
  )) #score levels

n<-as.data.frame(n)
ggplot(n,aes(x=Score_Groups))+geom_bar(fill = "#4E79A7")
n$Previous_Level <- ifelse(
  n$Previous_Scores <= 63, "1",
  ifelse(
    n$Previous_Scores < 88, "2",
    "3"
  )
) #numeric labels for different levels

n$Study_level<-ifelse(n$Hours_Studied<10,"1",ifelse(n$Hours_Studied<20,"2",ifelse(n$Hours_Studied<30,"3","4")))

write.csv(n,file="StudentPerformanceFactors_final.csv",row.names = FALSE)









