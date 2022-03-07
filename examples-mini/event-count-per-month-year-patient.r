# event-count-per-month-year-patient

# count events per month or year, and patient from a table with columns for patient id and date/time of events

library(tidyverse) # for packages dplyr
library(lubridate) # date manipulation

# create a small example dataframe
# this uses as.Date from base R
df1 <- data_frame( patient = c(1,1,1,2,2,2,3,3,3),
                   event_date = as.Date(c("2021-12-25","2022-01-10","2022-01-11",
                                          "2022-01-10","2022-01-11","2022-01-12",
                                          "2021-04-04","2021-04-17","2022-02-02" )))

#this solution uses function floor_date() from the package lubridate
#to round down dates to the first of the month before grouping
#it has the advantage that it keeps data in a date format

# option 1 count total events per month
dfmonth <- df1 %>% 
   group_by(month = lubridate::floor_date(event_date, "month")) %>%
   summarize(n_events = n())

dfmonth
#   month      n_events
# 1 2021-04-01        2
# 2 2021-12-01        1
# 3 2022-01-01        5
# 4 2022-02-01        1

# option 2 count events per month for each patient
dfpatient_month <- df1 %>% 
  group_by(patient,
           month = lubridate::floor_date(event_date, "month")) %>%
  summarize(n_events = n())

dfpatient_month
#   patient month      n_events
# 1       1 2021-12-01        1
# 2       1 2022-01-01        2
# 3       2 2022-01-01        3
# 4       3 2021-04-01        2
# 5       3 2022-02-01        1

# to count per year simply change month to year

# count total events per year
dfyear <- df1 %>% 
  group_by(year = lubridate::floor_date(event_date, "year")) %>%
  summarize(n_events = n())

dfyear
#     year      n_events
# 1 2021-01-01        3
# 2 2022-01-01        6

# count events per year for each patient
dfpatient_year <- df1 %>% 
  group_by(patient,
           year = lubridate::floor_date(event_date, "year")) %>%
  summarize(n_events = n())

dfpatient_year
#   patient year      n_events
# 1       1 2021-01-01        1
# 2       1 2022-01-01        2
# 3       2 2022-01-01        3
# 4       3 2021-01-01        2
# 5       3 2022-01-01        1

# quick plots

ggplot(dfmonth, aes(x=month, y=n_events)) +
  geom_bar()

# converting patient to a factor so that ggplot doesn't give it a numeric colour scale
ggplot(dfpatient_month, aes(x=month, y=n_events, colour=as.factor(patient))) +
       geom_point()


# source of solution https://stackoverflow.com/a/50272853/1718356
# you could use ceiling_date() to instead assign summaries to the last day of the month
# you can use the same group_by, summarize approach to calculate summary stats e.g min, max, mean etc.

