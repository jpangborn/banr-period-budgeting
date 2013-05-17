SELECT baninst1.mc_fa_budget.get_art_fee(:AIDY, :PBTP)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD
  AND rzvpbgp_majr_code LIKE 'ART%'