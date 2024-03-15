*&---------------------------------------------------------------------*
*& Report ZMG_ALV_001_ZCM_121
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alv_001_zcm_121.
*Sayfa 194/ Alıştırma – 1: Yeni bir database tablosu oluşturun. (Örneğin ZCM_STRAVELAG) Satir yapısı STRAVELAG
*database tablosu ile tamamen ayni olsun. Daha sonra yeni bir rapor oluşturun ve STRAVELAG
*tablosundaki bütün bilgileri okuyup oluşturduğunuz yeni database tablosu içine kaydedin.
********SE11 de taployu olusturarak baslayalim.
*SAP nin standart Tablilarindan biri olan STRAVELAG taplosu kopyalanarak üzerinde degisiklikler yapalim.

DATA: gt_stravelag TYPE TABLE OF stravelag,
      gs_stravelag TYPE stravelag.

START-OF-SELECTION.

  SELECT * FROM stravelag INTO TABLE gt_stravelag.

  LOOP AT gt_stravelag INTO gs_stravelag.
    INSERT zmg_stravelag FROM gs_stravelag.
  ENDLOOP.
