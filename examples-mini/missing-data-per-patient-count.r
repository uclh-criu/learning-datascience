# missing-data-per-patient-count

# count number of missing values (NA) per patient

# NA is the code that R uses to represent missing data.
# It does not have quotes. "NA" or "missing" will give different behaviour and are not recommended

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,1,2,2,2,3,3,3),
                   measure = c(6,5,NA,8,7,9,NA,NA,NA))

# count missing values per patient using dplyr
# key parts are 'group_by()' and 'is.na()'
df2 <- df1 %>% 
  group_by(patient) %>% 
  summarize(n_missing = sum(is.na(measure)))

df2

#   patient n_missing
# 1       1         1
# 2       2         0
# 3       3         3

# you can compare to other counts of data values
df2 <- df1 %>% 
  group_by(patient) %>% 
  summarize(n_missing = sum(is.na(measure)),
            n_not_missing = sum(!is.na(measure)),
            n = n())

df2
#   patient n_missing n_not_missing     n
# 1       1         1             2     3
# 2       2         0             3     3
# 3       3         3             0     3

