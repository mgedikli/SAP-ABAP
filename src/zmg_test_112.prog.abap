*&---------------------------------------------------------------------*
*& Report ZMG_TEST_112
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_112.

TABLES: zmg_stravelag.

DATA: ls_stravelag TYPE stravelag,
      lt_stravelag TYPE TABLE OF stravelag.

CLEAR: lt_stravelag.

SELECT * FROM zmg_stravelag INTO TABLE lt_stravelag.

IF lt_stravelag IS INITIAL.

  SELECT * FROM stravelag INTO TABLE lt_stravelag.

  IF sy-subrc IS INITIAL.
    LOOP AT lt_stravelag INTO ls_stravelag.
      INSERT zmg_stravelag FROM ls_stravelag.

    ENDLOOP.
    CLEAR: lt_stravelag.
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
