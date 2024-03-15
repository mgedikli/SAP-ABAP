*&---------------------------------------------------------------------*
*& Report ZMG_TEST_248B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_248b.

PARAMETERS: p_num_1 TYPE i,
            p_num_2 TYPE i,
            p_sembl TYPE c LENGTH 1.

DATA: go_hesap_makinesi TYPE REF TO zmgtest_hm,
      gv_okey           TYPE c LENGTH 1,
      gv_result         TYPE i.

START-OF-SELECTION.

  CREATE OBJECT go_hesap_makinesi.

  go_hesap_makinesi->islem_kontrol(
    EXPORTING
      iv_sembol   =  p_sembl
      iv_number_2 =  p_num_2
    IMPORTING
      ev_ok       = gv_okey ).

  IF gv_okey IS NOT INITIAL.

    IF p_sembl  = '+'.
      go_hesap_makinesi->toplama(
        EXPORTING
          iv_number_toplama_1 =  p_num_1
          iv_number_toplama_2 =  p_num_2
        IMPORTING
          ev_result_toplama   =  gv_result ).

    ELSEIF p_sembl = '-'.
      go_hesap_makinesi->cikarma(
        EXPORTING
          iv_number_cikarma_1 =  p_num_1
          iv_number_cikarma_2 =  p_num_2
        IMPORTING
          ev_result_cikarma   =  gv_result ).

    ELSEIF p_sembl = '*'.
      go_hesap_makinesi->carpma(
        EXPORTING
          iv_number_carpma_1 =  p_num_1
          iv_number_carpma_2 =  p_num_2
        IMPORTING
          ev_result_carpma   = gv_result ).

    ELSEIF p_sembl = '/'.
      go_hesap_makinesi->bolme(
        EXPORTING
          iv_number_bolme_1 =  p_num_1
          iv_number_bolme_2 =  p_num_2
        IMPORTING
          ev_result_bolme   =   gv_result ).

    ENDIF.
  ELSE.
    MESSAGE 'Hatali veri girdisi' TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.
  WRITE: gv_result.
