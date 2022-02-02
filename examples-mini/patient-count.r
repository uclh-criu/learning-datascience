# patient-count

# count patients when more than one row per patient 

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( patient = c(1,1,2,2,2,3),
                   diagnosis = c('lymph','B','C','D','E','lymph'))

# patients
patients <- unique(df1$patient)
#does the same
#patients <- unique(df1['patient'])

# number of patients
length(patients)
# 3

# or tidyverse solution
dplyr::n_distinct(df1$patient)

# beware that length gives the length of a vector
# length also gives the number of columns in a datframe
# to get the number of rows in a dataframe use nrow()
length(df1)
nrow(df1)