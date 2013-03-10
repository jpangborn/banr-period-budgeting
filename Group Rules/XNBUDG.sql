-- XNBUDG - No Budget
-- Students who will not be processed and should not have a budget.

SELECT DISTINCT(rzvpbgp_pidm)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND (rzvpbgp_module IS NULL
    OR (rzvpbgp_module = 'A'
      AND ((rzvpbgp_apdc_code NOT LIKE 'A%'
      AND rzvpbgp_apdc_code NOT LIKE 'X%'
      AND rzvpbgp_apdc_code NOT LIKE 'R%'
      AND rzvpbgp_apdc_code NOT IN ('GA', 'GX', 'GP', 'GR', 'GC', 'GV'))
      OR rzvpbgp_apdc_code IS NULL))
    OR (rzvpbgp_module = 'S'
      AND rzvpbgp_stst_code = 'IS'))