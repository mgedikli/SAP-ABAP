class ZMGTEST_YILLIK_IZIN definition
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
      !EV_YIL type CHAR4
      !EV_KULLANILAN_IZIN type INT1
      !EV_IZIN_ALABILIR type CHAR1 .
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



CLASS ZMGTEST_YILLIK_IZIN IMPLEMENTATION.


  METHOD id_kontrol.

    DATA:  ls_tablo_1 TYPE zcm_tablo_1.

    SELECT SINGLE * FROM zcm_tablo_1
      INTO ls_tablo_1
      WHERE id = iv_id.

    IF ls_tablo_1 IS NOT INITIAL.
      ev_calisan_mevcut = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD izin_ekle.

    DATA: ls_tablo_2 TYPE zcm_tablo_2.
    ls_tablo_2-id              = iv_id.
    ls_tablo_2-yil             = iv_yil.
    ls_tablo_2-izin_baslangic  = iv_izin_baslangic.
    ls_tablo_2-izin_bitis      = iv_izin_bitis.
    ls_tablo_2-kul_izin     = iv_kul_izin.

    INSERT zcm_tablo_2 FROM ls_tablo_2.
  ENDMETHOD.


  METHOD izin_kontrol.

    DATA: lv_is_gunu        TYPE i,
          ls_tablo_1        TYPE zcm_tablo_1,
          lt_tablo_2        TYPE TABLE OF zcm_tablo_2,
          ls_tablo_2        TYPE zcm_tablo_2,
          lv_yil            TYPE c LENGTH 4,
          lv_kul_izin       TYPE i,
          lv_izin_baslangic TYPE sy-datum,
          lv_izin_bitis     TYPE sy-datum.

    IF iv_izin_baslangic(4) = iv_izin_bitis(4).

*      lv_izin_baslangic = iv_izin_baslangic - 1.
*      lv_izin_bitis     = iv_izin_bitis + 1.

      CALL FUNCTION 'HR_RO_WORKDAYS_IN_INTERVAL'
        EXPORTING
          begda   = iv_izin_baslangic
          endda   = iv_izin_bitis
          mofid   = '08'
        CHANGING
          wrkdays = lv_is_gunu.

      SELECT SINGLE * FROM zcm_tablo_1
        INTO ls_tablo_1
        WHERE id = iv_id.

      lv_yil = iv_izin_baslangic(4).

      SELECT * FROM zcm_tablo_2
        INTO TABLE lt_tablo_2
        WHERE id = iv_id
        AND yil  = lv_yil.

      LOOP AT lt_tablo_2 INTO ls_tablo_2.
        lv_kul_izin = lv_kul_izin + ls_tablo_2-kul_izin.
      ENDLOOP.

      IF lv_is_gunu <= ls_tablo_1-izin_hakki - lv_kul_izin.
        ev_izin_alabilir = abap_true.
        ev_yil = lv_yil.
        ev_kullanilan_izin = lv_is_gunu.

        RETURN.
      ENDIF.
    ENDIF.









  ENDMETHOD.
ENDCLASS.
