# to connect to the decovid omop database
# andy south 2021-10-27
  
#install.packages("RPostgreSQL")
library(RPostgreSQL)
library(DBI)
library(dplyr)
library(dbplyr)

#this prompts for user input when run : rstudioapi::askForPassword

# make a database connection
ctn <- dbConnect(
  RPostgreSQL::PostgreSQL(),
  host = "uclvlddpragae10",
  port = 18432,
  user = rstudioapi::askForPassword("UCLH username"), #"andsouth
  password = rstudioapi::askForPassword("Database password"),
  dbname = "datamart")

# list tables in the database
dbListTables(ctn)

# [1] "concept_icd"                            "cohort"                                
# [3] "location"                               "attribute_definition"                  
# [5] "cohort_attribute"                       "visit_detail"                          
# [7] "care_site"                              "visit_occurrence"                      
# [9] "cohort_definition"                      "concept_synonym"                       
# [11] "condition_occurrence"                   "device_exposure"                       
# [13] "cost"                                   "dose_era"                              
# [15] "condition_era"                          "death"                                 
# [17] "cdm_source"                             "drug_era"                              
# [19] "drug_strength"                          "metadata"                              
# [21] "note"                                   "provider"                              
# [23] "person"                                 "procedure_occurrence"                  
# [25] "zz_staging_drug_exposure"               "concept_ancestor"                      
# [27] "concept"                                "concept_class"                         
# [29] "observation_period"                     "concept_relationship"                  
# [31] "domain"                                 "fact_relationship"                     
# [33] "drug_exposure"                          "measurement"                           
# [35] "specimen"                               "payer_plan_period"                     
# [37] "zz_pseudonym_measurement_id"            "vocabulary"                            
# [39] "test_ts"                                "observation"                           
# [41] "zz_pseudonym_condition_occurrence_id"   "zz_pseudonym_drug_exposure_id"         
# [43] "zz_pseudonym_person_id"                 "zz_pseudonym_procedure_occurrence_id"  
# [45] "zz_pseudonym_specimen_id"               "zz_pseudonym_visit_detail_id"          
# [47] "zz_pseudonym_visit_occurrence_id"       "zz_staging_condition_occurrence"       
# [49] "zz_staging_death"                       "source_to_concept_map"                 
# [51] "note_nlp"                               "relationship"                          
# [53] "zz_staging_etl_load_dates"              "zz_staging_fact_relationship"          
# [55] "zz_staging_fact_relationship_drug"      "zz_staging_fact_relationship_lab"      
# [57] "zz_staging_ip_admin_drug_exposure"      "zz_staging_measurement_flowsheet"      
# [59] "zz_staging_measurement_lab_result"      "zz_staging_measurement_smoke"          
# [61] "zz_staging_measurement_tep"             "zz_staging_person"                     
# [63] "zz_staging_procedure_occurrence"        "zz_staging_specimen"                   
# [65] "zz_staging_unified_measurement_samples" "zz_staging_visit_detail"               
# [67] "zz_staging_visit_occurrence"
