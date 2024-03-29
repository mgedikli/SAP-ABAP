class ZMGTEST_YILLIK_IZIN_CLASS_A definition
  public
  final
  create public .

public section.

  methods ID_KONTROL
    importing
      !IV_ID type ZCM_DE_ID
    exporting
      !EV_CALISAN_MEVCUT type CHAR1 .
  methods IZIN_KONTROL
    importing
      !IV_ID type ZCM_DE_ID
      !IV_IZIN_BASLANGIC type SY-DATUM
      !IV_IZIN_BITIS type SY-DATUM
    exporting
      !EV_YIL_2 type CHAR4
      !EV_TALEP_IZIN_2 type INT1
      !EV_IZIN_ALABILIR_2 type CHAR1
      !EV_YIL_1 type CHAR4
      !EV_TALEP_IZIN_1 type INT1
      !EV_IZIN_ALABILIR_1 type CHAR1
    exceptions
      SIFIR_IS_GUNU
      YETERSIZ_IZIN_HAKKI
      MEVCUT_KAYIT .
  methods IZIN_EKLE
    importing
      !IV_ID type ZCM_DE_ID
      !IV_YIL type CHAR4
      !IV_IZIN_BASLANGIC type SY-DATUM
      !IV_IZIN_BITIS type SY-DATUM
      !IV_KUL_IZIN type INT1 .
protected section.
private section.
ENDCLASS.



CLASS ZMGTEST_YILLIK_IZIN_CLASS_A IMPLEMENTATION.


  METHOD ID_KONTROL.
    DATA: ls_tablo_1 TYPE zcm_tablo_1.

    SELECT SINGLE * FROM zcm_tablo_1
      INTO ls_tablo_1
      WHERE id = iv_id.

    IF ls_tablo_1 IS NOT INITIAL.
      ev_calisan_mevcut = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD IZIN_EKLE.
    DATA: ls_tablo_2 TYPE zcm_tablo_2.

    ls_tablo_2-id = iv_id.
    ls_tablo_2-yil = iv_yil.
    ls_tablo_2-izin_baslangic = iv_izin_baslangic.
    ls_tablo_2-izin_bitis = iv_izin_bitis.
    ls_tablo_2-kul_izin = iv_kul_izin.

    INSERT zcm_tablo_2 FROM ls_tablo_2.

    IF sy-subrc IS INITIAL.
      MESSAGE 'Kayit basariyla eklendi' TYPE 'I'.
    ENDIF.
  ENDMETHOD.


  METHOD IZIN_KONTROL.
    DATA: lv_is_gunu       TYPE i,
          ls_tablo_1       TYPE zcm_tablo_1,
          lt_tablo_2       TYPE TABLE OF zcm_tablo_2,
          ls_tablo_2       TYPE zcm_tablo_2,
          lv_kul_izin      TYPE i,
          lv_izin_bas      TYPE sy-datum,
          lv_izin_bitis    TYPE sy-datum,
          lv_yetersiz_izin TYPE c LENGTH 1.

    CALL FUNCTION 'HR_RO_WORKDAYS_IN_INTERVAL'
      EXPORTING
        begda   = iv_izin_baslangic
        endda   = iv_izin_bitis
        mofid   = '08'
      CHANGING
        wrkdays = lv_is_gunu.

    IF lv_is_gunu = 0.
      RAISE sifir_is_gunu. "Exeptions cagirildi. !! yani Hata durumu
    ENDIF.

    IF iv_izin_baslangic(4) = iv_izin_bitis(4).           "YYYYMMDD ikisi de ayni yil icerisinde

      SELECT SINGLE * FROM zcm_tablo_1                    "Tek satir cekiliyor (Kullanicinin izin hakkini bulma
        INTO ls_tablo_1                                   "
        WHERE id = iv_id.

      SELECT * FROM zcm_tablo_2                           "Sene ici kullanilan izinler
        INTO TABLE lt_tablo_2                             "Birden fazla satir cekme ihtimali nedeniyle 'INTO TABLE'
        WHERE id = iv_id AND                              "Kullanicinin o sene aldigi izinler toplamini bulmak icin
              yil = iv_izin_baslangic(4).                 "Sadece mevcut yila ait izin planlamasini isitiyoruz.tüm verileri degil.

      LOOP AT lt_tablo_2 INTO ls_tablo_2.                 "Sene ici kullandigi izinleri topla
        lv_kul_izin = lv_kul_izin + ls_tablo_2-kul_izin.

