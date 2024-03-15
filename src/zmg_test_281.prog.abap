*&---------------------------------------------------------------------*
*& Report ZMG_TEST_281
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_281.
****Alistirma 2 s. 329
****1.ASAMA
***SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
***  PARAMETERS: p_1 RADIOBUTTON GROUP abc,
***              p_2 RADIOBUTTON GROUP abc.
***SELECTION-SCREEN END OF BLOCK a1.
***
***SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
***  PARAMETERS: p_num1 TYPE s_agncynum,
***              p_name TYPE s_agncynam.
***SELECTION-SCREEN END OF BLOCK a2.
***
***SELECTION-SCREEN BEGIN OF BLOCK a3 WITH FRAME TITLE TEXT-003 NO INTERVALS.
***  PARAMETERS: p_num2   TYPE s_agncynum,
***              p_street TYPE s_street.
***SELECTION-SCREEN END OF BLOCK a3.
***
***AT SELECTION-SCREEN OUTPUT.
***
***  LOOP AT SCREEN.   "screen-name leri bulmak icin; BREAK POINT koyup debug ta -> p_1 sec ve incele ve screen-name leri not deterine kopyala
***
***    IF p_1 = abap_true.
***
***      IF screen-name = ''.
***
***      ENDIF.
***
***    ENDIF.
***
***  ENDLOOP.

****************************************************************************
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_1 RADIOBUTTON GROUP abc DEFAULT 'X' USER-COMMAND c1 MODIF ID m1,  "MODIF ID m1 komutu, DEFAULT 'X' ->saglikli calismasi icin,
              p_2 RADIOBUTTON GROUP abc MODIF ID m1.                              "p_1/p_2 basildiginda:tetikleme olmasi icin USER-COMMAND c1 kullandik
SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  PARAMETERS: p_num1 TYPE s_agncynum,
              p_name TYPE s_agncynam.
SELECTION-SCREEN END OF BLOCK a2.

SELECTION-SCREEN BEGIN OF BLOCK a3 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  PARAMETERS: p_num2   TYPE s_agncynum,
              p_street TYPE s_street.
SELECTION-SCREEN END OF BLOCK a3.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.

    IF p_1 = abap_true.
      IF screen-name = '%_P_NUM2_%_APP_%-TEXT'   OR screen-name = 'P_NUM2' OR      "diger Ekrani görünmez yap bunun icin
         screen-name = '%_P_STREET_%_APP_%-TEXT' OR screen-name = 'P_STREET'.     "debug'tan alinan screen-name leri kullan
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ELSE.
      IF screen-name = '%_P_NUM1_%_APP_%-TEXT'  OR screen-name = 'P_NUM1' OR
         screen-name = '%_P_NAME_%_APP_%-TEXT'  OR screen-name = 'P_NAME'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDIF.

  ENDLOOP.

START-OF-SELECTION.
  IF p_1 = abap_true. " p_1 = is not INITIAL.

    SUBMIT zmg_test_282 WITH p_num  = p_num1
                        WITH p_name = p_name AND RETURN.

  ELSE. "Alternative---> ELSEIF p_2 = abap_true.

    SUBMIT zmg_test_283 WITH p_num    = p_num2
                        WITH p_street = p_street AND RETURN.

  ENDIF.
