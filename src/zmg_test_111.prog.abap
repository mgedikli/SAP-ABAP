*&---------------------------------------------------------------------*
*& Report ZMG_TEST_111
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_111.

TABLES: zmg_scarr.

DATA: ls_scarr TYPE scarr,
      lt_scarr TYPE TABLE OF scarr.

CLEAR: lt_scarr.

SELECT * FROM zmg_scarr INTO TABLE lt_scarr.

IF lt_scarr IS INITIAL.

  SELECT * FROM scarr INTO TABLE lt_scarr.

  IF sy-subrc IS INITIAL.
    LOOP AT lt_scarr INTO ls_scarr.
      INSERT zmg_scarr FROM ls_scarr.

    ENDLOOP.
    CLEAR: lt_scarr.
    MESSAGE 'Girilen Veri basariyla eklendi.' TYPE 'S'.
  ENDIF.
ELSE.
  MESSAGE 'Tablo dolu oldugu icin veri atilamiyor.' TYPE 'S' DISPLAY LIKE 'E'.

ENDIF.

*LOOP AT lt_scarr INTO ls_scarr.
*
*  INSERT zmg_scarr FROM ls_scarr.
*
*ENDLOOP.
