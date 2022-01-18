# diagnoses-per-patients-frequency

### summarise the frequency of unique diagnoses across patients

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,1,2,2,2,3,3,3,4,5,5),
                   diagnosis = c('a','b','c','d','d','e','f','f','f','g','h','i'))

# count diagnoses per patient using dplyr
# key part is 'group_by()'
df2 <- df1 %>% 
  group_by(patient) %>% 
  summarize(n_diagnoses = length(unique(diagnosis)))

# proportion of patients with each number of diagnoses
# count counts the number of patients with each number of diagnoses (& names it n_patients)
# mutate & prop.table create a new column containing the proportions
df3 <- df2 %>% 
  count(n_diagnoses, name='n_patients') %>% 
  mutate(propn=prop.table(n_patients))

df3

# n_diagnoses n_patients propn
# 1           2          0.4
# 2           2          0.4
# 3           1          0.2