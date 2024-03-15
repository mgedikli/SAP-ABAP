*&---------------------------------------------------------------------*
*& Report ZMG_TEST_248C
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_248c.
*UPDATE - CLASS - STRAVALAG- S.212 SE11-> ZMG_STRAVELAG (ID DE:ZMG_DE_YENI_ID)ile
PARAMETERS: p_id  TYPE zmg_de_yeni_id,
            p_url TYPE string LOWER CASE.
DATA: go_update TYPE REF TO zmgtest_stravelag_url_update,
      gv_ok     TYPE c LENGTH 1,
      gv_url    TYPE string,
      gv_sonuc  TYPE c LENGTH 1.

START-OF-SELECTION.

  CREATE OBJECT go_update.

*"Birinci YOL
*go_update->id_kontrol(
*            EXPORTING
*              iv_id = p_id
*            RECEIVING
*              rv_ok = gv_ok ).
  "Ikinci YOL
  gv_ok = go_update->id_kontrol( iv_id = p_id ). "cünkü; se24'te id_kontrol
  "RV_OK diye Returning parametresi var.

  IF gv_ok IS NOT INITIAL.
    gv_url = go_update->url_kontrol( iv_url = p_url ).

    gv_sonuc = go_update->update_url(
             EXPORTING
                iv_id = p_id
                iv_url = gv_url ).
    IF gv_sonuc IS NOT INITIAL.
      MESSAGE 'Update islemi basarili.' TYPE 'S'.
    ENDIF.
  ELSE.
    MESSAGE 'Update islemi basarili.' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
