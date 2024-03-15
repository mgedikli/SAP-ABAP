*&---------------------------------------------------------------------*
*& Report ZMG_TEST_69
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_69.

*Alıştırma – 17:
*Yeni bir rapor oluşturun. Rapor içerisinde 1 adet parametre tanımlayın. Kullanıcıdan bir
*Currency alin. Kendi oluşturduğunuz ve SCARR ile ayni satir yapısına sahip olan database tablosunda
*kullanıcının girdiği Currency ile ayni Currency bilgisine sahip olan satırları kalıcı olarak silin. (Delete)

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-013 NO INTERVALS.
  PARAMETERS: p_curr TYPE s_currcode.
SELECTION-SCREEN END OF BLOCK a1.

DATA: gs_scarr TYPE zmk_table_scarr,
      gt_scarr TYPE TABLE OF zmk_table_scarr.

START-OF-SELECTION.

IF p_curr IS INITIAL.
  MESSAGE TEXT-014 TYPE 'S' DISPLAY LIKE 'E'.
EXIT.
ENDIF.

SELECT * FROM zmk_table_scarr INTO TABLE gt_scarr.

LOOP AT gt_scarr INTO gs_scarr.
  IF p_curr = gs_scarr-zmk_currcode.
    DELETE FROM zmk_table_scarr WHERE zmk_currcode EQ p_curr.
    MESSAGE TEXT-016 TYPE 'I'.
  ELSE.
    MESSAGE TEXT-015 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDLOOP.
