-- Sequence 1

SELECT baninst1.mc_fa_budget.get_grad_tech_fee(rzvpbgp_aidy_code) * COUNT(sfrstcr_crn)
FROM rzvpbgp
LEFT JOIN sfrstcr
  ON rzvpbgp_pidm = sfrstcr_pidm
  AND rzvpbgp_term_code = sfrstcr_term_code
  AND sfrstcr_rsts_code IN ('RE','RW')
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND sfrstcr_pidm IS NOT NULL
GROUP BY rzvpbgp_aidy_code, sfrstcr_crn

-- Sequence 2

SELECT baninst1.mc_fa_budget.get_grad_tech_fee(rzvpbgp_aidy_code) * 2
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
