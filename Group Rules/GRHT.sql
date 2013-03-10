-- GRHT - Graduate - Half-time
-- Graduate Students who are Half-time

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'GR'
  AND rzvpbgp_billing_hrs BETWEEN 3 AND 5