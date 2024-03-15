*&---------------------------------------------------------------------*
*& Report ZMG_TEST_246
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_246b.
*ZMG_STRAVELAG / Tablonun kendi Fcat Kullanarak_/ALV 1.Yön.buton1(Custom PF-Status)/Cift TiklamayiYakalamaS:175
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
* Tüm Name hücreleri edit edilebilir hale geldi BU ISTENMEYEN BIR DURUM.XXXXXXXXXXXX
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

TYPES: BEGIN OF gty_table,
         box TYPE c LENGTH 1.
         INCLUDE STRUCTURE zmg_stravelag.
TYPES: END OF gty_table.

DATA: gt_table       TYPE TABLE OF gty_table,
      gt_table_popup TYPE TABLE OF gty_table,
      gs_table       TYPE gty_table,
      gt_fieldcat    TYPE slis_t_fieldcat_alv,
      gt_fcat_popup  TYPE slis_t_fieldcat_alv,
      gs_fcat_popup  TYPE slis_fieldcat_alv,
      gs_fieldcat    TYPE slis_fieldcat_alv,
      gs_layout      TYPE slis_layout_alv,
      gv_answer      TYPE c LENGTH 1.

SELECT * FROM zmg_stravelag INTO CORRESPONDING FIELDS OF TABLE gt_table.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name       = 'ZMG_STRAVELAG'
    i_bypassing_buffer     = abap_true
  CHANGING
    ct_fieldcat            = gt_fieldcat
  EXCEPTIONS
    inconsistent_interface = 1
    program_error          = 2
    OTHERS                 = 3.
IF sy-subrc IS NOT INITIAL.
  LEAVE PROGRAM.
ENDIF.

gt_fcat_popup = gt_fieldcat.

gs_layout-zebra = abap_true.
gs_layout-colwidth_optimize = abap_true.
gs_layout-box_fieldname = 'BOX'.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program       = sy-repid "ZMG_TEST_246A ->yani System Report ID
    is_layout                = gs_layout
    it_fieldcat              = gt_fieldcat
    i_callback_pf_status_set = 'PF_STATUS_246A'     " PF_STATUS acilmali
    i_callback_user_command  = 'UC_246A'            " User Command acilmali
  TABLES
    t_outtab                 = gt_table
  EXCEPTIONS
    program_error            = 1
    OTHERS                   = 2.

IF sy-subrc IS NOT INITIAL.
  LEAVE PROGRAM.
ENDIF.

FORM pf_status_246a USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'STATUS_246A'.
ENDFORM.

FORM uc_246a USING lv_ucomm TYPE sy-ucomm
                   ls_selfield TYPE slis_selfield.

  CASE lv_ucomm.
    WHEN 'GERI'.
      LEAVE PROGRAM.
    WHEN 'SIRALA'.
      SORT gt_table BY name. "ASCENDING

      CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
        EXPORTING
          i_callback_program       = sy-repid "ZMG_TEST_246A ->yani System Report ID
          is_layout                = gs_layout
          it_fieldcat              = gt_fieldcat
          i_callback_pf_status_set = 'PF_STATUS_246A'     " PF_STATUS acilmali
          i_callback_user_command  = 'UC_246A'            " User Command acilmali
        TABLES
          t_outtab                 = gt_table
        EXCEPTIONS
          program_error            = 1
          OTHERS                   = 2.

      IF sy-subrc IS NOT INITIAL.
        LEAVE PROGRAM.
      ENDIF.
    WHEN '&IC1'.

      CLEAR: gt_table_popup.

      READ TABLE gt_table INTO gs_table INDEX ls_selfield-tabindex.
      IF sy-subrc IS INITIAL.

*        LOOP AT gt_fcat_popup INTO gs_fcat_popup.
*
*          IF gs_fcat_popup-fieldname  = 'NAME'.
*            gs_fcat_popup-edit       = abap_true.
*            gs_fcat_popup-input      = abap_true.
*
*            MODIFY gt_fcat_popup FROM gs_fcat_popup TRANSPORTING edit input WHERE fieldname = gs_fcat_popup-fieldname. "'NAME'
*          ENDIF.
*        ENDLOOP.

        LOOP AT gt_fieldcat INTO gs_fieldcat.

          IF gs_fieldcat-fieldname  = 'NAME'.
            gs_fieldcat-edit       = abap_true.
            gs_fieldcat-input      = abap_true.

            MODIFY gt_fieldcat FROM gs_fieldcat TRANSPORTING edit input WHERE fieldname = gs_fieldcat-fieldname. "'NAME'
          ENDIF.
        ENDLOOP.

        APPEND gs_table TO gt_table_popup.

        CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'
          EXPORTING
            i_title               = 'Secilen satirin isim bilgisini degistirebilirsiniz.'
            i_screen_start_column = 5
            i_screen_start_line   = 5
            i_screen_end_column   = 165
            i_screen_end_line     = 8
            i_tabname             = 'GT_TABLE_POPUP'
            it_fieldcat           = gt_fcat_popup
            i_callback_program    = sy-repid
          IMPORTING
            e_exit                = gv_answer
          TABLES
            t_outtab              = gt_table_popup
          EXCEPTIONS
            program_error         = 1
            OTHERS                = 2.
        IF sy-subrc <> 0.
          LEAVE PROGRAM.
        ENDIF.

        IF gv_answer IS INITIAL.

          READ TABLE gt_table_popup INTO  gs_table INDEX 1.
          IF sy-subrc IS INITIAL.
            IF gs_table-name IS NOT INITIAL.
              UPDATE zmg_stravelag SET name      = gs_table-name
                                   WHERE id      = gs_table-id
                                   AND agencynum = gs_table-agencynum.

              SELECT * FROM zmg_stravelag INTO CORRESPONDING FIELDS OF TABLE gt_table.

              CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
                EXPORTING
                  i_callback_program       = sy-repid "ZMG_TEST_246A ->yani System Report ID
                  is_layout                = gs_layout
                  it_fieldcat              = gt_fieldcat
                  i_callback_pf_status_set = 'PF_STATUS_246A'     " PF_STATUS acilmali
                  i_callback_user_command  = 'UC_246A'            " User Command acilmali
                TABLES
                  t_outtab                 = gt_table
                EXCEPTIONS
                  program_error            = 1
                  OTHERS                   = 2.
              IF sy-subrc IS NOT INITIAL.
                LEAVE PROGRAM.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
  ENDCASE.
ENDFORM.
