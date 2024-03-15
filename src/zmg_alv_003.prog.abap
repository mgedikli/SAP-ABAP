*&---------------------------------------------------------------------*
*& Report ZMG_ALV_003
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alv_003.
*s.180)11.1.2. ALV’de seçim kutucuğu oluşturma
TYPES: BEGIN OF gty_table,
         BOX.
         INCLUDE STRUCTURE zmg_tablo_1.
TYPES: END OF gty_table.

DATA: gt_table    TYPE TABLE OF gty_table,
      gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_layout   TYPE slis_layout_alv.

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
    i_callback_program = sy-repid
    is_layout          = gs_layout
    it_fieldcat        = gt_fieldcat
  TABLES
    t_outtab           = gt_table
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.
