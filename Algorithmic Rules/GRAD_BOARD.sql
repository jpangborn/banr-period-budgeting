SELECT baninst1.mc_fa_budget.get_grad_board_standard(:AIDY, nvl(rzvpbgp_billing_hrs, 6))
FROM rzvpbgp
WHERE rzvpbgp_pidm = :PIDM
  AND rzvpbgp_aidy_code = :AIDY
  AND rzvpbgp_period = :PERIOD