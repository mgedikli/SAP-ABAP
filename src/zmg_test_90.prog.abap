*&---------------------------------------------------------------------*
*& Report ZMG_TEST_90
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_90.
*SE24 CLASS Kavrami-Public Method

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num_01 TYPE i,
              p_num_02 TYPE i,
              p_sembol TYPE c LENGTH 1.
SELECTION-SCREEN END OF BLOCK a1.

DATA: go_calculator TYPE REF TO zcalculator_mg,
      gv_sonuc      TYPE i.

START-OF-SELECTION.

  CREATE OBJECT go_calculator.

  IF p_sembol = '+'.
    go_calculator->topla(
      EXPORTING
        iv_num_topla_01 = p_num_01
        iv_num_topla_02 = p_num_02
      IMPORTING
        ev_sonuc_toplam =  gv_sonuc ).
  ELSEIF p_sembol = '-'.
    go_calculator->cikar(
      EXPORTING
        iv_num_cikar_01  =    p_num_01
        iv_num_cikar_02  =    p_num_02
      IMPORTING
        ev_sonuc_cikarma =    gv_sonuc ).
  ELSEIF p_sembol = '*'.
    go_calculator->carp(
      EXPORTING
        iv_num_carp_01  =    p_num_01
        iv_num_carp_02  =    p_num_02
      IMPORTING
        ev_sonuc_carpma =    gv_sonuc ).
  ELSEIF p_sembol = '/'.
    go_calculator->bol(
      EXPORTING
        iv_num_bol_01  =     p_num_01
        iv_num_bol_02  =     p_num_02
      IMPORTING
        ev_sonuc_bolme =     gv_sonuc ).
  ELSE.
    MESSAGE TEXT-002 TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

  WRITE: gv_sonuc.
