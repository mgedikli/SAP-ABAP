
*&---------------------------------------------------------------------*
*& Report ZMG_TEST_76
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_76.
*Encapsulation Kavramı-1 (Perform Komutu)

SELECTION-SCREEN BEGIN OF BLOCK must WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num_01 TYPE i,
              p_num_02 TYPE i.
SELECTION-SCREEN END OF BLOCK must.

DATA: gv_result TYPE i.

START-OF-SELECTION.

  PERFORM sum.
  ULINE.
  WRITE: gv_result.
  ULINE.
*&---------------------------------------------------------------------*
*& Form sum
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM sum .
 data: lv_result TYPE i.
*  gv_result = p_num_01 + p_num_02.
  lv_result = p_num_01 + p_num_02.
  WRITE: lv_result.
ENDFORM.
