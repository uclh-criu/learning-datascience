#run-file-sql-queries.R
#andy south 2021-11-15

#code to read in & run sql queries stored in their own files
#first you need to connect to the database using the code in connect-to-database-decovid-omop.R


# and trying to read the query directly from a file using readr
# https://stackoverflow.com/a/46105261

# USE SINGLE QUOTES in sql queries 

library(readr)

qfromfile <- readr::read_file("database-use/sql-omop-scripts/visit-times.sql")

# query works when has single quotes
# this fails when the query has double quotes
df2 <- DBI::dbGetQuery(ctn, qfromfile)


# other query files to try

qfromfile <- readr::read_file("database-use/sql-omop-scripts/join-visit-time-to-oxygen-measure.sql")
df3 <- DBI::dbGetQuery(ctn, qfromfile)


qfromfile <- readr::read_file("database-use/sql-omop-scripts/measures-one-patient.sql")
df4 <- DBI::dbGetQuery(ctn, qfromfile)
