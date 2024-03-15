*&---------------------------------------------------------------------*
*& Report ZMG_TEST_198
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_198.
*SELECTION SCREEN

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_saat   TYPE i,
              p_dakika TYPE i,
              p_saniye TYPE i.
SELECTION-SCREEN END OF BLOCK a1.


SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  PARAMETERS: p_sonuc TYPE i.
SELECTION-SCREEN END OF BLOCK a2.

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
      IF screen-name = 'P_SONUC'.
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
