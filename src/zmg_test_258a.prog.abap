*&---------------------------------------------------------------------*
*& Report ZMG_TEST_258A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_258A.
*SUBMIT Komutu Rapor icine Rapor cagirma YALIN KULLANIM

*PARAMETERS: p_table TYPE tabname.
*
*START-OF-SELECTION.
*
*  IF p_table = 'SCARR'.
*    SUBMIT zmg_test_259.
*
*  ELSEIF p_table = 'SPFLI'.
*    SUBMIT zmg_test_260.
*
*  ELSEIF p_table = 'SFLIGHT'.
*    SUBMIT zmg_test_261.
*
*  ENDIF.
*  BREAK-POINT.

***********************************************************************

*Submit And Return komutu

PARAMETERS: p_table TYPE tabname.

START-OF-SELECTION.

  IF p_table = 'SCARR'.
    SUBMIT zmg_test_259 AND RETURN.
    MESSAGE 'SCARR tablosunun ALV*si gösterildi' TYPE 'I'.

  ELSEIF p_table = 'SPFLI'.
    SUBMIT zmg_test_260 AND RETURN.
    MESSAGE 'SPFLI tablosunun ALV*si gösterildi' TYPE 'I'.

  ELSEIF p_table = 'SFLIGHT'.
    SUBMIT zmg_test_261 AND RETURN.
    MESSAGE 'SFLIGHT tablosunun ALV*si gösterildi' TYPE 'I'.

  ENDIF.
