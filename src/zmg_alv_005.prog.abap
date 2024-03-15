*&---------------------------------------------------------------------*
*& Report ZMG_ALV_005
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alv_005.
*s-192- ALV’de kullanmak üzere buton oluşturma-2 (Copy PF-Status)
TYPES: BEGIN OF gty_table,
         box.
         INCLUDE STRUCTURE zmg_tablo_1.
TYPES: END OF gty_table.

DATA: gt_table    TYPE TABLE OF gty_table,
      gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_layout   TYPE slis_layout_alv,
      gv_answer   TYPE c LENGTH 1.

START-OF-SELECTION.

  SELECT * FROM zmg_tablo_1 INTO CORRESPONDING FIELDS OF TABLE gt_table.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_TABLO_1'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

  gs_layout-zebra             = abap_true.
  gs_layout-colwidth_optimize = abap_true.
  gs_layout-box_fieldname     = 'BOX'.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      i_callback_pf_status_set = 'MG_PF_STATUS'
      i_callback_user_command  = 'MG_USER_COMMAND'
      is_layout                = gs_layout
      it_fieldcat              = gt_fieldcat
    TABLES
      t_outtab                 = gt_table
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.

FORM mg_pf_status USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS_ZMG_ALV_005'.
ENDFORM.

FORM mg_user_command USING lv_ucomm TYPE sy-ucomm
                           ls_selfield TYPE slis_selfield.

  CASE lv_ucomm.
    WHEN 'SIL'.
      IF ls_selfield-fieldname = 'ID'.
        DELETE gt_table WHERE id = ls_selfield-value.

        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            text_question  = 'Database Tablosundan da silmek istiyor musunuz?'
          IMPORTING
            answer         = gv_answer
          EXCEPTIONS
            text_not_found = 1
            OTHERS         = 2.

        IF gv_answer = 1.
          DELETE FROM zmg_tablo_1 WHERE id = ls_selfield-value.
        ENDIF.

        CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
          EXPORTING
            i_callback_program       = sy-repid
            i_callback_pf_status_set = 'MG_PF_STATUS'
            i_callback_user_command  = 'MG_USER_COMMAND'
            is_layout                = gs_layout
            it_fieldcat              = gt_fieldcat
          TABLES
            t_outtab                 = gt_table
          EXCEPTIONS
            program_error            = 1
            OTHERS                   = 2.
      ENDIF.
    WHEN 'GERI'.
      LEAVE PROGRAM.
  ENDCASE.
ENDFORM.
