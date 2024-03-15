*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245.
*TT-> se11_Structure (zmg_s_test1) satir yapisi ile TT olustur ve icini doldur

DATA: gt_table     TYPE zmg_tt_test1,
      gs_table     TYPE zmg_s_test1.

START-OF-SELECTION.

gs_table-kolon_1 = 12345.
gs_table-kolon_2 = 'Text Kolon 2'.
gs_table-kolon_3 = 'Text Kolon 3'.
gs_table-kolon_4 = 'Text Kolon 4'.

APPEND gs_table to gt_table.

  BREAK-POINT.
