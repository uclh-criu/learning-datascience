-- find visits between a daterange

SELECT 
  person_id
  ,visit_occurrence_id
  ,visit_start_datetime
  ,visit_end_datetime

  FROM dsf_omop.visit_occurrence

  WHERE visit_start_datetime > '2020-04-01'
  AND  visit_end_datetime < '2020-04-02'
