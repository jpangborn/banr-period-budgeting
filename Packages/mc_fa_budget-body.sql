CREATE OR REPLACE PACKAGE BODY BANINST1.mc_fa_budget IS

  -- Function and procedure implementations

  -- Retreive the Art Fee
  FUNCTION get_art_fee(aidy_in IN VARCHAR2,
                       btyp_in IN VARCHAR2)
                       RETURN NUMBER IS

    fee NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO fee
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'ART_FEE'
        AND roralgs_key_3 = btyp_in;
    END;

    RETURN fee;
  END get_art_fee;

  -- Retreive the Music Fee
  FUNCTION get_music_fee(aidy_in IN VARCHAR2,
                         btyp_in IN VARCHAR2)
                         RETURN NUMBER IS

    fee NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO fee
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'MUSIC_FEE'
        AND roralgs_key_3 = btyp_in;
    END;

    RETURN fee;
  END get_music_fee;

  -- Retreive the Nursing Fee
  FUNCTION get_nursing_fee(aidy_in IN VARCHAR2,
                           btyp_in IN VARCHAR2,
                           clas_in IN VARCHAR2)
                           RETURN NUMBER IS

    clas VARCHAR2(2);
    fee NUMBER;

  BEGIN
    IF clas_in IS NULL THEN
      clas := 'FY';
    ELSE
      clas := clas_in;
    END IF;

    BEGIN
      SELECT roralgs_amt
      INTO fee
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'NURSING_FEE'
        AND roralgs_key_3 = btyp_in
        AND roralgs_key_4 = clas;
    END;

    RETURN fee;
  END get_nursing_fee;

  -- Retreive the Loan Fees
  FUNCTION get_loan_fees(aidy_in IN VARCHAR2,
                         btyp_in IN VARCHAR2)
                         RETURN NUMBER IS

    fees NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO fees
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'LOAN_FEES'
        AND roralgs_key_3 = btyp_in;
    END;

    RETURN fees;

  END get_loan_fees;
END mc_fa_budget;
