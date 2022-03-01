#02-run-sql-chemocare-patients.R
#andy south 2021-11-22

#code to read in & run chemocare sql queries
#received in email from Richard Clarke 2022-02-22

# first connect to the database using the code in 01-connect-to-database-chemocare.R
# USE SINGLE QUOTES in sql queries 

# as a first attempt - paste the sql here
# can also save it in an sql file as shown below
# based on this https://stackoverflow.com/a/46105261

querytext <- 
"select distinct patient_number
from    chemocare_viewer.treatment_summary
WHERE   lower(coalesce(trim(diagnosis),'')) LIKE '%myeloma%'
     OR lower(coalesce(trim(diagnosis),'')) LIKE '%lymphoma%'
"

# library(readr)
# qfromfile <- readr::read_file("database-use/sql-omop-scripts/visit-times.sql")

# 2050 patients
dfpatients <- DBI::dbGetQuery(ctn, querytext)


querytext2 <- 
  "select *
from    chemocare_viewer.treatment_summary
WHERE   lower(diagnosis) LIKE '%myeloma%'
     OR lower(diagnosis) LIKE '%lymphoma%'     
"

# 25689 treatments
dftreatments <- DBI::dbGetQuery(ctn, querytext2)

names(dftreatments)

# [1] "patient_number"          "date_of_birth"           "patient_name"           
# [4] "address"                 "nhs_number"              "nhs_number_status"      
# [7] "age"                     "sex"                     "gp"                     
# [10] "diagnosis"               "protocol"                "diagnosis_status"       
# [13] "treatment"               "cycle"                   "startdate"              
# [16] "status"                  "prescriber"              "modified"               
# [19] "modified_cytotoxics"     "treatment_location_code"

# format dates
dftreatments <- dftreatments %>% mutate(dateformat= as.Date(startdate,"%d/%m/%Y"))

# selecting more interesting columns & removing names etc.
dftreats <- dftreatments %>% select(patient_number, diagnosis, protocol, treatment, cycle, dateformat, startdate, modified_cytotoxics) 

#add a group_id (patient) column to allow filtering & can remove patient number
dftreats <- dftreats %>%
  group_by(patient_number) %>%
  mutate(patient_index = cur_group_id()) %>% 
  ungroup() %>% 
  select(-patient_number)

#add a column to covert dates to time starting from treatment t0
dftreats <- dftreats %>%
  group_by(patient_index) %>%
  mutate(treat_days = dateformat - min(dateformat)) %>% 
  #remove dateformat & startdate fields to reduce identifiability
  #note there are still occasional dates mentioned in treatment field
  select(-dateformat, -startdate)
  

#write to csv for later use
write_csv(dftreats,"chemocare-anon-2022-03.csv")

# drawing timelines
# see also chemocare-timelines-andy-2022-02.Rmd

# select a patient (1 to 2050)
patient <- 1
dfpatient <- dftreats %>% filter(patient_index==patient)

#previously could select patient_number, now I've removed patient numbers from file
#pn <- "02026689" #note these were read in as character from db
#dfpatient <- dftreats %>% filter(patient_number==pn)

ggplot(dfpatient, aes(y=treat_days, x=diagnosis)) + 
  geom_line() + 
  geom_point() + 
  theme_minimal() +
  scale_y_continuous() +  
  #when I had dates in
  #scale_y_date(date_labels =  "%b %Y") +
  geom_text(aes(label=treatment), hjust="outward", nudge_x=0.05, size=3 ) +
  geom_text(aes(label=cycle), hjust="inward", nudge_x=-0.05, size=3 )

# package ggrepel helps with repelling overlapping labels 
#install.packages("ggrepel")
library(ggrepel)

ggplot(dfpatient, aes(y=treat_days, x=diagnosis)) + 
  geom_line() + 
  geom_point() + 
  theme_minimal() +
  scale_x_discrete(position="top") + #to put diagnosis at top
  scale_y_continuous() +
  ylab("days from treatment start") +
  #when I had dates in
  #scale_y_date(date_labels =  "%b %Y") +
  geom_text_repel(aes(label=treatment), hjust="outward", nudge_x=0.05, size=3 ) +
  geom_text_repel(aes(label=cycle), hjust="inward", nudge_x=-0.05, size=3 )
  #this messed with x positions
  #geom_text_repel(aes(label=treatment), hjust="outward", nudge_x=0.05, size=3, direction="y" )

