#02-run-file-sql-queries.R
#andy south 2021-11-22

#code to read in & run sql queries stored in their own files

#first connect to the database using the code in 01-connect-to-database-decovid-omop.R

# based on this https://stackoverflow.com/a/46105261

# USE SINGLE QUOTES in sql queries 

library(readr)

qfromfile <- readr::read_file("database-use/sql-omop-scripts/visit-times.sql")

# query works when has single quotes
# this fails when the query has double quotes
df2 <- DBI::dbGetQuery(ctn, qfromfile)

View(df2)

# plotting the data
library(ggplot2)
ggplot(df2, aes(x=visit_start_datetime, y=visit_end_datetime)) +
  geom_point()

# checking other things about the data
max(df2$visit_start_datetime)
max(df2$visit_end_datetime)

# you can run the same query in dbForge to check that the results are alike
# in dbForge use File, Open File to open a .sql file & then use execute button on left


# other query files to try

qfromfile <- readr::read_file("database-use/sql-omop-scripts/measures-one-patient.sql")
df3 <- DBI::dbGetQuery(ctn, qfromfile)

View(df3)

#these quotes `` needed because of space in column name created in the sql query
ggplot(df3, aes(x=measurement_datetime, y=`oxygen saturation`)) +
  geom_point()




# this one doesn't work from R yet
# qfromfile <- readr::read_file("database-use/sql-omop-scripts/join-visit-time-to-oxygen-measure.sql")
# df4 <- DBI::dbGetQuery(ctn, qfromfile)
