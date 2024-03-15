*&---------------------------------------------------------------------*
*& Report ZMG_TEST_154_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_154_2.
*Deep Structure Example V3
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carrid TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK a1.

DATA: gs_structure TYPE zmg_s_deepstr_02.

START-OF-SELECTION.

  SELECT SINGLE * FROM scarr
    INTO CORRESPONDING FIELDS OF gs_structure
    WHERE carrid = p_carrid.

  SELECT * FROM spfli
    INTO TABLE gs_structure-table_spfli
    WHERE carrid = p_carrid.

  BREAK-POINT.
