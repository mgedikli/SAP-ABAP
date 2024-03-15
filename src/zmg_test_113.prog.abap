*&---------------------------------------------------------------------*
*& Report ZMG_TEST_113
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_113.

TABLES: zmg_sflight.

DATA: ls_sflight TYPE sflight,
      lt_sflight TYPE TABLE OF sflight.

CLEAR: lt_sflight.

SELECT * FROM zmg_sflight INTO TABLE lt_sflight.

IF lt_sflight IS INITIAL.

  SELECT * FROM sflight INTO TABLE lt_sflight.

  IF sy-subrc IS INITIAL.
    LOOP AT lt_sflight INTO ls_sflight.
      INSERT zmg_sflight FROM ls_sflight.

    ENDLOOP.
    CLEAR: lt_sflight.
    MESSAGE 'Girilen Veri basariyla eklendi.' TYPE 'S'.
  ENDIF.
ELSE.
  MESSAGE 'Tablo dolu oldugu icin veri atilamiyor.' TYPE 'S' DISPLAY LIKE 'E'.

ENDIF.
