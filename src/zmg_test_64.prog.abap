*&---------------------------------------------------------------------*
*& Report ZMG_TEST_62
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_64.
*Sayfa 133
*Alıştırma – 7: Yeni bir rapor oluşturun ve SFLIGHT isimli database tablosundan bütün satırları çekerek
*ekrana yazdırın.

DATA: gs_sflight TYPE sflight,
      gt_sflight TYPE TABLE OF sflight.

SELECT * FROM sflight INTO TABLE gt_sflight.

LOOP AT gt_sflight INTO gs_sflight.

  WRITE: / gs_sflight-carrid    ,
           gs_sflight-connid    ,
           gs_sflight-fldate    ,
           gs_sflight-price     ,
           gs_sflight-currency  ,
           gs_sflight-planetype ,
           gs_sflight-seatsmax  ,
           gs_sflight-seatsocc  ,
           gs_sflight-paymentsum,
           gs_sflight-seatsmax  ,
           gs_sflight-seatsocc_b,
           gs_sflight-seatsmax_b,
           gs_sflight-seatsocc_f.

  SKIP.
  CLEAR: gs_sflight.
ENDLOOP.
