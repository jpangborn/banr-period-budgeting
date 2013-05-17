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

  FUNCTION get_grad_tuition_rate(aidy_in IN VARCHAR2,
                                 tuitgrp_in IN VARCHAR2 DEFAULT 'DEFAULT')
                                 RETURN NUMBER;

  FUNCTION get_grad_tech_fee(aidy_in IN VARCHAR2)
                             RETURN NUMBER;

  FUNCTION get_grad_room_standard(aidy_in IN VARCHAR2,
                                  hrs_in IN NUMBER)
                                  RETURN NUMBER;

  FUNCTION get_grad_board_standard(aidy_in IN VARCHAR2,
                                   hrs_in IN NUMBER)
                                   RETURN NUMBER;

  FUNCTION get_grad_books(aidy_in IN VARCHAR2)
                          RETURN NUMBER;

  FUNCTION get_grad_pers(aidy_in IN VARCHAR2,
                         hrs_in IN NUMBER)
                         RETURN NUMBER;

  FUNCTION get_grad_travel(aidy_in IN VARCHAR2,
                           hrs_in IN NUMBER)
                           RETURN NUMBER;

  FUNCTION get_grad_intensive_room(aidy_in IN VARCHAR2,
                                  type_in IN VARCHAR2)
                                  RETURN NUMBER;

  FUNCTION get_grad_intensive_board(aidy_in IN VARCHAR2,
                                   type_in IN VARCHAR2)
                                   RETURN NUMBER;

  FUNCTION get_ug_pt_tuit(aidy_in IN VARCHAR2)
                          RETURN NUMBER;

  FUNCTION get_ug_ov_tuit(aidy_in IN VARCHAR2)
                          RETURN NUMBER;

END mc_fa_budget;
