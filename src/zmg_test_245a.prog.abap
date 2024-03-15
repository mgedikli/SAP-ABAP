*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245a.
*TT tekrar se11_Structure (zmg_s_test1) satir yapisi ile TT
* ve DE satir yapisi ile TT olusturarak icine veri atma
TYPES: BEGIN OF gty_table,
         agncynum TYPE s_agncynum,
       END OF gty_table.

DATA: gt_table     TYPE zmg_tt_test1,
      gs_table     TYPE zmg_s_test1,
      gt_table_2   TYPE zmg_tt_test2,
      gs_table_2   TYPE gty_table,
      gt_stravelag TYPE TABLE OF stravelag,
      gs_stravelag TYPE stravelag.

START-OF-SELECTION.

*  SELECT * FROM stravelag INTO TABLE gt_stravelag.
*
*  LOOP AT gt_stravelag INTO gs_stravelag.
*
*    APPEND gs_stravelag-agencynum TO gt_table_2.
*
*  ENDLOOP.
*
*  LOOP AT gt_table_2 INTO gs_table_2.
*    WRITE: gs_table_2-agncynum.
*
*  ENDLOOP.

SELECT agencynum FROM stravelag INTO TABLE gt_table_2.

  BREAK-POINT.
