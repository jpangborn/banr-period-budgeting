-- UGHTOF - Undergrad - Half-Time - Off-Campus
-- Undergraduate Students who are Half-time and living off-campus.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'UG'
  AND rzvpbgp_billing_hrs BETWEEN 6 AND 8
  AND rzvpbgp_housing_code = '3'