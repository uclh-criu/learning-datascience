#03-manipulate-plot-query-results.R

#revise manipulating & plotting data with dplyr & ggplot2

library(tidyverse)

# another query returning more data - 1 month of oxygen measurements

qfromfile <- readr::read_file("database-use/sql-omop-scripts/measures-all-patients-daterange.sql")

df4 <- DBI::dbGetQuery(ctn, qfromfile)

#first plot
ggplot(df4, aes(x=measurement_datetime, y=`oxygen saturation`)) +
  geom_point()

# now can we manipulate these data using dplyr & plot using ggplot ?

# what columns are there ?
names(df4)
# [1] "person_id"            "visit_occurrence_id"  "visit_start_datetime"
# [4] "visit_end_datetime"   "measurement_datetime" "oxygen saturation" 

# how many rows
nrow(df4)
#[1] 6749

#check for missing values (NA) in the oxygen data with is.na()
df4 %>% 
  filter(is.na(`oxygen saturation`)) %>% 
  count()
#143 there are missing values to be aware of

# how many unique patients
# using select() to get the person_id column 
# and n_distinct() to count unique values
df4 %>% 
  select(person_id) %>% 
  n_distinct()
# 1974

# numbers of rows (measures) per patient using count()
# creates a dataframe of person_id,n where n is num observations 
df4 %>% 
  count(person_id, sort=TRUE)

# can add another count to count the number of patients
# with each number of observations
df4 %>% 
  count(person_id, name="num_observations") %>% 
  count(num_observations, name="num_patients")

# numbers of rows (measures) per patient
# filter those > 100
df4 %>% 
  count(person_id, sort=TRUE) %>% 
  filter(n > 100)
# person_id   n
# 1     224523 219
# 2     246373 171
# 3     264129 170
# 4     246375 145
# 5     230129 126

# now lets filter just those rows
# for the patient with the most records (top result from previous)
dfpatient <- df4 %>% 
  filter(person_id == 224523 )

# check nrows is same as we found above
nrow(dfpatient)
# 219

# now we can plot just the oxygen measures for that patient
ggplot(dfpatient, aes(x=measurement_datetime, y=`oxygen saturation`)) +
  geom_point()

# can you try some other patients by replacing the person_id used to create dfpatient ?


#[TODO try this out on DSD]

# another option is to select a number of patients
# and use ggplot to plot the results
dfpatients <- df4 %>% 
  count(person_id, sort=TRUE) %>% 
  # to slice the top x values of n
  slice_max(n, n=6)

# now plot the oxygen measures for all patients
# facetting by person_id to put each patient in their own subplot
ggplot(dfpatients, aes(x=measurement_datetime, y=`oxygen saturation`)) +
  geom_point() +
  facet_grid(person_id)


