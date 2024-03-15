*&---------------------------------------------------------------------*
*& Report ZMG_TEST_351XA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_351XA.
*S.361)Alıştırma–14: ZCM_DERS_NOTLARI tablosundaki SONUC kolonu için DE oluşturun ve bu hücrede değişiklik yapacak bir rapor hazırlayın.
*Rapor içinde aynı zamanda Change Document da oluşturulsun. Yapılan değişiklikleri CDPOS tablosunda kontrol edin.

TABLES: sscrfields.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_kay_no TYPE int1,
              p_ogr_id TYPE numc5,
              p_ogr_ad TYPE char30,
              p_ogr_sd TYPE char30,
              p_ders   TYPE char30,
              p_sonuc  TYPE ZCMD_DE_SNC_3.
SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  SELECTION-SCREEN PUSHBUTTON 5(15) bt1 USER-COMMAND oku.
SELECTION-SCREEN END OF BLOCK a2.

DATA: gs_ders_notu_yeni TYPE zcm_ders_notlari,
      gt_ders_notu_yeni TYPE TABLE OF zzcm_ders_notlari,
      gt_ders_notu      TYPE TABLE OF zzcm_ders_notlari,
      gt_cdpos          TYPE cdpos_tab,
      gv_islem.

INITIALIZATION.

  CALL FUNCTION 'ICON_CREATE'
    EXPORTING
      name                  = icon_toggle_display
      text                  = 'OKU'
      info                  = 'OKU'
    IMPORTING
      result                = bt1
    EXCEPTIONS
      icon_not_found        = 1
      outputfield_too_short = 2
      OTHERS                = 3.

AT SELECTION-SCREEN.
  CASE sscrfields-ucomm.
    WHEN 'OKU'.
      IF p_kay_no IS NOT INITIAL.
        SELECT SINGLE * FROM zcm_ders_notlari
          INTO @DATA(gs_str)
        WHERE kayit_no = @p_kay_no.

        IF gs_str IS NOT INITIAL.
          p_ogr_id = gs_str-ogr_id.
          p_ogr_ad = gs_str-ogr_ad.
          p_ogr_sd = gs_str-ogr_soyad.
          p_ders   = gs_str-ders.
          p_sonuc  = gs_str-sonuc.
        ELSE.
          CLEAR: p_ogr_id, p_ogr_ad, p_ogr_sd, p_ders, p_sonuc.
          MESSAGE 'Kayıt No bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'Kayıt No Girilmedi.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
  ENDCASE.

START-OF-SELECTION.
      SELECT SINGLE * FROM zcm_ders_notlari
          INTO @DATA(gs_ders_notu)
          WHERE kayit_no = @p_kay_no.

      IF p_kay_no IS NOT INITIAL.

        UPDATE zcm_ders_notlari SET sonuc = p_sonuc
                           WHERE kayit_no = p_kay_no.

        IF sy-subrc IS NOT INITIAL.
          MESSAGE 'Güncelleme Başarısız.' TYPE 'S' DISPLAY LIKE 'E'.
          RETURN.
        ENDIF.

        gs_ders_notu_yeni-ogr_id    = p_ogr_id .
        gs_ders_notu_yeni-ogr_ad    = p_ogr_ad .
        gs_ders_notu_yeni-ogr_soyad = p_ogr_sd .
        gs_ders_notu_yeni-ders      = p_ders   .
        gs_ders_notu_yeni-sonuc     = p_sonuc  .

        APPEND gs_ders_notu_yeni TO gt_ders_notu_yeni.

        gv_islem = 'U'.

      ELSE.
        MESSAGE 'Güncelleme Başarısız. Kayıt no bulunamadı.' TYPE 'S' DISPLAY LIKE 'E'.
        RETURN.
      ENDIF.

  IF gs_ders_notu IS NOT INITIAL.
    gs_ders_notu-mandt = sy-mandt.
    APPEND gs_ders_notu TO gt_ders_notu.
  ENDIF.

  IF gs_ders_notu_yeni IS NOT INITIAL.
    gs_ders_notu_yeni-mandt = sy-mandt.
    APPEND gs_ders_notu_yeni TO gt_ders_notu_yeni.
  ENDIF.

  CALL FUNCTION 'ZMG_CDO_01_WRITE_DOCUMENT'
    EXPORTING
      objectid                      = 'ZMG_CDO_01'
      tcode                         = sy-tcode
      utime                         = sy-uzeit
      udate                         = sy-datum
      username                      = sy-uname
     UPD_ZCM_DERS_NOTLARI          = gv_islem
   TABLES
     XZCM_DERS_NOTLARI             = gt_ders_notu_yeni
     YZCM_DERS_NOTLARI             = gt_ders_notu .

  CALL FUNCTION 'CHANGEDOCUMENT_READ_ALL'
   EXPORTING
     I_OBJECTCLASS                     = 'ZMG_CDO_01'
     I_TABLENAME                       = 'ZCM_DERS_NOTLARI'
   IMPORTING
     ET_CDPOS                          = gt_cdpos
   EXCEPTIONS
     MISSING_INPUT_OBJECTCLASS         = 1
     MISSING_INPUT_HEADER              = 2
     NO_POSITION_FOUND                 = 3
     WRONG_ACCESS_TO_ARCHIVE           = 4
     TIME_ZONE_CONVERSION_ERROR        = 5
     READ_TOO_MANY_ENTRIES             = 6
     OTHERS                            = 7 .
