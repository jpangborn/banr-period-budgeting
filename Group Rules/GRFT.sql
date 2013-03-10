-- GRFT - Graduate - Full Time
-- Graduate Students who are Full Time

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'GR'
  AND (rzvpbgp_billing_hrs >= 6
    OR rzvpbgp_billing_hrs IS NULL)