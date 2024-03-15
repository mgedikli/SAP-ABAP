*&---------------------------------------------------------------------*
*& Report ZMG_TEST_115A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_115A.
*ALV 1. Yönt. zcm_test_115
DATA : gt_table    TYPE TABLE OF zmg_table_003,
       gt_fieldcat TYPE slis_t_fieldcat_alv,
       gs_fieldcat LIKE LINE OF gt_fieldcat,
       gs_layout   TYPE slis_layout_alv.

CONSTANTS : lv_str_name TYPE dd02l-tabname VALUE 'ZMG_TABLE_003'.

SELECT * FROM zmg_table_003 INTO TABLE gt_table.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name       =  lv_str_name "'ZMG_TABLE_003'
    i_bypassing_buffer     = abap_true   "'X'
  CHANGING
    ct_fieldcat            = gt_fieldcat
  EXCEPTIONS
    inconsistent_interface = 1
    program_error          = 2
    OTHERS                 = 3.

*LOOP AT gt_fieldcat INTO gs_fieldcat.
*
**  CASE gs_fieldcat-fieldname.
**    WHEN 'ID'.
**      gs_fieldcat-col_pos = '3'.
**    WHEN 'NAME'.
**      gs_fieldcat-col_pos = '2'.
**      gs_fieldcat-key = 'X'.
**  ENDCASE.
*
**  MODIFY gt_fieldcat FROM gs_fieldcat.
*
*ENDLOOP.


IF sy-subrc IS NOT INITIAL.
  EXIT.
ENDIF.

gs_layout-zebra             = abap_true.
gs_layout-colwidth_optimize = abap_true.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid  "ya da se38 raporun adi=> 'ZMG_TEST_115A'
    is_layout          = gs_layout
    it_fieldcat        = gt_fieldcat
  TABLES
    t_outtab           = gt_table
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.
