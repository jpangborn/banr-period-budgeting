-- UGFTCO - Undergrad - Full Time - Commuter
-- Undergraduate Students who are full tme and commuting.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'UG'
  AND (rzvpbgp_billing_hrs BETWEEN 12 AND 18
    OR rzvpbgp_billing_hrs IS NULL)
  AND rzvpbgp_housing_code IN ('1','4')