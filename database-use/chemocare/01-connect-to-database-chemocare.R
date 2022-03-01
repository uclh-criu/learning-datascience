# 01-connect-to-database-chemocare.R
# to connect to chemocare database
# andy south 2022-02-24

#install.packages("RPostgreSQL")
library(RPostgreSQL)
library(DBI)
library(dplyr)
library(dbplyr)

#this prompts for user input when run : rstudioapi::askForPassword

# make a database connection
ctn <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  host = "172.16.149.192",
  port = 5432,
  user = rstudioapi::askForPassword("UCLH username"), #"andsouth
  password = rstudioapi::askForPassword("Database password"),
  dbname = "ads")

# you can then use this connection called 'ctn' here to get at the data

# e.g. list tables in the database
# but be aware this lists 17k tables
dbListTables(ctn)
