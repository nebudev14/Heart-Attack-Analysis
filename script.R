rm(list=ls()) # get rid of all previously stored data

heart_data <- read.csv("heart.csv", header = TRUE) # load data
str(heart_data)


# does gender have an effect on heart rate?
male <- subset(heart_data, sex == 1)
female <- subset(heart_data, sex == 0)

mean(male$thalachh, na.rm = TRUE)
mean(female$thalachh, na.rm = TRUE)