*&---------------------------------------------------------------------*
*& Report ZMG_TEST_243
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_243.

DATA: gt_table TYPE zmg_tt_sfl.

START-OF-SELECTION.
  SELECT * FROM sflight
    INTO CORRESPONDING FIELDS OF TABLE gt_table.

    BREAK-POINT.
