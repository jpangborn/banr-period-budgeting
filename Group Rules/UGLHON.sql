-- UGLHON - Undergrad - Less than HT - On-Campus
-- Undergraduate Students who are Less than Half Time and living On-Campus.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'UG'
  AND rzvpbgp_billing_hrs < 6
  AND (rzvpbgp_housing_code = '2'
    OR rzvpbgp_housing_code IS NULL)