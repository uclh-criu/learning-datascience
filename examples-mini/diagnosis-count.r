# diagnosis-count

### count number of unique diagnoses

library(tidyverse) #for packages dplyr

# create a small example dataframe with just one column
df1 <- data_frame( diagnosis = c('Hodgkins Lymphoma','other','Hodgkins','Lymphoma','Lymphoma'))

# patients
diagnoses <- unique(df1$diagnosis)
#does the same
#diagnoses <- unique(df1['diagnosis'])

# number of diagnoses
length(diagnoses)


# beware that length gives the length of a vector
# length also gives the number of columns in a dataframe
# to get the number of rows in a dataframe use nrow()
length(df1)
nrow(df1)