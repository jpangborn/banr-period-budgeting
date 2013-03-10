CREATE OR REPLACE PACKAGE BODY BANINST1.mc_fa_util AS

  -- Return the Latest Decision Code for an Admissions Application
  FUNCTION get_decision(pidm_in IN NUMBER,
                        term_in IN VARCHAR,
                        appl_in IN NUMBER)
                        RETURN VARCHAR2 IS

    a_apdc sarappd.sarappd_apdc_code%TYPE;

  CURSOR sarappd_list IS
    SELECT sarappd_apdc_code
    FROM sarappd
    WHERE sarappd_pidm = pidm_in
      AND sarappd_term_code_entry = term_in
      AND sarappd_appl_no = appl_in
    ORDER BY sarappd_apdc_date DESC,
             sarappd_seq_no DESC;

  BEGIN
    OPEN sarappd_list;
    FETCH sarappd_list into a_apdc;

    IF sarappd_list%NOTFOUND then
       a_apdc := NULL;
    END IF;

    CLOSE sarappd_list;

    RETURN a_apdc;
  END get_decision;

  -- Return the Term Code of the Student Record associated with a given Period
  FUNCTION get_stu_rec_term(pidm_in IN NUMBER,
                            period_in IN VARCHAR)
                            RETURN VARCHAR2 IS

    term_code VARCHAR2(8);

  BEGIN
    BEGIN
      SELECT MAX(sgbstdn_term_code_eff)
      INTO term_code
      FROM sgbstdn
      WHERE sgbstdn_pidm = pidm_in
        AND sgbstdn_term_code_eff <= (SELECT rorprds_term_code
                                      FROM rorprds
                                      WHERE rorprds_period = period_in
                                        AND rorprds_student_ind = 'Y');
    END;

    RETURN term_code;
  END get_stu_rec_term;

  -- Return the Row ID of the Student Record assocaited with a Period.
  FUNCTION get_stu_rec(pidm_in IN NUMBER,
                       period_in IN VARCHAR)
                       RETURN ROWID IS

    r_id ROWID;

    CURSOR sgbstdn_list IS
      SELECT sgbstdn.rowid
      FROM sgbstdn
      WHERE sgbstdn_pidm = pidm_in
        AND sgbstdn_term_code_eff <= (SELECT rorprds_term_code
                                      FROM rorprds
                                      WHERE rorprds_period = period_in
                                        AND rorprds_student_ind = 'Y')
      ORDER BY sgbstdn_term_code_eff desc;

  BEGIN
    BEGIN
      OPEN sgbstdn_list;
      FETCH sgbstdn_list INTO r_id;

      IF sgbstdn_list%NOTFOUND THEN
        r_id:= NULL;
      END IF;

      CLOSE sgbstdn_list;
    END;

    RETURN r_id;

  END get_stu_rec;

  -- Return the Row ID of the Admissions Application assocaited with a Period.
  FUNCTION get_adm_rec(pidm_in IN NUMBER,
                       period_in IN VARCHAR)
                       RETURN ROWID IS

    r_id ROWID;

    CURSOR saradap_list IS
      SELECT saradap.rowid
      FROM saradap
      WHERE saradap_pidm = pidm_in
        AND saradap_term_code_entry = (SELECT rorprds_term_code
                                       FROM rorprds
                                       WHERE rorprds_period = period_in
                                         AND rorprds_student_ind = 'Y')
      ORDER BY saradap_term_code_entry desc,
               saradap_appl_no desc;

  BEGIN
    BEGIN
      OPEN saradap_list;
      FETCH saradap_list INTO r_id;

      IF saradap_list%NOTFOUND THEN
        r_id := NULL;
      END IF;

      CLOSE saradap_list;
    END;

    RETURN r_id;

  END get_adm_rec;
END mc_fa_util;