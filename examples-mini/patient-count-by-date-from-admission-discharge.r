# patient-count-by-date-from-admission-discharge

# count by date of the number of patients in beds from admission-discharge

# query from Conor 2022-02-01
# I have a list of patients who have dates of admission and dates of discharge. 
# I want a count by date of the number of patients in beds. 
# simple for one patient and date: 
# date x > start_date AND date x < end_date 
# but I can't figure out how to apply that across every patient in the dataset, 
# in order to create a new column patients_currently_admitted. 

# andy using same start example as event-duration-per-patient.r
# change the dates slightly to make output more meaningful
# conors query starts from df2

library(tidyverse) # for packages dplyr

# create a small example dataframe
# this uses as.Date from base R
df1 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = as.Date(c("2021-12-30","2022-01-05",
                                          "2022-01-01","2022-01-05",
                                          "2022-01-03","2022-01-05")))

df2 <- df1 %>%
  group_by(patient) %>%
  summarise( start_date = min(event_date, na.rm=TRUE),
             end_date = max(event_date, na.rm=TRUE),
             n_events = n()) %>% 
  mutate( duration_days = end_date - start_date)
  
df2

# patient start_date end_date   n_events duration_days
# <dbl> <date>     <date>        <int> <drtn>       
# 1       1 2021-12-25 2022-01-10        2  16 days     
# 2       2 2021-04-17 2022-01-10        2 268 days     
# 3       3 2022-01-10 2022-01-10        2   0 days  

# andy addressing conors query

# First thoughts
# may want to create a new dataframe containing all dates
# from min start to max end
# & then apply through it to count 
# for how many patients is current_date > start_date AND < end_date
# could do by brute force with a loop

# try stackoverflow too
# I searched for : dplyr count days from start & end date

# https://stackoverflow.com/questions/57255851/sum-count-between-two-dates-in-r/57263510#57263510

# a few potential solutions

# this seems to work
# but I'm not sure what unnest() does yet !

library(dplyr)
library(tidyr)
library(purrr)
df3 <- df2 %>%
  transmute(date = map2(start_date, end_date, seq, by = "1 day")) %>%
  unnest(date) %>%
  count(date)

df3

# date           n
# 1 2021-12-30     1
# 2 2021-12-31     1
# 3 2022-01-01     2
# 4 2022-01-02     2
# 5 2022-01-03     3
# 6 2022-01-04     3
# 7 2022-01-05     3
