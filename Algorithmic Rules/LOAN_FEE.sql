SELECT baninst1.mc_fa_budget.get_loan_fees(:AIDY, :PBTP)
FROM rorstat
WHERE rorstat_pidm = :PIDM
  AND rorstat_aidy_code = :AIDY
  AND rorstat_pckg_comp_date IS NULL
  OR (rorstat_pckg_comp_date IS NOT NULL
    AND NOT EXISTS (SELECT 'Y'
              FROM rprawrd
              WHERE rprawrd_pidm = rorstat_pidm
                AND rprawrd_aidy_code = rorstat_aidy_code
                AND rprawrd_fund_code IN ('FDSL','FDUL')
                AND rprawrd_awst_code IN ('OFRD','ACPT','ACPS')))