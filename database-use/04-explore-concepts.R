# 04-explore-concepts.R
# andy south 2021-11-29

# in an omop database everything is a concept
# stored in a concept table

# this script uses a very simple sql query to select everything from the concepts table
# and starts to explore what is in it

# takes a few mins to run because there are 3.9 million concepts !
qfromfile <- readr::read_file("database-use/sql-omop-scripts/concepts.sql")
dfconcepts <- DBI::dbGetQuery(ctn, qfromfile)

View(dfconcepts)

names(dfconcepts)
#[1] "concept_id"       "concept_name"     "domain_id"        "vocabulary_id"    "concept_class_id"
#[6] "standard_concept" "concept_code"     "valid_start_date" "valid_end_date"   "invalid_reason"  

# 162k concepts are measurements
table(dfconcepts$domain_id)

table(dfconcepts$concept_class_id)

dfmeasurements <- dplyr::filter(dfconcepts, domain_id=="Measurement")

table(dfmeasurements$concept_class_id)

# Clinical Finding Clinical Observation           ICD10 code      ICD10 Hierarchy             Lab Test 
# 128                17960                   30                    8                56171 
# LOINC Class  LOINC Document Type          LOINC Group      LOINC Hierarchy    Observable Entity 
# 180                    1                 6567                67640                  469 
# Procedure     Staging / Scales 
# 11293                 2137

#looking up text filter example
#dplyr::filter(mtcars, grepl('Toyota|Mazda', type))

# check which concept_names contain ymphoma (missing firs char to avoid case issues)
# be quicker to do this just on measurements
dflymphoma <- dplyr::filter(dfconcepts, grepl('ymphoma', concept_name))

table(dflymphoma$domain_id)

# Condition         Drug   Meas Value  Measurement  Observation    Procedure Type Concept 
# 483            1           18           72          291            2            3 