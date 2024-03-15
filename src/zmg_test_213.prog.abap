*&---------------------------------------------------------------------*
*& Report ZMG_TEST_213
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_213.
*LEFT OUTER JOIN
TYPES: BEGIN OF gty_table,
         id             TYPE zcm_de_id,
         ad             TYPE zcm_de_info_ad,
         soyad          TYPE zcm_de_info_sad,
         izin_baslangic TYPE datum,
         izin_bitis     TYPE datum,
       END   OF gty_table.

DATA: gt_table_son TYPE TABLE OF gty_table.

START-OF-SELECTION.

SELECT zcm_tablo_1~id, zcm_tablo_1~ad, zcm_tablo_1~soyad,
       zcm_tablo_2~izin_baslangic, zcm_tablo_2~izin_bitis
  INTO TABLE @gt_table_son
  FROM zcm_tablo_1
  LEFT OUTER JOIN zcm_tablo_2
  on zcm_tablo_1~id = zcm_tablo_2~id.

  BREAK-POINT.