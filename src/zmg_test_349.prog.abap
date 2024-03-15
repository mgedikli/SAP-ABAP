*&---------------------------------------------------------------------*
*& Report ZMG_TEST_349
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_349.
*S.361) Alıştırma – 12: Yeni bir rapor oluşturun ve ZCM_IL_ILCE tablosundaki bütün verileri okuyun. Elde edilen
*internal tabloda LOOP AT GROUP komutu yardımıyla loop edin ve tüm şehirlerin ilçelerini sırasıyla
*ekrana yazdırın. (İl isimleri için ZCM_ILLER tablosu kullanılabilir.)

SELECT * FROM zcm_il_ilce INTO TABLE @DATA(gt_il_ilce).
SELECT * FROM zcm_iller INTO TABLE @DATA(gt_iller).

LOOP AT gt_il_ilce INTO DATA(gs_il_ilce) GROUP BY ( il_adı = gs_il_ilce-il_adi ) INTO DATA(gt_group).

  LOOP AT GROUP gt_group INTO DATA(gs_group).

    READ TABLE gt_iller INTO DATA(gs_iller) WITH KEY il_kodu = gs_group-il_kodu.

    IF sy-subrc = 0.
      WRITE : / gs_iller-il_adi , gs_group-ilce_adi.
    ENDIF.

  ENDLOOP.

ENDLOOP.
