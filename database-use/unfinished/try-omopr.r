# try-omopr.r

# trying omopr approach - not working 

library(omopr)

#https://cran.r-project.org/web/packages/omopr/vignettes/omopr.html

# doesn't work
tRefs = omopr_init(ctn)
# Error in postgresqlExecStatement(conn, statement, ...) : 
#   RS-DBI driver: (could not Retrieve the result : ERROR:  relation "concept_icd" does not exist
#                   LINE 1: SELECT * FROM "concept_icd" AS "q03" WHERE 0=1

#from docs
#This should return an error if CDM tables are not found at the given connection. 
#Note that this will work provided that the CDM tables are in the default RDBMS schema 
#(often called public or dbo), but if a non-default schema is used (here, for example, cdm)
#, then this must be provided

tRefs = omopr_init(ctn, "cdm")

# Error in postgresqlExecStatement(conn, statement, ...) : 
#   RS-DBI driver: (could not Retrieve the result : ERROR:  syntax error at or near "cdm"
#                   LINE 1: ...ame !='information_schema' and schemaname !='pg_catalog' cdm
#                   ^
#   )
# Error in omopr_init(ctn, "cdm") : 
#   No concept table detected. A (populated) concept table is needed for this package to be useful.
# In addition: Warning message:
#   In postgresqlQuickSQL(conn, statement, ...) :
#   Could not create execute: select tablename from pg_tables where schemaname !='information_schema' and schemaname !='pg_catalog' cdm
