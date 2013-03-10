-- UGHTON - Undergrad - Half-time - On-campus
-- Undergraduate Students who are half-time and living on-campus.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'UG'
  AND rzvpbgp_billing_hrs BETWEEN 6 AND 8
  AND (rzvpbgp_housing_code = '2'
    OR rzvpbgp_housing_code IS NULL)