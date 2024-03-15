FUNCTION zmg_popup_get_new_url.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(EV_URL) TYPE  S_URL
*"     REFERENCE(EV_ANSWER) TYPE  CHAR1
*"----------------------------------------------------------------------

  CALL SELECTION-SCREEN '2026' STARTING AT 5 5 ENDING AT 80 7.

  IF sy-subrc IS INITIAL.
    ev_url = p_newurl.
  ELSE.
    ev_answer = sy-subrc.
  ENDIF.


ENDFUNCTION.
