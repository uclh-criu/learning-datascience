-- Find all the oxygen saturation measurements for patient '14205'

SELECT
dsf_omop.visit_occurrence.person_id
, dsf_omop.visit_occurrence.visit_occurrence_id
, visit_start_datetime
,visit_end_datetime
, dsf_omop.measurement.measurement_datetime
,value_as_number AS "oxygen saturation"


FROM dsf_omop.visit_occurrence


LEFT JOIN dsf_omop.measurement ON measurement.visit_occurrence_id = dsf_omop.visit_occurrence.visit_occurrence_id


WHERE dsf_omop.measurement.measurement_concept_id = '3013502'


AND dsf_omop.measurement.person_id = '14205'


ORDER BY measurement_datetime ASC
--this would limit to returning 1st record
-- LIMIT 1