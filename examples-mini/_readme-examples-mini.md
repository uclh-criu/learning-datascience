# Mini-examples demonstrating coding solutions for patient data

A series of independent, self-contained examples in R scripts in this folder

updated 2022-02-01

To use, either :
1. create a new RStudio project from the repository to view & run the scripts locally 
2. just copy & paste the code from Github into RStudio

These examples are in early development and are likely to change, please suggest or submit improvements.

(note to authors : this file is created by x-create-readme.r)



## [date-time-formatting.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/date-time-formatting.r)

 convert data to date/time format when it has been read in as just character


## [diagnoses-per-patients-frequency.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/diagnoses-per-patients-frequency.r)

 summarise the frequency of unique diagnoses across patients


## [diagnosis-count.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/diagnosis-count.r)

 count number of unique diagnoses


## [diagnosis-name-search-contains.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/diagnosis-name-search-contains.r)

 search diagnoses to find those that contain one of a number of text fragments


## [diagnosis-name-search-exact.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/diagnosis-name-search-exact.r)

 search diagnoses to find those that exactly match one of a number of strings 


## [diagnosis-per-patient-count.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/diagnosis-per-patient-count.r)

 count number of unique diagnoses per patient


## [event-duration-per-patient.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/event-duration-per-patient.r)

 calculate start, end and duration per patient from a table with columns for patient id and date/time of events


## [event-latest-per-patient.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/event-latest-per-patient.r)

 retain the latest events per patient from a table with columns for patient id and date/time of event


## [join-data-by-patient-id.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/join-data-by-patient-id.r)

 join two tables of data for the same patients


## [measures-summary-per-patient.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/measures-summary-per-patient.r)

 calculate min,max,mean etc. per patient from a table with columns for patient id and measures, and rows per event


## [missing-data-formatting.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/missing-data-formatting.r)

 format missing data values correctly (NA)


## [missing-data-per-patient-count.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/missing-data-per-patient-count.r)

 count number of missing values (NA) per patient


## [missing-data-per-patient-remove.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/missing-data-per-patient-remove.r)

 remove missing values OR patients that have at least one missing value (NA)


## [number-formatting.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/number-formatting.r)

 convert data to number format when it has been read in as character (using as.numeric())


## [patient-count-by-date-from-admission-discharge.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/patient-count-by-date-from-admission-discharge.r)

 count by date of the number of patients from admission and discharge dates


## [patient-count.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/patient-count.r)

 count patients when more than one row per patient 


## [x-create-readme.r](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/x-create-readme.r)

 script to create the readme file for the mini examples
