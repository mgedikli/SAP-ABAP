*&---------------------------------------------------------------------*
*& Report ZMG_TEST_200
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_200.
*Test_199'daki örnekte, sağdaki tablo_2'nin tamamına ihtiyaç duyacağımız için FOR ALL ENTRIES kullanmadık.
*Çünkü mantık olarak sağdaki izin tablosunda yer alan bir çalışan mutlaka genel çalışan bilgilerinin
*tutulduğu soldaki tabloda da yer alacaktır.) Şimdi ayni işlemi JOIN komutu kullanarak yapalım.

TYPES: BEGIN OF gty_table,
         id             TYPE zcm_de_id,
         ad             TYPE zcm_de_info_ad,
         soyad          TYPE zcm_de_info_sad,
         izin_baslangic TYPE datum,
         izin_bitis     TYPE datum,
       END OF gty_table.

DATA: gt_tablo_son  TYPE TABLE OF gty_table.

START-OF-SELECTION.

  SELECT zcm_tablo_1~id, zcm_tablo_1~ad, zcm_tablo_1~soyad,
         zcm_tablo_2~izin_baslangic, zcm_tablo_2~izin_bitis
    INTO TABLE @gt_tablo_son
    FROM zcm_tablo_1
    INNER JOIN zcm_tablo_2
    ON zcm_tablo_1~id = zcm_tablo_2~id.

  SORT gt_tablo_son BY id.

  BREAK-POINT.
