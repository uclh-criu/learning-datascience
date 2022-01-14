# 1-R-taster-script.R

# select lines in turn & press Run at top right (or copy & paste into console below)

# to load packages needed
library(tidyverse)

#############################
## 1.1 read in csv to a dataframe

dfpatient <- read_csv("data//patient-data-tiny.csv")

# if the line above doesn't work, try this one : 
dfpatient <- read_csv("..//data//patient-data-tiny.csv")


########################
## 1.2 look at the data in R

str(dfpatient)  #structure
head(dfpatient) #first 5 rows
#display as table in RStudio (you can also click on the object name in the Environment tab, top right)
View(dfpatient) 


#####################
## 1.3 create new columns

## calculate length of stay & age
dfpatient$visit_mins <- dfpatient$visit_end_time - dfpatient$visit_start_time 

dfpatient$age <- 2021 - dfpatient$year_of_birth


##############################
## 1.4 make some plots with ggplot

# for a bar plot just need to specify x
ggplot(dfpatient, aes(x=discharge)) + geom_bar()

# EXERCISE: change x=discharge to other column names in the dataframe


# for points need to specify x & y
ggplot(dfpatient, aes(x=discharge, y=age)) + geom_point()


# EXERCISE: change x & y to other column names in the dataframe

# can add colour
ggplot(dfpatient, aes(x=discharge, y=age, colour=gender)) + geom_point()


# EXERCISE: change x,y & colour to other columns
