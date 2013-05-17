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

  FUNCTION get_grad_tuition_rate(aidy_in IN VARCHAR2,
                                 tuitgrp_in IN VARCHAR2 DEFAULT 'DEFAULT')
                                 RETURN NUMBER IS
     tuit_rate NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO tuit_rate
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_TUIT'
        AND roralgs_key_3 = tuitgrp_in;
    END;

    RETURN tuit_rate;
  END get_grad_tuition_rate;

  FUNCTION get_grad_tech_fee(aidy_in IN VARCHAR2)
                             RETURN NUMBER IS
    tech_fee NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO tech_fee
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_TECH_FEE';
    END;

    RETURN tech_fee;
  END get_grad_tech_fee;

  FUNCTION get_grad_room_standard(aidy_in IN VARCHAR2,
                                  hrs_in IN NUMBER)
                                  RETURN NUMBER IS

     room NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO room
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_ROOM'
        AND roralgs_key_3 = 'STANDARD'
        AND hrs_in BETWEEN roralgs_key_4 AND roralgs_key_5;
    END;

    RETURN room;
  END get_grad_room_standard;

  FUNCTION get_grad_board_standard(aidy_in IN VARCHAR2,
                                   hrs_in IN NUMBER)
                                   RETURN NUMBER IS

    board NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO board
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_BOARD'
        AND roralgs_key_3 = 'STANDARD'
        AND hrs_in BETWEEN roralgs_key_4 AND roralgs_key_5;
    END;

    RETURN board;
  END get_grad_board_standard;

  FUNCTION get_grad_books(aidy_in IN VARCHAR2)
                          RETURN NUMBER IS

    books NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO books
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_BOOK';
    END;

    RETURN books;
  END get_grad_books;

  FUNCTION get_grad_pers(aidy_in IN VARCHAR2,
                         hrs_in IN NUMBER)
                         RETURN NUMBER IS

    pers NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO pers
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_PERS'
        AND hrs_in BETWEEN roralgs_key_3 AND roralgs_key_4;
    END;

    RETURN pers;
  END get_grad_pers;

  FUNCTION get_grad_travel(aidy_in IN VARCHAR2,
                           hrs_in IN NUMBER)
                           RETURN NUMBER IS

    travel NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO travel
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_TRAVEL'
        AND hrs_in BETWEEN roralgs_key_3 AND roralgs_key_4;
    END;

    RETURN travel;
  END get_grad_travel;

  FUNCTION get_grad_intensive_room(aidy_in IN VARCHAR2,
                                  type_in IN VARCHAR2)
                                  RETURN NUMBER IS

     room NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO room
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_ROOM'
        AND roralgs_key_3 = 'INTENSIVE'
        AND roralgs_key_4 = type_in;
    END;

    RETURN room;
  END get_grad_intensive_room;

  FUNCTION get_grad_intensive_board(aidy_in IN VARCHAR2,
                                   type_in IN VARCHAR2)
                                   RETURN NUMBER IS

      board NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO board
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'GRAD_BOARD'
        AND roralgs_key_3 = 'INTENSIVE'
        AND roralgs_key_4 = type_in;
    END;

    RETURN board;
  END get_grad_intensive_board;

  FUNCTION get_ug_pt_tuit(aidy_in IN VARCHAR2)
                          RETURN NUMBER IS

    tuit NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO tuit
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'UG_PT_TUIT';
    END;

    RETURN tuit;

  END get_ug_pt_tuit;

  FUNCTION get_ug_ov_tuit(aidy_in IN VARCHAR2)
                          RETURN NUMBER IS

    tuit NUMBER;

  BEGIN
    BEGIN
      SELECT roralgs_amt
      INTO tuit
      FROM roralgs
      WHERE roralgs_aidy_code = aidy_in
        AND roralgs_key_1 = 'BUDG'
        AND roralgs_key_2 = 'UG_OV_TUIT';
    END;

    RETURN tuit;

  END get_ug_ov_tuit;
END mc_fa_budget;
