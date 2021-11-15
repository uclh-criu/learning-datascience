#run-text-sql-queries.R

#andy south 2021-11-15

#code run sql queries harcoded in this script

#first you need to connect to the database using the code in connect-to-database-decovid-omop.R

library(dbplyr)

#put a query into an R text string

sqlquery <- "

-- find visits between a daterange

SELECT 
person_id
,visit_occurrence_id
,visit_start_datetime
,visit_end_datetime

FROM dsf_omop.visit_occurrence

WHERE visit_start_datetime > '2020-04-01'
AND  visit_end_datetime < '2020-04-02'
"

# to make R recognise it as an sql query
sqlquery <- sql(sqlquery)

is.sql(sqlquery)
#[1] TRUE

# this works to get query results into a dataframe
df1 <- DBI::dbGetQuery(ctn, sqlquery)


