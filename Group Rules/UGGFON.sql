-- UGGFON - Undergrad - Greater than Full Time - On Campus
-- Undergraduate Students who are greater than full time and living on campus.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'UG'
  AND rzvpbgp_billing_hrs > 18
  AND (rzvpbgp_housing_code = '2'
    OR rzvpbgp_housing_code IS NULL)