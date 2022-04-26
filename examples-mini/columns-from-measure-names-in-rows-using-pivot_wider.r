# columns-from-measure-names-in-rows-using-pivot_wider.r

# create columns from measure names stored in an existing single column and values in another 

# common situation to reformat a database extraction e.g. of flowsheets or smart forms

# below there are 3 examples
# 1. single record per patient of multiple measures
# 2. multiple records per patient each with an id
# 3. multiple records per patient without an id

library(tidyverse) # for packages dplyr

# 1. single record per patient of multiple measures

# create a small example dataframe using tibble
df1 <- tibble( patient = c(1,1,2,2,2,3,3),
               measure_name = c("measure1","measure2",
                                "measure1","measure2","measure3",
                                "measure1","measure2"),
               value = c(1:7))

# pivot wider to move contents of measure_name to their own columns
# with values from value
# using an id_col makes one row per patient

df1wide <- pivot_wider(df1, 
                      names_from = measure_name, 
                      values_from = value, 
                      id_cols=patient )

# new columns are created, NAs are inserted where there are no values for a measure
df1wide
#   patient measure1 measure2 measure3
# 1       1        1        2       NA
# 2       2        3        4        5
# 3       3        6        7       NA


# 2. multiple records per patient each with an id

# in many cases there can be more than one record per patient
# e.g. a smart form
# and you may want each record to get its own row

# create a small example dataframe using tibble
df2 <- tibble( patient = c(1,1,1,1,2,2,2,2,2),
               measure_name = c("measure1","measure2","measure1","measure2",
                                "measure1","measure2","measure3",
                                "measure1","measure2"),
               record_id = c(1,1,2,2,3,3,3,4,4),
               value = c(1:9))

# include record_id as one of the id_cols and you will get 
# one row per patient, record combination

df2wide <- pivot_wider(df2, 
                       names_from = measure_name, 
                       values_from = value, 
                       id_cols=c(patient, record_id))

df2wide

#   patient record_id measure1 measure2 measure3
# 1       1         1        1        2       NA
# 2       1         2        3        4       NA
# 3       2         3        5        6        7
# 4       2         4        8        9       NA


# 3. multiple records per patient without an id

# if there aren't record ids, or you don't use a record_id as an id_col
# then pivot_wider will put multiple values into a single cell
# and give this warning
# Warning message:
#   Values are not uniquely identified; output will contain list-cols.

df3 <- tibble( patient = c(1,1,1,1,2,2,2,2,2),
               measure_name = c("measure1","measure2","measure1","measure2",
                                "measure1","measure2","measure3",
                                "measure1","measure2"),
               value = c(1:9))


df3wide <- pivot_wider(df3, 
                       names_from = measure_name, 
                       values_from = value, 
                       id_cols=patient)

#from RStudio this should show you that some cells contain multiple values
#e.g. c(1, 3). These are a bit trickier to deal with
View(df3wide)


# type ?pivot_wider in the R console to find out more

