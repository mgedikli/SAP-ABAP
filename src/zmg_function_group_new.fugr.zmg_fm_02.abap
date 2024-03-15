FUNCTION zmg_fm_02.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_TEXT_01) TYPE  CHAR40
*"     REFERENCE(IV_TEXT_02) TYPE  CHAR40
*"     VALUE(IV_UPPERCASE) TYPE  XFELD
*"  EXPORTING
*"     REFERENCE(EV_TEXT) TYPE  CHAR80
*"----------------------------------------------------------------------

  CONCATENATE iv_text_01 iv_text_02 INTO ev_text SEPARATED BY space.

IF iv_uppercase is not INITIAL. "abap_true " eq 'X'
  TRANSLATE ev_text TO UPPER CASE.
ENDIF.


ENDFUNCTION.
