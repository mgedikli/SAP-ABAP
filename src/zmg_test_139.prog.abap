*&---------------------------------------------------------------------*
*& Report ZMG_TEST_139
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_139.
*se24  ZSTRAVELAG_UDATE_MG1  => Kullanicidan bir AG nosu ve isim degisikligi talebi al, kontrol et, update yap.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_agnum TYPE s_agncynum OBLIGATORY,
              p_name  TYPE string LOWER CASE.

SELECTION-SCREEN END OF BLOCK a1.

DATA: gv_upd_ok TYPE c LENGTH 1.

START-OF-SELECTION.

*  zstravelag_udate_name_mg1=>update_name(
*    EXPORTING
*      iv_agencynum =  p_agnum
*      iv_name      =  p_name
*    RECEIVING
*      rv_upd_ok    =  gv_upd_ok ). "Bu sekilde method cagirmak ABAP 740 ve sonrasinda gelen bir özellik.
                                   "ABAP 740: Sistem/Status/SAP System data->Product Version->See Details.
  "Önceden:
  call METHOD    zstravelag_udate_name_mg1=>update_name
    EXPORTING
      iv_agencynum =  p_agnum
      iv_name      =  p_name
    RECEIVING
      rv_upd_ok    =  gv_upd_ok.

  IF gv_upd_ok IS NOT INITIAL.
    MESSAGE TEXT-002 TYPE 'S'.
  ENDIF.
