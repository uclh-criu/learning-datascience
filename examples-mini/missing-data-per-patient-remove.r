# missing-data-per-patient-remove

# remove missing values OR patients that have at least one missing value (NA)

# NA is the code that R uses to represent missing data.
# It does not have quotes. "NA" or "missing" will give different behaviour and are not recommended.

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,1,2,2,2,3,3,3),
                   measure = c(6,5,NA,8,7,9,NA,NA,NA))

# to remove missing values from a dataframe you can use `!is.na()` with `filter`
df1 %>% 
  filter(!is.na(measure))

#   patient measure
# 1       1       6
# 2       1       5
# 3       2       8
# 4       2       7
# 5       2       9


# alternatively to remove all patients that have any missing values
df1 %>% 
  group_by(patient) %>% 
  filter(sum(is.na(measure)) == 0) %>% 
  ungroup() # ungrouping is advisable if you are going to manipulate the dataframe more

#   patient measure
# 1       2       8
# 2       2       7
# 3       2       9

# replacing the filter line with this has the same result
# filter(!any(is.na(measure))) %>%