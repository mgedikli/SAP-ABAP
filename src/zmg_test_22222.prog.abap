*&---------------------------------------------------------------------*
*& Report ZMG_TEST_22222
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_22222.

DATA: gt_table   TYPE TABLE OF zmg_table_003,
      gt_fielcat TYPE slis_t_fieldcat_alv,
      gs_layout  TYPE slis_layout_alv.


SELECT * FROM zmg_table_003  INTO TABLE gt_table.

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_TABLE_003'
      i_bypassing_buffer     = 'X'
    CHANGING
      ct_fieldcat            = gt_fielcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.
  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.

gs_layout-zebra             = 'X'.
gs_layout-colwidth_optimize = 'X'.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = 'ZMG_TEST_22222'
      is_layout          = gs_layout
      it_fieldcat        = gt_fielcat
    TABLES
      t_outtab           = gt_table
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc IS NOT INITIAL.
    EXIT.
  ENDIF.
