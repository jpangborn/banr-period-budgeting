SELECT baninst1.mc_fa_budget.get_nursing_fee(:AIDY, :PBTP, rzvpbgp_clas_code)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_majr_code LIKE 'NUR%'