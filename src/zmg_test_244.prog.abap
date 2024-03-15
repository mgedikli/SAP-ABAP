*&---------------------------------------------------------------------*
*& Report ZMG_TEST_244
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_244.
*DE referans vererek TT olusturma ve icerisini doldurma.

DATA: gt_table TYPE zmg_tt_fno,
      gs_table TYPE zmg_de_ftr_no.

*SELECT * FROM zmg_fatura_h
*  INTO CORRESPONDING FIELDS OF TABLE gt_table.

BREAK-POINT.
