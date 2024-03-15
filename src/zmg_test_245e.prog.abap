*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245D
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245e.
*TT ZMG_STRUCTURE_010 Personel Bilgisi

TYPES: BEGIN OF gty_table,
         scarrid TYPE s_carr_id,
       END OF gty_table.

DATA: gt_table   TYPE zmg_tt_010,
      gs_table   TYPE zmg_structure_010,
      gt_table_2 TYPE zmg_tt_carrid,
      gs_table_2 TYPE gty_table,
      gt_scarr   TYPE TABLE OF scarr,
      gs_scarr   TYPE scarr.

START-OF-SELECTION.
*Satirlarin tamamini cekmeden yapalim; sadece scar_id kolonunu cekelim.
*  SELECT * FROM scarr INTO TABLE gt_scarr.
*
*  LOOP AT gt_scarr INTO gs_scarr.
*
*    APPEND gs_scarr TO gt_table_2.
*
*  ENDLOOP.
*  LOOP AT gt_table_2 INTO gs_table_2.
*    WRITE: gs_table_2-scarrid.
*  ENDLOOP.

  SELECT carrid FROM scarr INTO TABLE gt_table_2.

  BREAK-POINT.
