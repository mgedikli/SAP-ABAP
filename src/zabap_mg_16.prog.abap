*&---------------------------------------------------------------------*
*& Report ZABAP_MG_16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_16.
*izin programi _Function Module(HR_RO_WORKDAYS_IN_INTERNAL) Kullanimi


PARAMETERS : p_i_bas TYPE sy-datum,
             p_i_bit TYPE sy-datum,
             p_id    TYPE zcm_de_id.

DATA: go_izin            TYPE REF TO zmgtest_yillik_izin,
      gv_calisan_mevcut,
      gv_izin_alabilir,
      gv_yil(4),
      gv_kullanilan_izin TYPE int1.

START-OF-SELECTION.

  CREATE OBJECT go_izin.

  go_izin->id_kontrol(
    EXPORTING
      iv_id             =  p_id
    IMPORTING
      ev_calisan_mevcut = gv_calisan_mevcut ).

  IF gv_calisan_mevcut IS NOT INITIAL.
    go_izin->izin_kontrol(
      EXPORTING
        iv_id               = p_id
        iv_izin_baslangic   = p_i_bas
        iv_izin_bitis       = p_i_bit
      IMPORTING
        ev_yil              = gv_yil
        ev_kullanilan_izin  = gv_kullanilan_izin
        ev_izin_alabilir    = gv_izin_alabilir ).

    IF gv_izin_alabilir IS NOT INITIAL.

      go_izin->izin_ekle(
        EXPORTING
          iv_id               = p_id
          iv_yil              = gv_yil
          iv_izin_baslangic   = p_i_bas
          iv_izin_bitis       = p_i_bit
          iv_kul_izin         = gv_kullanilan_izin ).

    ENDIF.
  ENDIF.
