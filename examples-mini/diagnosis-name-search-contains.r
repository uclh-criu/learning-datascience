# diagnosis-name-search-contains

# search diagnoses to find those that contain one of a number of text fragments

library(tidyverse) # for packages stringr & dplyr

# create a small example dataframe with just one column
df1 <- data_frame( diagnosis = c('hodgkins','other','Hodgkins','lymph','Lymphoma','other'))

# create a search string with an OR (|)
# in this case we miss the first letter to avoid issues with case
wanted <- 'ymph|odgkins' 

# mutate creates a column containing TRUE if the entry in the diagnosis column
# contains one of the elements in the search string
# (you can replace 'newcolumn' with the name you want for the new column)
df2 <- df1 %>% 
  mutate(newcolumn = str_detect(diagnosis, wanted))

# to view resulting dataframe
df2

# diagnosis newcolumn
# 1 hodgkins  TRUE 
# 2 other     FALSE
# 3 Hodgkins  TRUE 
# 4 lymph     TRUE 
# 5 Lymphoma  TRUE 
# 6 other     FALSE

#to convert multiple conditions (e.g. read from a dataframe) into a search
#use `paste` to create search string & `collapse` that inserts between each element
#diagnoses <- c('odgkins','ymph')
#diagnoses_wanted <- paste(diagnoses, collapse = '|')

#another way of finding matches that ignore upper/lower case
wanted <- 'lymph|hodgkins' 
df2 <- df1 %>% 
  mutate(newcolumn = str_detect(diagnosis, regex(wanted, ignore_case=T)))

# to create a new dataframe containing just the rows matching
# filter out rows
# then select just the column(s) we need
df3 <- df2 %>% 
  filter(newcolumn==TRUE) %>% 
  select(diagnosis)
