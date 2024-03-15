*&---------------------------------------------------------------------*
*& Report ZMG_TEST_257A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_257A.
*SLG0/SLG1  Test 257 HAM hali ve SE91
PARAMETERS: p_agnum TYPE s_agncynum OBLIGATORY,
            p_name  TYPE string LOWER CASE.

DATA: gs_stravelag TYPE zcm_stravelag,
      gv_number    TYPE i.

DATA: gs_bal_log    TYPE bal_s_msg,
      gs_log_info   TYPE bal_s_log,
      gv_log_handle TYPE balloghndl.

CONSTANTS: gc_obj TYPE balobj_d VALUE 'ZCM_OBJ_1',
           gc_sub TYPE balsubobj VALUE 'ZCM_SUB_1'.

START-OF-SELECTION.

  PERFORM start.
  PERFORM check_id.
  PERFORM check_name.
  PERFORM update.

FORM start .

ENDFORM.

FORM check_id .
  SELECT SINGLE * FROM zcm_stravelag
    INTO gs_stravelag
    WHERE agencynum = p_agnum.

  IF gs_stravelag IS INITIAL.
    LEAVE PROGRAM.
  ELSE.
  ENDIF.
ENDFORM.

FORM check_name .
  IF p_name IS INITIAL.
    LEAVE PROGRAM.
  ENDIF.

  gv_number = strlen( p_name ).

  IF gv_number > 25.
    LEAVE PROGRAM.
  ENDIF.
ENDFORM.

FORM update .
  UPDATE zcm_stravelag SET name = p_name
                       WHERE agencynum = p_agnum.
  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.
ENDFORM.
