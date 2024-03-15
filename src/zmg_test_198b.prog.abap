*&---------------------------------------------------------------------*
*& Report ZMG_TEST_198
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_198b.
*SELECTION SCREEN
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  SELECTION-SCREEN BEGIN OF LINE.

    SELECTION-SCREEN COMMENT 1(5) TEXT-003 FOR FIELD p_saat.
    SELECTION-SCREEN POSITION 6.
    PARAMETERS: p_saat   TYPE n LENGTH 5.

    SELECTION-SCREEN COMMENT 13(7) TEXT-004 FOR FIELD p_dakika.
    SELECTION-SCREEN POSITION 20.
    PARAMETERS: p_dakika TYPE n LENGTH 5.

    SELECTION-SCREEN COMMENT 27(7) TEXT-005 FOR FIELD p_saniye.
    SELECTION-SCREEN POSITION 34.
    PARAMETERS: p_saniye TYPE n LENGTH 5.

    SELECTION-SCREEN COMMENT 40(7) TEXT-006 FOR FIELD p_sonuc.
    SELECTION-SCREEN POSITION 48.
    PARAMETERS: p_sonuc TYPE n LENGTH 5.

  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK a1.

*SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
*  PARAMETERS: p_sonuc TYPE i.
*SELECTION-SCREEN END OF BLOCK a2.

AT SELECTION-SCREEN OUTPUT.

  CLEAR: p_sonuc.

  IF p_saat IS NOT INITIAL.
    p_sonuc = p_saat * 3600.
  ENDIF.

  IF p_dakika IS NOT INITIAL.
    p_sonuc = p_sonuc + ( p_dakika * 60 ).
  ENDIF.

  IF p_saniye IS NOT INITIAL.
    p_sonuc = p_sonuc + p_saniye.
  ENDIF.

  LOOP AT SCREEN.
    IF p_sonuc IS INITIAL.
*      IF screen-name = 'P_SONUC' OR screen-name = '%_P_SONUC_%_APP_%-TEXT'.
        IF screen-name = 'P_SONUC' OR screen-name = '%F006011_1000'.
          screen-active = '0'.
          MODIFY SCREEN.
        ENDIF.
      ELSE.

        IF screen-name = 'P_SONUC'.
          screen-input = '0'.
          MODIFY SCREEN.
        ENDIF.
      ENDIF.

    ENDLOOP.
