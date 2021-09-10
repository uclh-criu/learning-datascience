# example-lymphoma-1.R

# 2021-09-09
# Wai Keong question

# How to extract the proportion of patients attending Lymphoma clinics 
# that don't have a lymphoma diagnosis (~2500 patients)

library(tidyverse)

# the data extracted from Epic are something like this 


# Example1
df1 <- data_frame( PatientDurableKey = c(1,2,2,3,3,3),
                   Encounter_Key = c(11:16),
                   Diagnosis_Name = c('lymph','B','C','D','E','lymph'))

# filter just those Patients that have a 'lymph' diagnosis
df1 %>% 
group_by(PatientDurableKey) %>% 
  filter(any(Diagnosis_Name=='lymph'))

# or instead for each patient count the number of diagnoses that are 'lymph'
dfyes <- df1 %>% 
  group_by(PatientDurableKey) %>% 
  filter(Diagnosis_Name=='lymph') %>% 
  summarise(n=n())

# but problem with the above is that it doesn't retain the zeroes 
# i.e. the patients with no lymph diagnosis

#this works by first finding if each diagnosis is lymph
#then summing the T/F for each patient
df1 %>% 
  mutate(lymph = Diagnosis_Name=='lymph') %>%
  group_by(PatientDurableKey) %>% 
  summarize(n_lymph_diagnoses = sum(lymph))
 
# PatientDurableKey     n
# <dbl> <int>
#   1     1
#   2     0
#   3     1 

#NEXT STEP
# replace the 2nd line above
#with something that uses a lookup table to classify 
# whether each diagnosis is lymph
#   mutate(lymph = Diagnosis_Name=='lymph') %>%

# To calculate which patients have a lymphoma diagnosis & which don't

# Example2
df1 <- data_frame( PatientDurableKey = c(1,2,2,3,3,3),
                   Encounter_Key = c(11:16),
                   Diagnosis_Name = c('hodgkins','B','C','D','hodgkins','lymph'))

diagnoses_wanted <- c('lymph','hodgkins') 

#this works by first finding if each diagnosis is lymph
#then summing the T/F for each patient
df2 <- df1 %>% 
  mutate(lymph = Diagnosis_Name %in% diagnoses_wanted) %>%
  group_by(PatientDurableKey) %>% 
  summarize(n_lymph_diagnoses = sum(lymph))

# To calculate proportion of patients that have a lymphoma diagnosis & which don't

# Example3 
df1 <- data_frame( PatientDurableKey = c(1,2,2,3,3,3,4,4),
                   Encounter_Key = c(11:18),
                   Diagnosis_Name = c('hodgkins','B','C','D','hodgkins','lymph','E','F'))

diagnoses_wanted <- c('lymph','hodgkins') 

#this works by first finding if each diagnosis is lymph
#then summing the T/F for each patient to give n_diagnoses per patient
df2 <- df1 %>% 
  mutate(lymph = Diagnosis_Name %in% diagnoses_wanted) %>%
  group_by(PatientDurableKey) %>% 
  summarize(n_lymph_diagnoses = sum(lymph))

#proportion of patients with a lymphoma diagnosis
df3 <- df2 %>% 
  count(n_lymph_diagnoses) %>% 
  mutate(propn=prop.table(n))
