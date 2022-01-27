# measures-summary-per-patient

# calculate min,max,mean etc. per patient from a table with columns for patient id and measures, and rows per event

# common situation where you have multiple rows per patient and you want to summarise the data in one row per patient

library(tidyverse) # for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,2,2,2,3,3),
                   measure = c(10,20,10,11,30,40,NA))

# group_by patient and calculate some summaries
df2 <- df1 %>%
  group_by(patient) %>%
  summarise( measure_min = min(measure, na.rm=TRUE),
             measure_max = max(measure, na.rm=TRUE),
             measure_mean = mean(measure, na.rm=TRUE),
             measure_med = median(measure, na.rm=TRUE),             
             n_events = n(),
             n_measures = sum(!is.na(measure))) 

# sum(!is.na()) counts values that are not missing (! signifies not)
 
df2

#   patient measure_min measure_max measure_mean measure_med n_events n_measures
# 1       1          10          20           15          15        2          2
# 2       2          10          30           17          11        3          3
# 3       3          40          40           40          40        2          1

# notes
# na.rm included in case there are any missing values (NA)
# n_events will include any with missing values
# n_measures excludes missing values

# you can select just some of the summaries
# or add others, type ?summarise into the R console & scroll down to see options
# e.g.
df1 %>%
  group_by(patient) %>%
  summarise( first_measure = first(measure))

# this prints to the console because it is not assigned to an object
# add e.g. df3 <- to the start to assign it
