*&---------------------------------------------------------------------*
*& Report ZMG_TEST_246
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_246.
*Abap List Viewer ALV alma (1. Yöntem)ve Secim Kutucugu olusturma S:168

TYPES: BEGIN OF gty_table,
         box         TYPE c LENGTH 1.
         INCLUDE STRUCTURE zcm_table_001.
TYPES: END OF gty_table.

DATA:    gt_table    TYPE TABLE OF gty_table,
         gt_fieldcat TYPE slis_t_fieldcat_alv,
         gs_fieldcat TYPE slis_fieldcat_alv,
         gs_layout   TYPE slis_layout_alv.

SELECT * FROM zcm_table_001 INTO CORRESPONDING FIELDS OF TABLE gt_table.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name       = 'ZCM_TABLE_001'
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

gs_layout-zebra = abap_true.
gs_layout-colwidth_optimize = abap_true.
gs_layout-box_fieldname = 'BOX'.

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
IF sy-subrc IS NOT INITIAL.
  LEAVE PROGRAM.
ENDIF.


BREAK-POINT.
