*&---------------------------------------------------------------------*
*& Report ZMG_ALV_002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alv_002.
*s.174)1-Yön) 11.1. REUSE_ALV_FIELDCATALOG_MERGE ve REUSE_ALV_GRID_DISPLAY Kombinasyonu

DATA: gt_table    TYPE TABLE OF zmg_tablo_1,
      gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_layout TYPE SLIS_LAYOUT_ALV.

SELECT * FROM zmg_tablo_1 INTO TABLE gt_table.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name       = 'ZMG_TABLO_1'
    i_bypassing_buffer     = abap_true
  CHANGING
    ct_fieldcat            = gt_fieldcat
  exceptions
    inconsistent_interface = 1
    program_error          = 2
    OTHERS                 = 3.

IF sy-subrc <> 0.
  LEAVE PROGRAM.
ENDIF.

gs_layout-zebra             = abap_true.
gs_layout-colwidth_optimize = abap_true.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   I_CALLBACK_PROGRAM                = sy-repid
   IS_LAYOUT                         = gs_layout
   IT_FIELDCAT                       = gt_fieldcat
  TABLES
    t_outtab                          = gt_table
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2.
