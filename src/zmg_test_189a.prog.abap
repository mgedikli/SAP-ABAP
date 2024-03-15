*&---------------------------------------------------------------------*
*& Report ZMG_TEST_189A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_189a.
*Sayfa_271_ Abap Offset kullanımı ve Comparison Operatörleri
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_ad    TYPE zmg_de_info_ad,
              p_sad   TYPE zmg_de_info_soyad,
              p_tarih TYPE datum.
SELECTION-SCREEN END OF BLOCK a1.

DATA: gt_date_info TYPE TABLE OF zmg_date_info2,
      gs_date_info TYPE zmg_date_info2,
      gv_yil       TYPE c LENGTH 4,
      gv_ay        TYPE c LENGTH 2,
      gv_gun       TYPE c LENGTH 2,
      gv_no        TYPE c LENGTH 1.

START-OF-SELECTION.

*  SELECT * FROM zmg_date_info2 INTO TABLE gt_date_info.
*  gs_date_info-id         = lines( gt_date_info ) + 1.

  CALL FUNCTION 'NUMBER_GET_NEXT'
    EXPORTING
      nr_range_nr             = '01'
      object                  = 'ZMG_NR_002'
    IMPORTING
      number                  = gs_date_info-id
    EXCEPTIONS
      interval_not_found      = 1
      number_range_not_intern = 2
      object_not_found        = 3
      quantity_is_0           = 4
      quantity_is_not_1       = 5
      interval_overflow       = 6
      buffer_overflow         = 7
      OTHERS                  = 8.

  IF sy-subrc IS NOT INITIAL.
    MESSAGE 'Sayi araliginda bir hata olustu' TYPE 'S' DISPLAY LIKE 'E'.
    LEAVE PROGRAM.
  ENDIF.

  gs_date_info-ad         = p_ad.
  gs_date_info-soyad      = p_sad.
  gs_date_info-d_tarihi   = p_tarih.

  gv_yil  = p_tarih+0(4). " Alternatif --> gv_yil = p_tarih(4)
  gv_ay   = p_tarih+4(2).
  gv_gun  = p_tarih+6(2).

  gs_date_info-d_yil = gv_yil.

  CASE gv_ay.
    WHEN '01'.
      gs_date_info-d_ay = 'OCAK'.
    WHEN '02'.
      gs_date_info-d_ay = 'SUBAT'.
    WHEN '03'.
      gs_date_info-d_ay = 'MART'.
    WHEN '04'.
      gs_date_info-d_ay = 'NISAN'.
    WHEN '05'.
      gs_date_info-d_ay = 'MAYIS'.
    WHEN '06'.
      gs_date_info-d_ay = 'HAZIRAN'.
    WHEN '07'.
      gs_date_info-d_ay = 'TEMMUZ'.
    WHEN '08'.
      gs_date_info-d_ay = 'AGUSTOS'.
    WHEN '09'.
      gs_date_info-d_ay = 'EYLÜL'.
    WHEN '10'.
      gs_date_info-d_ay = 'EKIM'.
    WHEN '11'.
      gs_date_info-d_ay = 'KASIM'.
    WHEN '12'.
      gs_date_info-d_ay = 'ARALIK'.
  ENDCASE.

  CALL FUNCTION 'DATE_COMPUTE_DAY'
    EXPORTING
      date = p_tarih
    IMPORTING
      day  = gv_no.

  CASE gv_ay.
    WHEN '01'.
      gs_date_info-d_gun = 'PAZARTESI'.
    WHEN '02'.
      gs_date_info-d_gun = 'SALI'.
    WHEN '03'.
      gs_date_info-d_gun = 'CARSAMBA'.
    WHEN '04'.
      gs_date_info-d_gun = 'PERSEMBE'.
    WHEN '05'.
      gs_date_info-d_gun = 'CUMA'.
    WHEN '06'.
      gs_date_info-d_gun = 'CUMARTESI'.
    WHEN '07'.
      gs_date_info-d_gun = 'PAZAR'.
  ENDCASE.

  INSERT zmg_date_info2 FROM gs_date_info.

  MESSAGE 'Islem Basarili' TYPE 'I' DISPLAY LIKE 'S'.
