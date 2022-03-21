# diagnosis-per-patient-count

# count number of unique diagnoses per patient - optionally add column to original table

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,1,2,2,2,3,3,3),
                   diagnosis = c('a','b','c','d','d','e','f','f','f'))

# count diagnoses per patient using dplyr
# key part is 'group_by()'
df2 <- df1 %>% 
  group_by(patient) %>%
  summarize(n_diagnoses = n_distinct(diagnosis))  

df2
#         patient n_diagnoses
# 1       1           3
# 2       2           2
# 3       3           1

# if you want to add a column onto the original table
# e.g. to use for filtering 
# you can use 'mutate' instead of 'summarize'
df3 <- df1 %>% 
  group_by(patient) %>%
  mutate(n_diagnoses = n_distinct(diagnosis))  

df3
#   patient diagnosis n_diagnoses
# 1       1 a                   3
# 2       1 b                   3
# 3       1 c                   3
# 4       2 d                   2
# 5       2 d                   2
# 6       2 e                   2
# 7       3 f                   1
# 8       3 f                   1
# 9       3 f                   1
