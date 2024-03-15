*&---------------------------------------------------------------------*
*& Report ZMG_TEST_114
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_114.

TABLES: zmg_spfli.

DATA: ls_spfli TYPE spfli,
      lt_spfli TYPE TABLE OF spfli.

CLEAR: lt_spfli.

SELECT * FROM zmg_spfli INTO TABLE lt_spfli.

IF lt_spfli IS INITIAL.

  SELECT * FROM spfli INTO TABLE lt_spfli.

  IF sy-subrc IS INITIAL.
    LOOP AT lt_spfli INTO ls_spfli.
      INSERT zmg_spfli FROM ls_spfli.

    ENDLOOP.
    CLEAR: lt_spfli.
    MESSAGE 'Girilen Veri basariyla eklendi.' TYPE 'S'.
  ENDIF.
ELSE.
  MESSAGE 'Tablo dolu oldugu icin veri atilamiyor.' TYPE 'S' DISPLAY LIKE 'E'.

ENDIF.
