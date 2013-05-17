-- Sequence 1

SELECT baninst1.mc_fa_budget.get_grad_tuition_rate(:AIDY, 'NURSING') * nvl(rzvpbgp_billing_hrs, 6)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_majr_code = 'NURS'

-- Sequence 2

SELECT baninst1.mc_fa_budget.get_grad_tuition_rate(:AIDY, 'YYA') * nvl(rzvpbgp_billing_hrs, 6)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_majr_code = 'YYAM'

-- Sequence 3

SELECT baninst1.mc_fa_budget.get_grad_tuition_rate(:AIDY, 'DEFAULT') * nvl(rzvpbgp_billing_hrs, 6)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD