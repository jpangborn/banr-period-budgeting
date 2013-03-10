-- UGBRDG - Undergrad - Bridge Coursework
-- Students completing undergraduate coursework as part of an Associate to Masters program.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_styp_code = 'B'