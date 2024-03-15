*&---------------------------------------------------------------------*
*& Report ZMG_TEST_269
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_269.
*FS / Append Initial Line komutu
* SFLIGHT tablosunun sadece 3 kolonu ve bos koltuk sayisina ihtiyacimiz var.

TYPES: BEGIN OF gty_table,
         carrid     TYPE s_carr_id,
         connid     TYPE s_conn_id,
         fldate     TYPE s_date,
         bos_koltuk TYPE int4,
       END OF gty_table.

DATA: gt_table   TYPE TABLE OF gty_table,
      gt_sflight TYPE TABLE OF sflight,
      gs_sflight TYPE sflight.

FIELD-SYMBOLS: <gs_str> TYPE gty_table.

START-OF-SELECTION.

  SELECT * FROM sflight INTO TABLE gt_sflight.

  LOOP AT gt_sflight INTO gs_sflight.
    APPEND INITIAL LINE TO gt_table ASSIGNING <gs_str>. "Bos bir satir atildi/ bos satir <gs_str> ye ASSIGNING edildigi icin
                                                        "<gs_str> de yapilan tüm degisiklikler TABLO'ya eklenmis olacak.
    <gs_str>-carrid     = gs_sflight-carrid.
    <gs_str>-connid     = gs_sflight-connid.
    <gs_str>-fldate     = gs_sflight-fldate.
    <gs_str>-bos_koltuk = gs_sflight-seatsmax - gs_sflight-seatsocc.

  ENDLOOP.
  BREAK-POINT.
