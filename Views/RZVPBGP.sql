CREATE OR REPLACE VIEW BANINST1.RZVPBGP AS
  SELECT rorstat_pidm AS rzvpbgp_pidm,
         rorstat_aidy_code AS rzvpbgp_aidy_code,
         rorstat_aprd_code AS rzvpbgp_aprd_code,
         rortprd_period AS rzvpbgp_period,
         rorprds_term_code AS rzvpbgp_term_code,
         stvterm_start_date AS rzvpbgp_term_start_date,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN 'A'
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN 'S'
           WHEN aidy_adm_rec IS NOT NULL
             THEN 'A'
           WHEN stu_rec IS NOT NULL
             THEN 'S'
           ELSE NULL
         END AS rzvpbgp_module,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN a.saradap_term_code_entry
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN sgbstdn_term_code_eff
           WHEN aidy_adm_rec IS NOT NULL
             THEN b.saradap_term_code_entry
           WHEN stu_rec IS NOT NULL
             THEN sgbstdn_term_code_eff
           ELSE NULL
         END AS rzvpbgp_term_code_rec,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN a.saradap_levl_code
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN sgbstdn_levl_code
           WHEN aidy_adm_rec IS NOT NULL
             THEN b.saradap_levl_code
           WHEN stu_rec IS NOT NULL
             THEN sgbstdn_levl_code
           ELSE NULL
         END AS rzvpbgp_levl_code,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN a.saradap_styp_code
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN sgbstdn_styp_code
           WHEN aidy_adm_rec IS NOT NULL
             THEN b.saradap_styp_code
           WHEN stu_rec IS NOT NULL
             THEN sgbstdn_styp_code
           ELSE NULL
         END AS rzvpbgp_styp_code,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN a.saradap_majr_code_1
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN sgbstdn_majr_code_1
           WHEN aidy_adm_rec IS NOT NULL
             THEN b.saradap_majr_code_1
           WHEN stu_rec IS NOT NULL
             THEN sgbstdn_majr_code_1
           ELSE NULL
         END AS rzvpbgp_majr_code,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN a.saradap_admt_code
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN NULL
           WHEN aidy_adm_rec IS NOT NULL
             THEN b.saradap_admt_code
           ELSE NULL
         END AS rzvpbgp_admt_code,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN baninst1.mc_fa_util.get_decision(rorstat_pidm,
                                                   a.saradap_term_code_entry,
                                                   a.saradap_appl_no)
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN NULL
           WHEN aidy_adm_rec IS NOT NULL
             THEN baninst1.mc_fa_util.get_decision(rorstat_pidm,
                                                   b.saradap_term_code_entry,
                                                   b.saradap_appl_no)
           ELSE NULL
         END AS rzvpbgp_apdc_code,
         CASE
           WHEN adm_rec IS NOT NULL
             THEN NULL
           WHEN stu_rec IS NOT NULL AND aidy_adm_rec IS NOT NULL AND sgbstdn_term_code_eff >= b.saradap_term_code_entry
             THEN sgbstdn_stst_code
           WHEN aidy_adm_rec IS NOT NULL
             THEN NULL
           WHEN stu_rec IS NOT NULL
             THEN sgbstdn_stst_code
           ELSE NULL
         END AS rzvpbgp_stst_code,
         f_class_calc_fnc(rorstat_pidm, sgbstdn_levl_code, rorprds_term_code) AS rzvpbgp_clas_code,
         CASE
           WHEN SYSDATE < stvterm_start_date
             THEN billing_hrs_override
           ELSE billing_hrs
         END AS rzvpbgp_billing_hrs,
         CASE
           WHEN housing_code_override IS NULL
             THEN rcrapp1_inst_hous_cde
           ELSE housing_code_override
         END AS rzvpbgp_housing_code
  FROM (SELECT rorstat_pidm,
               rorstat_aidy_code,
               rorstat_aprd_code,
               rortprd_period,
               rorprds_term_code,
               stvterm_start_date,
               rcrapp1_inst_hous_cde,
               rokmisc_rules.f_calc_rule_hrs_no_rotsreg(rorstat_aidy_code,
                                                        rorstat_pidm,
                                                        rorprds_term_code,
                                                        'STANDARD',
                                                        'B') AS billing_hrs,
               CASE
                 WHEN rortprd_period = '20' || (to_number(substr(rorstat_aidy_code, 0, 2)) - 1) || '30'
                   THEN robusdf_value_85
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '10'
                   THEN robusdf_value_86
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '20'
                   THEN robusdf_value_87
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '30'
                   THEN robusdf_value_88
               END AS housing_code_override,
               CASE
                 WHEN rortprd_period = '20' || (to_number(substr(rorstat_aidy_code, 0, 2)) - 1) || '30'
                   THEN to_number(robusdf_value_81)
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '10'
                   THEN to_number(robusdf_value_82)
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '20'
                   THEN to_number(robusdf_value_83)
                 WHEN rortprd_period = '20' || substr(rorstat_aidy_code, 0, 2) || '30'
                   THEN to_number(robusdf_value_84)
               END AS billing_hrs_override,
               baninst1.mc_fa_util.get_stu_rec(rorstat_pidm, rortprd_period) AS stu_rec,
               baninst1.mc_fa_util.get_adm_rec(rorstat_pidm, rortprd_period) AS adm_rec,
               baninst1.mc_fa_util.get_aidy_adm_rec(rorstat_pidm, rorstat_aidy_code) AS aidy_adm_rec
        FROM rorstat
        INNER JOIN rortprd
          ON rorstat_aidy_code = rortprd_aidy_code
          AND rorstat_aprd_code = rortprd_aprd_code
        INNER JOIN rorprds
          ON rortprd_period = rorprds_period
        INNER JOIN stvterm
          ON rorprds_term_code = stvterm_code
        INNER JOIN robusdf
          ON rorstat_aidy_code = robusdf_aidy_code
          AND rorstat_pidm = robusdf_pidm
        LEFT OUTER JOIN rcrapp1
          ON rorstat_aidy_code = rcrapp1_aidy_code
          AND rorstat_pidm = rcrapp1_pidm
          AND rcrapp1_infc_code = 'EDE'
          AND rcrapp1_curr_rec_ind = 'Y'
        WHERE rorprds_student_ind = 'Y') r
  LEFT OUTER JOIN sgbstdn
    ON sgbstdn.rowid = r.stu_rec
  LEFT OUTER JOIN saradap a
    ON a.rowid = r.adm_rec
  LEFT OUTER JOIN saradap b
    ON b.rowid = r.aidy_adm_rec;
