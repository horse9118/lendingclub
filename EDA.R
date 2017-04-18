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
library(lsr)

merged_data <- read.csv(file="C:\\Users\\Bob Liu\\GA\\lendingclub\\data\\merged_data.csv", header=T)

print(colnames(merged_data))

count(merged_data, 'loan_status')

#extract columns

df <- subset(merged, select = c(
  loan_amnt
  ,term
  ,int_rate
  ,dti
  ,open_acc
  ,installment
  ,grade
  ,sub_grade
  ,emp_length
  ,loan_status
  ,addr_state
  ,annual_inc
  ,revol_bal
  ,purpose
  ,loan_status))

df$int_rate <- as.numeric(gsub("[%]", "", df$int_rate))
df$dti <- as.numeric(gsub("[%]", "", df$dti))

# Replacing employment length of <1 year with 0, 10+ years with 10, and n/a
# with mean of the column
df[df[, 14] == "< 1 year", 14] <- 0
df[df[, 14] == "10+ years", 14] <- 10

df$emp_length <- gsub(" years| year", "", df$emp_length)
df$emp_length <- as.numeric(df$emp_length)
df[is.na(df$emp_length), 14] <- mean(df$emp_length, na.rm = T)
summary(df)
sapply(df, function(x) sum(is.na(x)))
df[which(is.na(df$open_acc)), ]

#correlation
cor(df[, sapply(df, class) != "factor"])

pairs(df[, sapply(df, class) != "factor"])

summary(lm(df$int_rate ~ df$revol_bal + data$open_acc + 
             df$dti))

df <- df[-c(8, 12, 13)]
plot(df$int_rate ~ df$term)

plot(data$int_rate ~ data$purpose)




