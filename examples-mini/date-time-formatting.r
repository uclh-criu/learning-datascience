# date-time-formatting.r

# convert data to date/time format when it has been read in as just character

# Sometimes when you read time data in from a database or file it doesn't get formatted correctly

library(tidyverse) # for packages dplyr
library(lubridate) # good for formatting dates & times, in an easier & more consistent way than base R

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,2,2,3,3),
                   event_date = c("2021-12-25","2022-01-10",
                                  "2022-01-10","2021-04-17",
                                  "2022-01-10","2022-01-10"))

# str shows that event_date is just formatted as character 'chr'

str(df1)
# $ patient   : num [1:6] 1 1 2 2 3 3
# $ event_date: chr [1:6] "2021-12-25" "2022-01-10" "2022-01-10" "2021-04-17" ...

# if we try to get the difference between two dates stored as a character we will get an error
df1$event_date[2] - df1$event_date[1]

#Error in df1$event_date[2] - df1$event_date[1] : non-numeric argument to binary operator

# use lubridate::ymd() to convert to date format
df2 <- mutate(df1, event_date=ymd(event_date))

str(df2)
# $ patient   : num [1:6] 1 1 2 2 3 3
# $ event_date: Date[1:6], format: "2021-12-25" "2022-01-10" "2022-01-10" "2021-04-17" ...

# Now R will give the difference between two dates
df2$event_date[2] - df2$event_date[1]
#Time difference of 16 days

# for other tine formatting issue see ?lubridate from R
# and https://lubridate.tidyverse.org/index.html
