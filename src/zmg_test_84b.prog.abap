*&---------------------------------------------------------------------*
*& Report ZMG_TEST_84B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_84b.
*Sayfa 167
*Alistirma 5: Ilk 5 alıştırmayı tekrar yazın ve işlemleri ayrı ayrı
*performlar içerisinde gerçekleştirin.

INCLUDE ZMG_alistirma_13_top.

START-OF-SELECTION.

  PERFORM scarr.
  PERFORM spfli.
  PERFORM sflight.
FORM scarr.
  SELECT * FROM scarr INTO TABLE gt_scarr WHERE carrid IN so_carid.
  LOOP AT gt_scarr INTO gs_scarr.
    WRITE: / gs_scarr-carrid, gs_scarr-carrname, gs_scarr-currcode, gs_scarr-url.
    CLEAR gs_scarr.
  ENDLOOP.
  SKIP.
ENDFORM.

FORM spfli.
  SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid IN so_carid.
  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: / gs_spfli-carrid, gs_spfli-connid.
    CLEAR gs_spfli.

  ENDLOOP.
  SKIP.
ENDFORM.

FORM sflight .
  SELECT * FROM sflight INTO TABLE gt_sflight WHERE carrid IN so_carid.
  LOOP AT gt_sflight INTO gs_sflight.
    WRITE: / gs_sflight-carrid, gs_sflight-connid, gs_sflight-currency.
    CLEAR gs_sflight.

  ENDLOOP.
ENDFORM.
