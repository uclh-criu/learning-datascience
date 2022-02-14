# exploring CCHIC data

# 2021 - this script came from an earlier version of the course
# it may not add much to what we've done already

# Load necessary libaries ====
# install.packages() needed if packages haven't been installed before
library(tidyverse) # loads collection of useful packages
library(Hmisc) # Useful functions for describing data
library(DescTools) # Useful functions for describing data
library(lubridate) # for working with dates

# check working directory is set ===
getwd()

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
  select(sex, gender2, age_years, los, los_num, vital_status)

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

ggplot(
  data = cchic,
  mapping = aes(
    x = age_years,
    y = los_num,
    shape = random,
    color = sex
  )
) +
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
