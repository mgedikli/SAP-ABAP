FUNCTION zmg_fm_01.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUMBER_01) TYPE  INT4
*"     REFERENCE(IV_NUMBER_02) TYPE  INT4
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  INT4
*"----------------------------------------------------------------------

  ev_result = iv_number_01 + iv_number_02.



ENDFUNCTION.
