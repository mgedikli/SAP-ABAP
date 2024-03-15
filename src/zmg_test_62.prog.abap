*&---------------------------------------------------------------------*
*& Report ZMG_TEST_62
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_62.
*Sayfa 133- Alıştırma – 5: Yeni bir rapor oluşturun ve SCARR isimli database tablosundan bütün satırları çekerek
*ekrana yazdırın.

DATA: gs_scarr TYPE scarr,
      gt_scarr TYPE TABLE OF scarr.

SELECT * FROM scarr INTO TABLE gt_scarr.

LOOP AT gt_scarr INTO gs_scarr.

  WRITE: / gs_scarr-carrid,
           gs_scarr-carrname,
           gs_scarr-currcode,
           gs_scarr-url.
  SKIP.
  CLEAR: gs_scarr.

ENDLOOP.
