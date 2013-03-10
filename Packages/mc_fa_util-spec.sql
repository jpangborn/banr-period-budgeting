CREATE OR REPLACE PACKAGE BANINST1.mc_fa_util AS

  FUNCTION get_decision(pidm_in in NUMBER,
                        term_in in VARCHAR,
                        appl_in IN NUMBER)
                        RETURN VARCHAR2;

  FUNCTION get_stu_rec_term(pidm_in IN NUMBER,
                            period_in IN VARCHAR)
                            RETURN VARCHAR2;

  FUNCTION get_stu_rec(pidm_in IN NUMBER,
                       period_in IN VARCHAR)
                       RETURN ROWID;

  FUNCTION get_adm_rec(pidm_in IN NUMBER,
                       period_in IN VARCHAR)
                       RETURN ROWID;
END mc_fa_util;