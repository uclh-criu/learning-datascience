# join-data-by-patient-id

### join two tables of data for the same patients

library(tidyverse) #for packages dplyr

# create small example dataframes
df1 <- data_frame( patient_id1 = c(1,2,3),
                   diagnosis = c('a','b','c'))

df2 <- data_frame( patient_id2 = c(1,2,2),
                   measure = c('mx','my','mz'))

# join using dplyr
# left_join is one of the most useful
# type ?left_join to see the help page
# left_join(x,y): includes all rows in x.
# If a row in x matches multiple rows in y, all the rows in y will be returned once for each matching row in x.

dfjoined <- dplyr::left_join(df1, df2, by=c("patient_id1"="patient_id2"))

dfjoined

#   patient_id1 diagnosis measure
# 1           1 a         mx     
# 2           2 b         my     
# 3           2 b         mz     
# 4           3 c         NA  

# note1 : we used by=c("patient_id1"="patient_id2") to tell R the id columns. 
#  If the id columns were named the same (e.g patient_id) we could miss this out : left_join(df1, df2)

# note2 : there are two rows for patient2 and the diagnosis b gets repeated

# note3 : the output table has 4 rows rather than 3

# note4 : patient3 has an NA value in the measure column because no measure was provided

# If we are not interested in patients that don't have measure values
# we can use inner_join instead, it only returns rows containing ids present in both tables

dfinnerjoined <- dplyr::inner_join(df1, df2, by=c("patient_id1"="patient_id2"))

dfinnerjoined

#   patient_id1 diagnosis measure
# 1           1 a         mx     
# 2           2 b         my     
# 3           2 b         mz  

# further information on joins : https://r4ds.had.co.nz/relational-data.html#understanding-joins

# In some cases you may not want to join, but instead just get those ids from one table that appear in another
# in that case you can just use filter
# e.g. if we wanted to filter from df1 just those patients that appeared in table2

df1in2 <- df1 %>% 
  filter( patient_id1 %in% df2$patient_id2)

#   patient_id1 diagnosis
# 1           1 a        
# 2           2 b  


