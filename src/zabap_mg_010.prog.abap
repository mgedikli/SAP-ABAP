*&---------------------------------------------------------------------*
*& Report ZABAP_MG_010
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_010.
*ALV de BUTON olusturma
TYPES: BEGIN OF gty_table,
         kutu TYPE c LENGTH 1.
         INCLUDE STRUCTURE zmg_stravelag.
TYPES: END OF gty_table.

DATA : gt_table    TYPE TABLE OF gty_table,
       gt_fieldcat TYPE	slis_t_fieldcat_alv,
       gs_fieldcat TYPE slis_fieldcat_alv,
       gs_layout   TYPE	slis_layout_alv.

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

IF sy-subrc <> 0.
  EXIT.
ENDIF.

gs_layout-zebra             = abap_true.
gs_layout-colwidth_optimize = abap_true.
gs_layout-box_fieldname     = 'KUTU'.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program       = sy-repid
    is_layout                = gs_layout
    it_fieldcat              = gt_fieldcat
    i_callback_pf_status_set = 'PF_STATUS_010'
    i_callback_user_command  = 'UC_010'
  TABLES
    t_outtab                 = gt_table
  EXCEPTIONS
    program_error            = 1
    OTHERS                   = 2.

IF sy-subrc <> 0.
  EXIT.
ENDIF.

FORM PF_STATUS_010 USING lt_extab TYPE slis_t_extab.
  SET PF-STATUS 'PF_STATUS_010'.
ENDFORM.

FORM uc_010 USING lv_ucomm    TYPE sy-ucomm
                  ls_selfield TYPE slis_selfield.

  CASE lv_ucomm.
    WHEN 'GERI'.
      LEAVE PROGRAM.
*    WHEN 'SIRALA'.
*      SORT gt_table BY name.
**    WHEN OTHERS.
  ENDCASE.

ENDFORM.
