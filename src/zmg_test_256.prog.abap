*&---------------------------------------------------------------------*
*& Report ZMG_TEST_256
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_256.
*T-Code SLG0 ve SLG1 (Log oluşturma) s.311 DAY66_dk_1:45

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS : p_agnum TYPE s_agncynum OBLIGATORY,
               p_name  TYPE string LOWER CASE.

SELECTION-SCREEN END OF BLOCK a1.

DATA : gs_log_info       TYPE bal_s_log,
       gs_bal_log        TYPE bal_s_msg,
       gv_log_handle     TYPE balloghndl,
       gv_timestamp      TYPE tzntstmps,
       gs_stravelag      TYPE zcm_stravelag,
       gv_number_of_char TYPE i.

CONSTANTS : gc_object     TYPE balobj_d  VALUE 'ZMG_OBJ_1',
            gc_sub_object TYPE balsubobj VALUE 'ZMG_SUB_1'.

START-OF-SELECTION.

  PERFORM prep_log.
  PERFORM first_log.
  PERFORM check_id.
  PERFORM check_name.
  PERFORM update.
  PERFORM save_log.

FORM prep_log .

  "gv_timestamp YYYYMMDDHHMMSS
  CONVERT DATE sy-datum TIME sy-uzeit
  INTO TIME STAMP gv_timestamp
  TIME ZONE sy-zonlo.

  "Log kaydı olusturabilmem için bir sira numarası almam gerekiyor

  gs_log_info-object    = gc_object.
  gs_log_info-subobject = gc_sub_object.
  gs_log_info-extnumber = gv_timestamp.
  CONDENSE gs_log_info-extnumber.

  CALL FUNCTION 'ADD_TIME_TO_DATE'
    EXPORTING
      i_idate               = sy-datum
      i_time                = 2   " Hafta sayisi
      i_iprkz               = '1' " Hafta (kategori)
    IMPORTING
      o_idate               = gs_log_info-aldate_del
    EXCEPTIONS
      invalid_period        = 1
      invalid_round_up_rule = 2
      internal_error        = 3
      OTHERS                = 4.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = gs_log_info
    IMPORTING
      e_log_handle            = gv_log_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM first_log .

  gs_bal_log-msgty = 'S'.
  gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
  gs_bal_log-msgno = 12.
  gs_bal_log-msgv1 = sy-datum.
  gs_bal_log-msgv2 = sy-uzeit.
  gs_bal_log-msgv3 = sy-uname.

  "İlk kaydımızı atıyoruz
  PERFORM add_log.

  gs_bal_log-msgty = 'S'.
  gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
  gs_bal_log-msgno = 13.
  gs_bal_log-msgv1 = p_agnum.
  gs_bal_log-msgv2 = p_name.

  "ikinci kaydımızı atıyoruz
  PERFORM add_log.

ENDFORM.

FORM check_id .

  SELECT SINGLE * FROM zcm_stravelag
    INTO gs_stravelag
   WHERE agencynum = p_agnum.

  IF gs_stravelag IS INITIAL.
    "Aranan satır bulunamadığına dair log kaydını doldurucaz.

    gs_bal_log-msgty = 'E'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno =  14.
    gs_bal_log-msgv1 =  p_agnum.

    PERFORM add_log.

    "Eklenen log kayıtlarını sisteme kaydedip çıkıyorum.
    PERFORM save_log.
    LEAVE PROGRAM.
  ELSE.

    gs_bal_log-msgty = 'S'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 15.
    gs_bal_log-msgv1 = p_agnum.

    "log kaydını ekliyoruz
    PERFORM add_log.
  ENDIF.

ENDFORM.

FORM check_name .

  IF p_name IS INITIAL.

    gs_bal_log-msgty = 'E'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 16.

    "Log kaydını ekliyoruz.
    PERFORM add_log.

    "Eklenen log kayıtlarını sisteme kaydedip çıkıyorum.
    PERFORM save_log.
    LEAVE PROGRAM.

  ELSE.

    gs_bal_log-msgty = 'S'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 17.

    "Log kaydını ekliyoruz.
    PERFORM add_log.

  ENDIF.

  gv_number_of_char = strlen( p_name ).

  IF gv_number_of_char > 25.

    gs_bal_log-msgty = 'E'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 18.
    gs_bal_log-msgv1 = p_name.

    "Log kaydını ekliyoruz.
    PERFORM add_log.

    "Eklenen log kayıtlarını sisteme kaydedip çıkıyorum.
    PERFORM save_log.
    LEAVE PROGRAM.

  ELSE.

    gs_bal_log-msgty = 'S'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 19.
    gs_bal_log-msgv1 = p_name.

    "Log kaydini ekliyoruz.
    PERFORM add_log.

  ENDIF.

ENDFORM.

FORM update .

  UPDATE zcm_stravelag SET name      = p_name
                     WHERE agencynum = p_agnum.

  IF sy-subrc IS NOT INITIAL.

    gs_bal_log-msgty = 'E'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 20.

    "Log kaydını ekliyoruz.
    PERFORM add_log.

    "Eklenen log kayıtlarını sisteme kaydedip çıkıyorum.
    PERFORM save_log.
    LEAVE PROGRAM.

  ELSE.

    gs_bal_log-msgty = 'S'.
    gs_bal_log-msgid = 'ZMG_MSG_CLASS'.
    gs_bal_log-msgno = 21.

    "Log kaydını ekliyoruz.
    PERFORM add_log.

  ENDIF.

ENDFORM.

FORM save_log .

  CALL FUNCTION 'BAL_DB_SAVE'
    EXPORTING
      i_save_all       = abap_true
    EXCEPTIONS
      log_not_found    = 1
      save_not_allowed = 2
      numbering_error  = 3
      OTHERS           = 4.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM add_log .

  CALL FUNCTION 'BAL_LOG_MSG_ADD'
    EXPORTING
      i_log_handle     = gv_log_handle
      i_s_msg          = gs_bal_log
    EXCEPTIONS
      log_not_found    = 1
      msg_inconsistent = 2
      log_is_full      = 3
      OTHERS           = 4.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.
