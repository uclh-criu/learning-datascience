-- find measurements between a daterange

SELECT 
  dsf_omop.visit_occurrence.person_id
  ,dsf_omop.visit_occurrence.visit_occurrence_id
  ,visit_start_datetime
  ,visit_end_datetime
  ,value_as_number AS "oxygen_saturation_percent"

  FROM dsf_omop.visit_occurrence

  LEFT JOIN dsf_omop.measurement ON measurement.visit_occurrence_id = dsf_omop.visit_occurrence.visit_occurrence_id 

  WHERE visit_start_datetime > '2020-04-01'
  AND  visit_end_datetime < '2021-04-01'
