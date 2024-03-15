*&---------------------------------------------------------------------*
*& Report ZMG_TEST_85
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_85.
*Sayfa 167
*Alıştırma – 1: Yeni bir rapor oluşturun ve kullanıcıdan Select-Options yardımıyla 1 adet “CARRID” alın.
*Alınan veriyi kullanarak SCARR, SPFLI ve SFLIGHT tablolarından tüm satırları okuyun ve ekrana yazdırın.

TABLES: scarr, spfli, sflight.
DATA: gs_scarr   TYPE scarr,
      gs_spfli   TYPE spfli,
      gs_sflight TYPE sflight,
      gt_scarr   TYPE TABLE OF scarr,
      gt_spfli   TYPE TABLE OF spfli,
      gt_sflight TYPE TABLE OF sflight.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_carrid FOR scarr-carrid.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT * FROM scarr   INTO TABLE gt_scarr   WHERE carrid  IN s_carrid.
  SELECT * FROM spfli   INTO TABLE gt_spfli   WHERE carrid  IN s_carrid.
  SELECT * FROM sflight INTO TABLE gt_sflight WHERE carrid  IN s_carrid.

  LOOP AT gt_scarr INTO gs_scarr.
    WRITE: /  gs_scarr-carrid   ,
              gs_scarr-carrname ,
              gs_scarr-currcode ,
              gs_scarr-url.
    SKIP.
    CLEAR: gs_scarr.
  ENDLOOP.
  ULINE 2.

  LOOP AT gt_spfli INTO gs_spfli.

    WRITE: /  gs_spfli-carrid   ,
              gs_spfli-connid   ,
              gs_spfli-countryfr.
    SKIP.
    CLEAR: gs_scarr.
  ENDLOOP.
  ULINE 2.

  LOOP AT gt_sflight INTO gs_sflight.

    WRITE: /  gs_sflight-carrid  ,
              gs_sflight-connid  ,
              gs_sflight-currency.
    SKIP.
    CLEAR: gs_scarr.
  ENDLOOP.
