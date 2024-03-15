*&---------------------------------------------------------------------*
*& Report ZMG_TEST_152
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_152.
*Alıştırma – 8:
*Besinci, altıncı ve yedinci alıştırmaları lokal Class tanımlayarak yapın.
*
*Alıştırma – 6: Yeni bir rapor oluşturun ve kullanıcıdan 1 adet geçmiş tarih alın. Yeni bir Class oluşturun.
*Class içerisinde 3 adet metot olsun. (İlki Statİc-Public, diğerleri Static-Protected). İkinci metot verilen
*tarihteki günü bulsun. (Metot içerisinde GET_WEEKDAY_NAME veya DATE_COMPUTE_DAY
*fonksiyonlarından bir tanesini kullanabilirsiniz.) Üçüncü metot ise verilen tarih ile bugün arasında kaç
*gün olduğunu bulsun. Birinci metot, ikinci ve üçüncü metotlardan gelen veriyi kullanarak kullanıcıya
*anlamı bir text export etsin. (Örnek: 01.01.2024 tarihi girildi. Ekranda “Girilen 01.01.2024 Pazartesi ile
*bugün arasında 5 gün bulunmaktadır.”)


CLASS lcl_date_info DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS: info IMPORTING iv_date TYPE datum
                        EXPORTING ev_info TYPE string.

  PROTECTED SECTION.
    CLASS-METHODS: get_day_name IMPORTING iv_date     TYPE datum
                                EXPORTING ev_day_name TYPE langt,
      get_no_days  IMPORTING iv_date    TYPE datum
                   EXPORTING ev_no_days TYPE int4.
ENDCLASS.

CLASS lcl_date_info IMPLEMENTATION.
  METHOD get_day_name.

    CALL FUNCTION 'GET_WEEKDAY_NAME'
      EXPORTING
        date        = iv_date
        language    = sy-langu
      IMPORTING
        longtext    = ev_day_name
      EXCEPTIONS
        calendar_id = 1
        date_error  = 2
        not_found   = 3
        wrong_input = 4
        OTHERS      = 5.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ENDMETHOD.

  METHOD get_no_days.

    ev_no_days = sy-datum - iv_date.

  ENDMETHOD.

  METHOD info.

    DATA: lv_day_name     TYPE langt,
          lv_no_days      TYPE int4,
          lv_no_days_text TYPE n LENGTH 6.

    get_day_name(
      EXPORTING
        iv_date     = iv_date
      IMPORTING
        ev_day_name = lv_day_name ).

    get_no_days(
      EXPORTING
        iv_date     = iv_date
      IMPORTING
        ev_no_days  = lv_no_days ).
    lv_no_days_text = lv_no_days.

    SHIFT lv_no_days_text LEFT DELETING LEADING '0'.
    CONCATENATE TEXT-001 iv_date lv_day_name TEXT-002 lv_no_days_text TEXT-003 INTO ev_info
    SEPARATED BY space.

  ENDMETHOD.
ENDCLASS.


PARAMETERS: p_tarih TYPE datum.
DATA: gv_info TYPE string.

START-OF-SELECTION.

  CHECK p_tarih < sy-datum.

  lcl_date_info=>info(
    EXPORTING
      iv_date = p_tarih
    IMPORTING
      ev_info = gv_info ).

  WRITE: gv_info.
  ULINE.
