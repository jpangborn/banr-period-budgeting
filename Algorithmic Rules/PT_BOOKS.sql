SELECT baninst1.mc_fa_budget.get_ug_pt_books_allow(:AIDY) * rzvpbgp_billing_hrs
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD