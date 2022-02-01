# patient-count-by-date-from-admission-discharge

# count by date of the number of patients from admission and discharge dates

# query from Conor Foley 2022-02-01
# a two step process you can start at either 
# df1 - dates in one column, or 
# df2 - separate columns for start & end dates

library(tidyverse) # for packages dplyr
library(tidyr)
library(purrr)

# create a small example dataframe
# this uses as.Date from base R
df1 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = as.Date(c("2021-12-30","2021-12-30",
                                          "2022-01-01","2022-01-05",
                                          "2022-01-03","2022-01-05")))

df2 <- df1 %>%
  group_by(patient) %>%
  summarise( start_date = min(event_date, na.rm=TRUE),
             end_date = max(event_date, na.rm=TRUE))
  
df2

#   patient start_date end_date  
# 1       1 2021-12-30 2021-12-30
# 2       2 2022-01-01 2022-01-05
# 3       3 2022-01-03 2022-01-05


df3 <- df2 %>%
  transmute(date = map2(start_date, end_date, seq, by = "1 day")) %>%
  unnest(date) %>%
  count(date, name="npatients")

# the transmute line creates a column containing the sequence of dates for each patient
# the unnest line converts that into one date per row (so each row is a patient-date combination)
# the count line counts the patient-date combinations

df3

# date           n
# 1 2021-12-30     1
# 2 2021-12-31     1
# 3 2022-01-01     2
# 4 2022-01-02     2
# 5 2022-01-03     3
# 6 2022-01-04     3
# 7 2022-01-05     3

#look at the results of the intermediate steps by copying parts of the command above

# with this you get no rows if there were no patients on a date
# to fill in the sequence you could create a date sequence and then join it to this result
dfdates <- data_frame(date=seq(min(df2$start_date),max(df2$end_date),by = "1 day"))
dfdates <- left_join(dfdates, df3, by=date)

dfdates

# date       npatients
# 1 2021-12-30         1
# 2 2021-12-31        NA
# 3 2022-01-01         1
# 4 2022-01-02         1
# 5 2022-01-03         2
# 6 2022-01-04         2
# 7 2022-01-05         2

# this solution came from stackoverflow
# searching for : dplyr count days from start & end date
# https://stackoverflow.com/a/57255894

# another potential solution that doesn't quite work
# create a new dataframe containing all dates from min start to max end
# & then count for how many patients is current_date > start_date AND < end_date

# this doesn't quite manage to go through all intervals
# library(lubridate)
# dfdates <- data_frame(icudate=seq(min(df2$start_date),max(df2$end_date),by = "1 day"))
# dfdates <- dfdates %>% 
#   mutate(patient_count = icudate %within% interval(df2$start_date, df2$end_date))
# 1: Problem with `mutate()` column `patient_count`.
# i `patient_count = icudate %within% interval(df2$start_date, df2$end_date)`.
# i longer object length is not a multiple of shorter object length 

