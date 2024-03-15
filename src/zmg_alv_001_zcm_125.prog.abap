*&---------------------------------------------------------------------*
*& Report ZMG_ALV_001_ZCM_125
*&---------------------------------------------------------------------*

REPORT zmg_alv_001_zcm_125.


DATA: gt_stravelag TYPE TABLE OF zmg_stravelag,
      gs_stravelag TYPE zmg_stravelag,
      gt_fieldcat  TYPE lvc_t_fcat,
      gs_fieldcat  TYPE lvc_s_fcat,
      gs_layout    TYPE lvc_s_layo,
      gv_url       TYPE s_url,
      gv_answer.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: so_agnum FOR gs_stravelag-agencynum.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  PERFORM select_data.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.

FORM select_data.

  SELECT * FROM zmg_stravelag INTO TABLE gt_stravelag WHERE agencynum IN so_agnum.

ENDFORM.

FORM fcat .
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_STRAVELAG'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  LOOP AT gt_fieldcat INTO gs_fieldcat.
    CASE gs_fieldcat-fieldname.
      WHEN  'URL'.
        gs_fieldcat-hotspot = abap_true.

        MODIFY gt_fieldcat from gs_fieldcat TRANSPORTING hotspot WHERE fieldname = gs_fieldcat-fieldname.
*    	WHEN .
*    	WHEN OTHERS.
    ENDCASE.

ENDLOOP.

  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.
ENDFORM.

FORM layout.

  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.

ENDFORM.

FORM show_alv .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
      i_callback_program = sy-repid
      is_layout_lvc      = gs_layout
      it_fieldcat_lvc    = gt_fieldcat
     i_callback_pf_status_set = 'TEST_125'
     i_callback_user_command  = 'UC_125'
    TABLES
      t_outtab           = gt_stravelag
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.

  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM test_125 USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'PF_STATUS_125'.
ENDFORM.

FORM uc_125 USING lv_ucomm    TYPE sy-ucomm
                  ls_selfield TYPE slis_selfield.

ENDFORM.
