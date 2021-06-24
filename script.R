rm(list=ls()) # get rid of all previously stored data
library(ggplot2)

heart_data <- read.csv("heart.csv", header = TRUE) # load data
str(heart_data)


# does gender have an effect on heart rate?
male <- subset(heart_data, sex == 1)
female <- subset(heart_data, sex == 0)

mean(male$thalachh, na.rm = TRUE)
mean(female$thalachh, na.rm = TRUE)

# does gender have an effect on the likelyness of a heart attack
mean(male$output, na.rm = TRUE)
mean(female$output, na.rm = TRUE)

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

  