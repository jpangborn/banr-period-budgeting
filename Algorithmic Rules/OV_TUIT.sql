SELECT baninst1.mc_fa_budget.get_ug_ov_tuit(':AIDY') * (rzvpbgp_billing_hrs - 18)
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD