-- Sequence 1

SELECT baninst1.mc_fa_budget.get_grad_intensive_room(rzvpbgp_aidy_code, 'ART') * COUNT(sfrstcr_crn)
FROM rzvpbgp
LEFT JOIN sfrstcr
  ON rzvpbgp_pidm = sfrstcr_pidm
  AND rzvpbgp_term_code = sfrstcr_term_code
  AND sfrstcr_rsts_code IN ('RE','RW')
  AND sfrstcr_ptrm_code = 'GI'
LEFT JOIN ssbsect
  ON sfrstcr_term_code = ssbsect_term_code
  AND sfrstcr_crn = ssbsect_crn
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND ssbsect_subj_code = 'ART'
GROUP BY rzvpbgp_aidy_code, sfrstcr_crn

-- Sequence 2

SELECT baninst1.mc_fa_budget.get_grad_intensive_room(rzvpbgp_aidy_code, 'DEFAULT') * COUNT(sfrstcr_crn)
FROM rzvpbgp
LEFT JOIN sfrstcr
  ON rzvpbgp_pidm = sfrstcr_pidm
  AND rzvpbgp_term_code = sfrstcr_term_code
  AND sfrstcr_rsts_code IN ('RE','RW')
  AND sfrstcr_ptrm_code = 'GI'
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
GROUP BY rzvpbgp_aidy_code, sfrstcr_crn