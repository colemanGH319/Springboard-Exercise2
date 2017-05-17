library(dplyr)
library(tidyr)
library(readr)

titanic_original <- read_csv("~/Springboard/Springboard-Exercise2/titanic_original.csv")

#Replace missing values in embarked column
titanic_original <- titanic_original %>% replace_na(list(embarked = "S"), embarked)

#Replace missing values in age column with mean age
mean_age <- mean(titanic_original$age, na.rm = TRUE)

titanic_original <- titanic_original %>% replace_na(list(age = mean_age), age)

#Regarding other ways to calculate missing age values - median age may
#be a better method for estimating the missing values. However, calling median on
#the age column reveals that mean and median are actually very similar values
#(median is 28 vs mean of 29.88)

#Fill in missing lifeboat numbers with "none"
titanic_original <- titanic_original %>% replace_na(list(boat = "None"), boat)

#Create a column indicating whether a cabin number was assigned
titanic_original <- titanic_original %>% mutate(has_cabin_number = (as.integer(!is.na(cabin))))

#Save as csv
write.csv(titanic_original, file = "titanic_clean.csv")
