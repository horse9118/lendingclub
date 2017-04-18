library(lubridate)
library(ggplot2)
library(dplyr)
library(stringr)
library(caret)
library(rpart)
library(rattle)
library(ROSE)
library(ROCR)
library(MASS)
library(ipred)
library(plyr)
library(rpart.plot)

#Read in CSVs

data1 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats_2016Q1.csv", skip=1, header=T)
data2 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats_2016Q2.csv", skip=1, header=T)
data3 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats_2016Q3.csv", skip=1, header=T)
data4 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats_2016Q4.csv", skip=1, header=T)
data5 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats3b.csv", skip=1, header=T)
data6 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats3c.csv", skip=1, header=T)
data7 <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\LoanStats3d.csv", skip=1, header=T)

print(head(data7))

datafile <- rbind(data1, data2, data3, data4, data5, data6, data7)

print(dim(datafile))
print(colnames(datafile))

df = subset(datafile, select=-c(id, member_id))

print(dim(df))
print(colnames(df))

write.csv(df, file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\merged_data.csv")