rm(list=ls()) # get rid of all previously stored data
library(ggplot2)

heart_data <- read.csv("heart.csv", header = TRUE) # load data
str(heart_data)
summary(heart_data)
cor(heart_data)

# does gender have an effect on heart rate?
male <- subset(heart_data, sex == 1)
female <- subset(heart_data, sex == 0)

mean(male$thalachh, na.rm = TRUE)
mean(female$thalachh, na.rm = TRUE)

# what about chances on having a heart attack?
length(which(male$output == 1))
length(which(female$output == 1))


# does age play a role in the chance of a heart attack?
more_likely <- subset(heart_data, output == 1)
less_likely <- subset(heart_data, output == 0)

mean(more_likely$age, na.rm = TRUE)
mean(less_likely$age, na.rm = TRUE)

# which chest pain types have the greatest effect on the chances of a heart attack?
ggplot(heart_data, aes(x = age, fill = factor(output))) + 
  geom_bar(width = 0.8) + 
  facet_wrap(~cp) + 
  ggtitle("Chest pain type") + 
  xlab("Age") +
  ylab("Total count") +
  labs("Chances of a heart attack")

# does cholestrol have an effect on maximum heart rate?
higher_heartrate <- heart_data[which(heart_data$thalachh > mean(heart_data$thalachh)),]
lower_heartrate <- heart_data[which(heart_data$thalachh < mean(heart_data$thalachh)), ]
mean(higher_heartrate$chol)
mean(lower_heartrate$chol)

# relationship between blood sugar and max heart rate?
higher_bs <- heart_data[which(heart_data$fbs == 1), ]
lower_bs <- heart_data[which(heart_data$fbs == 0), ] 

mean(higher_bs$thalachh) # no relationship
mean(lower_bs$thalachh)

# what about chances of a heart attack?
length(which(higher_bs$output == 1))
length(which(lower_bs$output == 0))


# how does rest_ecg affect chances of heart attack? 
ggplot(heart_data, aes(x = age, fill = factor(output))) + 
  geom_bar(width = 1) + 
  facet_wrap(~restecg) + 
  ggtitle("Resting electrocardiographic results") + 
  xlab("Age") +
  ylab("Total count") +
  labs("Chances of a heart attack")

# does the number of major vessels increase the chances of a heart attack?

table(heart_data[which(heart_data$caa == 1), ]$output)
table(heart_data[which(heart_data$caa == 2), ]$output)
table(heart_data[which(heart_data$caa == 3), ]$output)

# does age have any relation to cholestrol levels?
ggplot(heart_data, aes(age, chol)) + geom_col()
# does old age affect whether the patient has exercise induced agina?
mean(subset(heart_data, exng == 1)$age)# has exng
mean(subset(heart_data, exng == 0)$age) # doesnt have exng

# relationship between blood pressure and chances of heart attack
summary(subset(heart_data, output == 1)$trtbps)
summary(subset(heart_data, output == 0)$trtbps)
