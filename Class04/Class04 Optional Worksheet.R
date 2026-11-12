source("http://thegrantlab.org/misc/cdc.R")
View(cdc)
head(cdc$height)
tail(cdc$weight, 20)
library(ggplot2)
ggplot(cdc, aes(x = height, y = weight)) + 
  geom_point() + 
  labs(x = "Height (inches)", y = "Weight (pounds)")
cor(cdc$height, cdc$weight)
hist(cdc$weight)
hist(cdc$height)
#Create height.m
height_m <- cdc$height * 0.0254
#Create weight in kg
weight_kg <- cdc$weight * 0.454 

#BMI object
bmi <- weight_kg / (height_m^2)
ggplot(cdc, aes(x = height, y = bmi)) +
  labs(x = "Height (meters)", y = "BMI") + 
  geom_point()

cor(cdc$height, bmi)

sum(bmi >= 30)
sum(bmi >= 30) / length(bmi)
(sum(bmi >= 30) / length(bmi)) * 100
round((sum(bmi >= 30) / length(bmi)) * 100, 1)

cdc[567, 6]
cdc[1:10, 6]
cdc[1:10, ]

#First 100 values ggplot for height vs weight)
cdc_100 <- cdc[1:100,]
ggplot(cdc_100, aes(x = height, y = weight)) +
  geom_point() +
  labs(x = "Height (inches)", y = "Weight (pounds")


#Get total genders that are obese
gender_obese <- cdc$gender[bmi >= 30]
#Table splits into 2 categories
table(gender_obese)
