# PROJECT TITLE - “Playing with CCHIC data”

# Description ====
# This is a template for doing data analysis in R
# Author:
# Start Date:
# Version: 0.5

# To Do List ====
# [x] Finish this file
# [x] Get feedback from course attendees on file
# [ ] Do an exploratory analysis using plots to visualise the data


# Before using this script, I will set up a folder structure that looks like this:
# |- my_project
#     |- data (folder containing any raw data for the project)
#         |- clean_data.csv
#     |- scripts (folder containing any scripts)
#         |- primary.r (note, this is THIS script)
#     |- plots (folder to output all my plots)
#     |- resources (a common resources folder)
#     |- manuscripts (a folder to output my formatted manuscripts)
#     readme.r (lives in my main directory and contains a dictionary of weird stuff that I might forget)

# Load necessary libaries ====
# install.packages() i'll need this function if I haven't downloaded the package yet
library(readr)     # to allow you to ‘read’ csv files and load into R
library(tidyverse)  # loads in everything I tend to use on a daily basis
library(Hmisc)      # Useful functions for describing data
library(DescTools)  # Useful functions for describing data
library(lubridate) #for working with dates
library(dplyr)     # to wrangle data
library(ggplot2)   # data visualisation
library(stringr)   #working with string

# Make sure my working directory is set ===
getwd()
# can use setwd() to change if needed

# Import data ==== cchic can be changed to the name of other data you will work on
cchic <- read_csv(file.choose())

# Clean/Wrangle data ====
# will need to use a combination of:
#   select() - to select columns of data
#   filter() - to filter rows of data
#   Any other functions from the dplyr library
summary(cchic)
head(cchic)
tail(cchic)
describe(cchic)
Desc(cchic)

# Select a subset of the data
cchic_small <- cchic %>% 
  select (sex, gender2, age_years, los, los_num, vital_status)

# modify a single column to a different data type
cchic_small$sex <- as.factor(cchic$sex)

# Changing multiple columns at once:
# We'll use the "mutate at" function

cchic <- cchic %>%
  mutate_at(vars(vital_status, temp_c), funs(as.factor))

# Remember the pipe "%>%" forces whatever is on the left,
# into the first arugment position of the function on its right

# Plot data ====
# will need to use ggplot2 to visually inspect data. The basic syntax is:

ggplot(data = cchic,
       mapping = aes(x = age_years,
                     y = los_num,
                     shape = random,
                     color = sex)) +
  geom_point() +
  ggtitle("Fun with Plots") +
  theme_bw()

# A reminder that ggplot2 takes data in the following format:
# ggplot(data = my_data,
#        mapping = aes(x = some_column_name_1,
#                     y = some_column_name_2)) + 
#   geom_point()

# Apply some stats ====
t.test(cchic$height, cchic$vital_status)

# Why does the above work/not work?
