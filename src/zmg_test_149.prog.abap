*&---------------------------------------------------------------------*
*& Report ZMG_TEST_149
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_149.
*Alıştırma – 6: Yeni bir rapor oluşturun ve kullanıcıdan 1 adet geçmiş tarih alın. Yeni bir Class oluşturun.
*Class içerisinde 3 adet metot olsun. (İlki Statuc-Public, diğerleri Static-Protected). İkinci metot verilen
*tarihteki günü bulsun. (Metot içerisinde GET_WEEKDAY_NAME veya DATE_COMPUTE_DAY
*fonksiyonlarından bir tanesini kullanabilirsiniz.) Üçüncü metot ise verilen tarih ile bugün arasında kaç
*224 gün olduğunu bulsun. Birinci metot, ikinci ve üçüncü metotlardan gelen veriyi kullanarak kullanıcıya
*anlamı bir text export etsin. (Örnek: 01.01.2024 tarihi girildi. Ekranda “Girilen 01.01.2024 Pazartesi ile
*bugün arasında 5 gün bulunmaktadır.”)

PARAMETERS: p_date TYPE datum.

DATA: gv_info TYPE string.

START-OF-SELECTION.

  CHECK p_date < sy-datum.

  zalistirma_cls_mg_06=>info(
    EXPORTING
      iv_date = p_date
    IMPORTING
      ev_info = gv_info ).

  BREAK-POINT.
