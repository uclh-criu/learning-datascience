# event-duration-per-patient

# calculate start, end and duration per patient from a table with columns for patient id and date/time of events

library(tidyverse) # for packages dplyr

# create a small example dataframe
# this uses as.Date from base R
df1 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = as.Date(c("2021-12-25","2022-01-10",
                                          "2022-01-10","2021-04-17",
                                          "2022-01-10","2022-01-10")))

df2 <- df1 %>%
  group_by(patient) %>%
  summarise( start_date = min(event_date, na.rm=TRUE),
             end_date = max(event_date, na.rm=TRUE),
             n_events = n()) %>% 
  mutate( duration_days = end_date - start_date)
  
df2

# na.rm included in case there is any missing data
# although maybe unlikely in this case
# note1 n_events will include any with missing data
# note2 duration_days is an object of type 'drtn' which sometimes is treated as an integer
# but also has information on units

# patient start_date end_date   n_events duration_days
# <dbl> <date>     <date>        <int> <drtn>       
# 1       1 2021-12-25 2022-01-10        2  16 days     
# 2       2 2021-04-17 2022-01-10        2 268 days     
# 3       3 2022-01-10 2022-01-10        2   0 days  

