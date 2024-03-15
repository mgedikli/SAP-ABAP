*&---------------------------------------------------------------------*
*& Report ZMG_TEST_195
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_195.
*Inner Join
TYPES: BEGIN OF gty_table,
         id             TYPE zcm_de_id,
         ad             TYPE zcm_de_info_ad,
         soyad          TYPE zcm_de_info_sad,
         izin_baslangic TYPE datum,
         izin_bitis     TYPE datum,
       END OF gty_table.

DATA: gt_tablo_son TYPE TABLE OF gty_table.

START-OF-SELECTION.

  SELECT zcm_tablo_1~id, zcm_tablo_1~ad, zcm_tablo_1~soyad,
         zcm_tablo_2~izin_baslangic, zcm_tablo_2~izin_bitis
    INTO TABLE @gt_tablo_son
    FROM zcm_tablo_1
    LEFT OUTER JOIN zcm_tablo_2
    ON zcm_tablo_1~id = zcm_tablo_2~id.

  SORT gt_tablo_son BY id.

  BREAK-POINT.

*DATA: gt_tablo_1   TYPE TABLE OF zcm_tablo_1,
*      gt_tablo_2   TYPE TABLE OF zcm_tablo_2,
*      gt_tablo_son TYPE TABLE OF gty_table,
*      gs_tablo_1   TYPE zcm_tablo_1,
*      gs_tablo_2   TYPE zcm_tablo_2,
*      gs_tablo_son TYPE gty_table.
*
*START-OF-SELECTION.
*
*  SELECT * FROM zcm_tablo_1
*    INTO TABLE gt_tablo_1.
*
*  SELECT * FROM zcm_tablo_2
*    INTO TABLE gt_tablo_2.
*
*  LOOP AT gt_tablo_1 INTO gs_tablo_1.
*
*    gs_tablo_son-id    = gs_tablo_1-id.
*    gs_tablo_son-ad    = gs_tablo_1-ad.
*    gs_tablo_son-soyad = gs_tablo_1-soyad.
*
*    LOOP AT gt_tablo_2 INTO gs_tablo_2 WHERE id = gs_tablo_1-id.
*      gs_tablo_son-izin_baslangic = gs_tablo_2-izin_baslangic.
*      gs_tablo_son-izin_bitis     = gs_tablo_2-izin_bitis.
*
*      APPEND gs_tablo_son to gt_tablo_son.
*    ENDLOOP.
*
*    CLEAR: gs_tablo_son.
*  ENDLOOP.
*
*  BREAK-POINT.
