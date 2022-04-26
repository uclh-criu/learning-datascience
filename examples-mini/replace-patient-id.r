# replace-patient-id.r

# to replace a patient identifier column (e.g. MRN) with an index

library(tidyverse) #for packages dplyr

# create a small example dataframe
# here just represent an identifier with 3 figure numbers
df1 <- tibble( patient_number = c(101,101,101,432,432,990,990),
               diagnosis = c('a','b','c','d','e','f','g'))


# add a patient_index column to allow filtering & can remove patient number
df2 <- df1 %>%
  group_by(patient_number) %>%
  mutate(patient_index = cur_group_id()) %>%
  ungroup() %>%
  select(-patient_number)


df2

