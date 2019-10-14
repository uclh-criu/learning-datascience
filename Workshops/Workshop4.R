# Install these packages if you haven't already done so.
library(readr)
library(dplyr)
library(lubridate)
library(tidyr)
library(stringr)
library(ggplot2)

# Reading in the file. You should have this from lesson 3.
getwd()

# Remember to set this to wherever you saved your the cchic file.
setwd("")

# Set the name of the file to what it is called for you.
myfile <- ("clean_CCHIC.csv")

cchic <- read_csv(myfile)

cchic

# You now have the cchic dataset loaded into your environment.

# Using the filter command.
cchic %>%
  filter(age_years >= 65)

# Using the select command.
cchic %>%
  select(sex) # Gives you the gender variable for all patients.

# Using the filter and select commands together.

cchic %>%
  filter(age_years >= 65) %>%
  select(sex) # Gives gender for all patients >=65.

# Piping output to other functions.
cchic %>%
  group_by(sex) %>%
  summarise(mean_urea = mean(urea))
# There are missing values in the urea variable, so we need to deal with them.
cchic %>%
  group_by(sex) %>%
  summarise(mean_urea = mean(urea, na.rm = TRUE))

## Base R alternatives

# In dplyr this is what we would do.
cchic %>%
  filter(age_years >= 65) %>%
  select(sex) %>%
  summary()

# This would be the base R version.
summary(cchic[cchic$age_years >= 65, ]$sex)

# Breaking it down:

# Doing summary of variable `sex`
summary(cchic$sex)

# Selecting a subset of the cchic database to retrieve summary of `sex` vector.

summary(cchic[cchic$age_years >= 65, ]$sex)


## PAUSE## - review above functions and check you are happy



# Selection of favourite methods. You will develop your own ones too.

# 1. Rename a variable

names(cchic)

# The variable `na` looks very confusing, since missing values are called NA.
cchic <- cchic %>%
  rename(sodium = na)

names(cchic)

# 2. Creating a new variable

names(cchic)

cchic$height

# What if wanted to know the BMI?
cchic <- cchic %>%
  mutate(bmi = weight / (height / 100)^2)

summary(cchic$bmi)

# 3. Extract numbers

# These functions are from the readr library.

str(cchic$temp_nc)

# Notice that there are units in the column. We don't care about these.

cchic$temp_nc <- parse_number(cchic$temp_nc)
str(cchic$temp_nc)

# 4. Manipulating strings.

test_gender <- c("f", "F", "M", "f")

test_gender <- str_to_upper(test_gender)

test_gender


# 5. Parsing dates

# The date functions are from the lubridate package.
# R needs to be told when a string is a date.

test_dates <- c("02-01-12", "03-04-15", "15-06-02")

# Convert these characters to dates.
test_dates <- dmy(test_dates) # Telling R that this series of numbers are dates in dmy format
test_dates

ymd(test_dates) # Can change the dates to YMD format

format(test_dates, "%B") # Gives you the months in character form

format(test_dates, "%m") # Gives you month in numeric form

# Extracting components of dates.

# We can extract the year born.
cchic <- cchic %>%
  mutate(year_born = year(dmy(dob)))

table(cchic$year_born)

cchic$discharge

# Extracting the day of discharge.
cchic$discharge_days <- day(dmy(cchic$discharge)) # Can extract days

table(cchic$discharge_days)

# Calculating time intervals
# What if we wanted to know the length of stay for the patients?

cchic$los <- (dmy(cchic$discharge) - dmy(cchic$admission))

cchic$los


# 6. Columns to rows. Also known as wide to long.

str(cchic)

cchic_long <- cchic %>%
  gather("temp_point", "temperature", temp_c:temp_nc)

names(cchic_long)

View(cchic_long)

nrow(cchic_long)

# Why did we make the data `long`? We can plot graphs comparing the 2 locations.
# This uses the ggplot package

cchic_long %>%
  ggplot(aes(x = temp_point, y = as.numeric(temperature))) +
  geom_boxplot()


# 7. Deleting variables

# Let's look at the lactate variable.

names(cchic)

cchic %>%
  select(lactate) %>%
  is.na() %>%
  sum()

# Lactate has a lot of missing values. Maybe we want to get rid of it.
cchic <- cchic %>%
  select(-lactate)

names(cchic)


####### Solutions to excercises.

# Number of people older than 70.
cchic %>%
  filter(weight > 70) %>%
  summarise(number = n())

# Outcome of older patients.
# Mean length of stay
cchic %>%
  filter(age_years >= 60) %>%
  summarise(los = mean(los, na.rm = TRUE))

# How many people were alive at discharge
cchic %>%
  filter(age_years >= 60) %>%
  select(vital_status) %>%
  table()

# Remember to save the `cchic` dataset somewhere safe so that you can use it tomorrow.
# You will need some of the variables we calculated here.

write_csv(cchic, "clean_CCHIC_intermediate.csv")
