library(readr)
titanic_orginal1 <- read_csv("~/Downloads/titanic_orginal1.csv")
View(titanic_orginal1)

titanic_orginal1
str(titanic_orginal1)

#1 Port of embarkation
is.na(titanic_orginal1$embarked)

titanic_orginal1$embarked[which(is.na(titanic_orginal1$embarked))] <- "S"

#AGE
titanic_orginal1$age[which(is.na(titanic_orginal1$age))] <- mean(titanic_orginal1$age, na.rm = TRUE)
# I dont think mean is the best way to go essentially but you could always take take out a certain subset of ages and replace them
# for outliers essentially

# Lifeboat

titanic_orginal1$boat[which(is.na(titanic_orginal1$boat))] <- "None"

# Cabin

titanic_orginal1$has_cabin_number <- ifelse(is.na(titanic_orginal1$cabin),0,1)

# Since these are string characters and it would be impossible to match the missing number, I dont think its useful
# It seems to me that missing cabin numbers means that this is an indication of the lower class seatings who didnt
# have cabins but some sort of other arrangement.
