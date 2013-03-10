CREATE OR REPLACE PACKAGE BANINST1.mc_fa_budget IS

  -- Author  : JPANGBORN
  -- Created : 3/5/2013 8:48:04 AM
  -- Purpose : Retreive or Calculate Budget Components

  -- Public function and procedure declarations
  FUNCTION get_art_fee(aidy_in IN VARCHAR2,
                       btyp_in IN VARCHAR2)
                       RETURN NUMBER;

  FUNCTION get_music_fee(aidy_in IN VARCHAR2,
                         btyp_in IN VARCHAR2)
                         RETURN NUMBER;

  FUNCTION get_nursing_fee(aidy_in IN VARCHAR2,
                           btyp_in IN VARCHAR2,
                           clas_in IN VARCHAR2)
                           RETURN NUMBER;

  FUNCTION get_loan_fees(aidy_in IN VARCHAR2,
                         btyp_in IN VARCHAR2)
                         RETURN NUMBER;

END mc_fa_budget;