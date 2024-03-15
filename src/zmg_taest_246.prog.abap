*&---------------------------------------------------------------------*
*& Report ZMG_TAEST_246
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_taest_246.

PARAMETERS: p_sayi_1 TYPE int4,
            p_sayi_2 TYPE int4,
            p_sembl  TYPE c LENGTH 1.

DATA: go_hesap_makinesi TYPE REF TO zcmtest_hm,
      gv_okey           TYPE c LENGTH 1,
      gv_sonuc          TYPE i.

START-OF-SELECTION.

  CREATE OBJECT go_hesap_makinesi.

  go_hesap_makinesi->islem_kontrol(
    EXPORTING
      iv_sembol = p_sembl
      iv_sayi_2 = p_sayi_2
    IMPORTING
      ev_ok     = gv_okey ).

  IF gv_okey IS NOT INITIAL.

    IF p_sembl  = '+'.
      go_hesap_makinesi->toplama(
        EXPORTING
          iv_sayi_toplama_1 = p_sayi_1
          iv_sayi_toplama_2 =  p_sayi_2
        IMPORTING
          ev_sonuc_toplama  = gv_sonuc ).

    ELSEIF p_sembl = '-'.
      go_hesap_makinesi->cikarma(
        EXPORTING
          iv_sayi_cikarma_1 =  p_sayi_1
          iv_sayi_cikarma_2 =  p_sayi_2
        IMPORTING
          ev_sonuc_cikarma  = gv_sonuc ).
    ELSEIF p_sembl = '*'.
      go_hesap_makinesi->carpma(
        EXPORTING
          iv_sayi_carpma_1 =  p_sayi_1
          iv_sayi_carpma_2 =  p_sayi_2
        IMPORTING
          ev_sonuc_carpma  =  gv_sonuc  ).

    ELSEIF p_sembl = '/'.
      go_hesap_makinesi->bolme(
        EXPORTING
          iv_sayi_bolme_1 = p_sayi_1
          iv_sayi_bolme_2 = p_sayi_2
        IMPORTING
          ev_sonuc_bolme  = gv_sonuc ).
    ENDIF.
  ELSE.
    MESSAGE 'Hatali veri girdisi' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.
  WRITE: gv_sonuc.
