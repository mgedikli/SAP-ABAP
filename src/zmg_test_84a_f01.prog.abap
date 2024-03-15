*&---------------------------------------------------------------------*
*& Include ZMG_TEST_84A_F01
*&---------------------------------------------------------------------*

FORM check_id.
  IF p_id IS INITIAL.
    MESSAGE TEXT-002 TYPE 'S' DISPLAY LIKE 'E'.
  ELSE.
    EXIT.
    SELECT SINGLE * FROM zmc_table_001 INTO gs_structure WHERE id = p_id.
    IF sy-subrc IS INITIAL.
      MESSAGE TEXT-003 TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ENDIF.
  ENDIF.
ENDFORM.

FORM create.
  gs_structure-id      = p_id.
  gs_structure-name    = p_name.
  gs_structure-surname = p_sname.
  gs_structure-job     = p_job.
  gs_structure-salary  = p_slry.
  gs_structure-curr    = p_curr.
  gs_structure-gsm     = p_gsm.
  gs_structure-e_mail  = p_email.

  INSERT zmc_table_001 FROM gs_structure.
  IF sy-subrc IS INITIAL.
    MESSAGE TEXT-004 TYPE 'S'.
  ELSE.
    MESSAGE TEXT-005 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

  CLEAR: gs_structure.
ENDFORM.

FORM read.
  IF p_id IS INITIAL.
    SELECT * FROM zmc_table_001 INTO TABLE gt_table.
    IF sy-subrc IS INITIAL.
      LOOP AT gt_table INTO gs_structure.
        WRITE: gs_structure-id,  gs_structure-name,   gs_structure-surname,
               gs_structure-job, gs_structure-salary, gs_structure-curr,
               gs_structure-gsm, gs_structure-e_mail.

        CLEAR: gs_structure.
        SKIP.
        ULINE.
      ENDLOOP.
    ELSE.
      MESSAGE TEXT-006 TYPE 'I'.
    ENDIF.
  ELSE.
    SELECT SINGLE * FROM zmc_table_001 INTO gs_structure WHERE id = p_id.
    IF sy-subrc IS INITIAL.
      WRITE: gs_structure-id,  gs_structure-name,   gs_structure-surname,
             gs_structure-job, gs_structure-salary, gs_structure-curr,
             gs_structure-gsm, gs_structure-e_mail.

      CLEAR: gs_structure.
    ELSE.
      MESSAGE TEXT-007 TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.
  ENDIF.
ENDFORM.

FORM check_update.
  IF p_id IS INITIAL.
    MESSAGE TEXT-008 TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

ENDFORM.

FORM update.
  SELECT SINGLE * FROM zmc_table_001 INTO  gs_structure WHERE id = p_id.
  IF sy-subrc IS INITIAL.
    UPDATE zmc_table_001 SET name     = p_name
                             surname  = p_sname
                             job      = p_job
                             salary   = p_slry
                             curr     = p_curr
                             gsm      = p_gsm
                             e_mail   = p_email WHERE id = p_id.

    IF sy-subrc IS INITIAL.
      MESSAGE TEXT-009 TYPE 'S'.
    ELSE.
      MESSAGE TEXT-010 TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.
  ELSE.
    MESSAGE TEXT-011 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.

FORM check_delete.
  IF p_id IS INITIAL.
    MESSAGE TEXT-012 TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.
ENDFORM.

FORM delete.
  SELECT SINGLE * FROM zmc_table_001 INTO  gs_structure WHERE id = p_id.
  IF sy-subrc IS INITIAL.
    DELETE FROM zmc_table_001 WHERE id = p_id.
    IF sy-subrc IS INITIAL.
      MESSAGE TEXT-013 TYPE 'S'.
    ELSE.
      MESSAGE TEXT-014 TYPE 'S' DISPLAY LIKE 'E'.
    ENDIF.
  ELSE.
    MESSAGE TEXT-015 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.
