-- GRLH - Graduate - Less than Half Time
-- Graduate students who are less than half time.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_levl_code = 'GR'
  AND rzvpbgp_billing_hrs < 3