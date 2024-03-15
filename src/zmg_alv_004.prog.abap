*&---------------------------------------------------------------------*
*& Report ZMG_ALV_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alv_004.
"s.181)11.1.3. ALV’de kullanmak üzere buton oluşturma-1 (Custom PF-Status)
TYPES: BEGIN OF gty_table,
         box.
         INCLUDE STRUCTURE zmg_tablo_1.
TYPES: END OF gty_table.

DATA: gt_table        TYPE TABLE OF gty_table,
      gt_selected     TYPE TABLE OF gty_table,
      gs_selected     TYPE gty_table,
      gt_fieldcat     TYPE slis_t_fieldcat_alv,
      gs_fieldcat     TYPE slis_fieldcat_alv,
      gt_fieldcat_sel TYPE slis_t_fieldcat_alv,
      gs_layout       TYPE slis_layout_alv,
      gv_answer       TYPE c LENGTH 1,
      gv_new_e_mail   TYPE c LENGTH 80.

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

  LOOP AT gt_fieldcat INTO gs_fieldcat.
    CASE gs_fieldcat-fieldname.
      WHEN 'E_MAIL'.
        gs_fieldcat-hotspot = abap_true.
        MODIFY gt_fieldcat FROM gs_fieldcat TRANSPORTING hotspot WHERE fieldname = 'E_MAIL'.
    ENDCASE.
  ENDLOOP.

  gs_layout-zebra             = abap_true.
  gs_layout-colwidth_optimize = abap_true.
  gs_layout-box_fieldname     = 'BOX'.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = sy-repid
      is_layout                = gs_layout
      it_fieldcat              = gt_fieldcat
      i_callback_pf_status_set = 'MG_PF_STATUS'
      i_callback_user_command  = 'MG_USER_COMMAND'
    TABLES
      t_outtab                 = gt_table
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.

FORM mg_pf_status USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'MG_PF_STATUS'.
ENDFORM.

FORM mg_user_command USING lv_ucomm TYPE sy-ucomm
                           ls_selfield TYPE slis_selfield.

  CASE lv_ucomm.
    WHEN 'LEAVE'.
      LEAVE PROGRAM.
    WHEN 'SORT_BY_NAME'.
      SORT gt_table BY nachname ASCENDING.

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
    WHEN '&IC1'.
      IF ls_selfield-fieldname = 'ID'.
        SELECT * FROM zmg_tablo_1
          INTO CORRESPONDING FIELDS OF TABLE gt_selected
          WHERE id = ls_selfield-value.

        LOOP AT gt_fieldcat INTO gs_fieldcat.
          IF gs_fieldcat-key IS INITIAL AND gs_fieldcat-fieldname NE 'GEHALT'.
            gs_fieldcat-edit  = abap_true.
            gs_fieldcat-input = abap_true.
          ENDIF.

          APPEND gs_fieldcat TO gt_fieldcat_sel.
          CLEAR: gs_fieldcat.
        ENDLOOP.

        CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'   "ID hücresi üzerindeyken çift tıklayalım,Gelen popup penceresinde istediğimiz alanlardan birini değiştirelim.
          EXPORTING
            i_title               = TEXT-001
            i_screen_start_column = 5
            i_screen_start_line   = 5
            i_screen_end_column   = 165
            i_screen_end_line     = 8
            i_tabname             = 'GT_SELECTED'
            it_fieldcat           = gt_fieldcat_sel
            i_callback_program    = sy-repid
          IMPORTING
            e_exit                = gv_answer
          TABLES
            t_outtab              = gt_selected
          EXCEPTIONS
            program_error         = 1
            OTHERS                = 2.

        IF gv_answer IS INITIAL.
          READ TABLE gt_selected INTO gs_selected INDEX 1.
          IF sy-subrc IS INITIAL.
            UPDATE zmg_tablo_1 SET  vorname   = gs_selected-vorname
                                    nachname  = gs_selected-nachname
                                    job       = gs_selected-job
                                    gehalt    = gs_selected-gehalt
                                    curr      = gs_selected-curr
                                    gsm       = gs_selected-gsm
                                    e_mail    = gs_selected-e_mail
                                  WHERE id    = gs_selected-id.

            SELECT * FROM zmg_tablo_1 INTO CORRESPONDING FIELDS OF TABLE gt_table.

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
        ENDIF.
        "E_MAIL kolonunu HOTSPOT (üzerine 1 kere tıklandığında ALV’yi tetiklemesi için) haline getirelim.
        "Tıklanan e-mail adresini güncelleyebilmek için kullanıcıdan yeni bir e-mail adresi alalım ve database tablosunu güncelleyelim.
      ELSEIF ls_selfield-fieldname = 'E_MAIL'.
        CALL FUNCTION 'ZMC_POPUP_GET_E_MAIL'
          IMPORTING
            ev_e_mail = gv_new_e_mail
            ev_answer = gv_answer.
        IF gv_answer = 0 AND gv_new_e_mail IS NOT INITIAL.
          UPDATE zmg_tablo_1 SET e_mail = gv_new_e_mail
                           WHERE e_mail = ls_selfield-value.
        ENDIF.

        SELECT * FROM zmg_tablo_1 INTO CORRESPONDING FIELDS OF TABLE gt_table.

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
  ENDCASE.
ENDFORM.
