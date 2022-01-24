# diagnosis-per-patient-count

# count number of unique diagnoses per patient

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
