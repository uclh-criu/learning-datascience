#query-from-r.R
#andy south 2021-11-15

# try to start query from dbplyr

#first you need to connect to the database using the code in connect-to-database-decovid-omop.R

#visit_occurrence <- tbl(ctn, "visit_occurrence")
# Error in postgresqlExecStatement(conn, statement, ...) : 
#   RS-DBI driver: (could not Retrieve the result : ERROR:  relation "visit_occurrence" does not exist
#                   LINE 1: SELECT * FROM "visit_occurrence" AS "q03" WHERE 0=1

# hurrah! this does work but gives a list that I don't quite get
# so dsf_omop is the schema
vo <- tbl(ctn, in_schema("dsf_omop", table = "visit_occurrence"))

#this doesn't work
tst <- select(vo,  visit_start_datetime > '2020-04-01' & visit_end_datetime < '2020-04-02')


# trying omopr approach
library(omopr)
