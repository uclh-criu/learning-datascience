-- Find oxygen saturation measurements for all patients between a date range

SELECT
dsf_omop.visit_occurrence.person_id
, dsf_omop.visit_occurrence.visit_occurrence_id
, visit_start_datetime
, visit_end_datetime
, dsf_omop.measurement.measurement_datetime
, value_as_number AS "oxygen saturation"


FROM dsf_omop.visit_occurrence


LEFT JOIN dsf_omop.measurement ON measurement.visit_occurrence_id = dsf_omop.visit_occurrence.visit_occurrence_id


WHERE dsf_omop.measurement.measurement_concept_id = '3013502'

--quoted out line from measures-one-patient.sql
--AND dsf_omop.measurement.person_id = '14205'

AND visit_start_datetime > '2020-04-01'
AND visit_end_datetime < '2020-05-01'

ORDER BY measurement_datetime ASC