*        IF iv_izin_baslangic BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis OR
*           iv_izin_bitis     BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis.
*          RAISE mevcut_kayit.
*        ENDIF.
      ENDLOOP.

      IF lv_is_gunu > ls_tablo_1-izin_hakki - lv_kul_izin. "lv_is_gunu = Talep edilen izin miktari/lv_kul_izin = yil ici kullanilan izin
        RAISE yetersiz_izin_hakki.
      ENDIF.

      ev_izin_alabilir_1 = abap_true.
      ev_yil_1 = iv_izin_baslangic(4).
      ev_talep_izin_1 = lv_is_gunu.

    ELSE.

      lv_izin_bitis = iv_izin_baslangic(4) && '1231'.       "Yil ayni ama ay ve günü 1231

      CALL FUNCTION 'HR_RO_WORKDAYS_IN_INTERVAL'
        EXPORTING
          begda   = iv_izin_baslangic
          endda   = lv_izin_bitis
          mofid   = '08'
        CHANGING
          wrkdays = lv_is_gunu.

      IF lv_is_gunu IS NOT INITIAL.

        SELECT SINGLE * FROM zcm_tablo_1                    "Yillik toplam izin hakkini verir
          INTO ls_tablo_1
          WHERE id = iv_id.

        SELECT * FROM zcm_tablo_2                            "Yil ici kullanilan izinleri verir
          INTO TABLE lt_tablo_2
          WHERE id = iv_id AND
                yil = iv_izin_baslangic(4).

        LOOP AT lt_tablo_2 INTO ls_tablo_2.
          lv_kul_izin = lv_kul_izin + ls_tablo_2-kul_izin.

*          IF iv_izin_baslangic BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis OR
*             lv_izin_bitis BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis.
*          ENDIF.
        ENDLOOP.
*
        IF lv_is_gunu <= ls_tablo_1-izin_hakki - lv_kul_izin.   "Kontrol
          ev_izin_alabilir_1 = abap_true.
          ev_yil_1 = iv_izin_baslangic(4).
          ev_talep_izin_1 = lv_is_gunu.
        ELSE.
          lv_yetersiz_izin = abap_true.
        ENDIF.
      ENDIF.

      lv_izin_bas = iv_izin_bitis(4) && '0101'.

      CALL FUNCTION 'HR_RO_WORKDAYS_IN_INTERVAL'
        EXPORTING
          begda   = lv_izin_bas
          endda   = iv_izin_bitis
          mofid   = '08'
        CHANGING
          wrkdays = lv_is_gunu.
*
      IF lv_is_gunu IS NOT INITIAL.
        SELECT SINGLE * FROM zcm_tablo_1
          INTO ls_tablo_1
          WHERE id = iv_id.

        SELECT * FROM zcm_tablo_2
          INTO TABLE lt_tablo_2
          WHERE id = iv_id AND
                yil = iv_izin_bitis(4).

        CLEAR: lv_kul_izin.

        LOOP AT lt_tablo_2 INTO ls_tablo_2.
          lv_kul_izin = lv_kul_izin + ls_tablo_2-kul_izin.
*
*          IF lv_izin_bas BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis OR
*             iv_izin_bitis BETWEEN ls_tablo_2-izin_baslangic AND ls_tablo_2-izin_bitis.
*            RAISE mevcut_kayit.
*          ENDIF.
        ENDLOOP.

        IF lv_is_gunu <= ls_tablo_1-izin_hakki - lv_kul_izin.
          ev_yil_2 = iv_izin_bitis(4).
          ev_talep_izin_2 = lv_is_gunu.
          ev_izin_alabilir_2 = abap_true.
        ELSE.
          IF lv_yetersiz_izin IS NOT INITIAL.
            RAISE yetersiz_izin_hakki.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
