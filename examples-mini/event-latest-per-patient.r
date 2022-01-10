# event-latest-per-patient

# retain the latest events per patient from a table with columns for patient id and date/time of event

library(tidyverse) # for packages dplyr

# create a small example dataframe
# this uses as.Date from base R
df1 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = as.Date(c("2021-12-25","2022-01-10",
                                          "2022-01-10","2021-04-17",
                                          "2022-01-10","2022-01-10")))

# slice_max extracts the row for each group that contains the biggest date
# with_ties=FALSE needed so it just takes one row even if there are multiple rows on same date

df2 <- df1 %>%
  group_by(patient) %>%
  slice_max(event_date, n=1, with_ties=FALSE)

#   patient event_date
# 1       1 2022-01-10
# 2       2 2022-01-10
# 3       3 2022-01-10

# note1 you could replace with slice_min() to get the first event
# note2 try removing with_ties=FALSE and you should see you get two rows for patient3
# note3 when you read data in from a database it's good to check that date columns are formatted as dates
# you can do this with str()
str(df1)

# check that it says Date and not 'chr' which indicates character
#$ patient   : num [1:6] 1 1 2 2 3 3
#$ event_date: Date[1:6], format: "2021-12-25" "2022-01-10" "2022-01-10" "2021-04-17" ...

# if it does say 'chr'
# package lubridate is good for formatting dates & times
# in an easier & more consistent way than base R
# we could have used it to create the example above
library(lubridate) 

df3 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = c("2021-12-25","2022-01-10",
                                  "2022-01-10","2021-04-17",
                                  "2022-01-10","2022-01-10"))
str(df3)
# $ patient   : num [1:6] 1 1 2 2 3 3
# $ event_date: chr [1:6] "2021-12-25" "2022-01-10" "2022-01-10" "2021-04-17" ...

df3 <- mutate(df3, event_date= ymd(event_date))

str(df3)
# $ patient   : num [1:6] 1 1 2 2 3 3
# $ event_date: Date[1:6], format: "2021-12-25" "2022-01-10" "2022-01-10" "2021-04-17" ...
