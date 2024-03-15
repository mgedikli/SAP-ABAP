class ZMGTEST_HM definition
  public
  final
  create public .

public section.

  methods TOPLAMA
    importing
      !IV_NUMBER_TOPLAMA_1 type INT4
      !IV_NUMBER_TOPLAMA_2 type INT4
    exporting
      !EV_RESULT_TOPLAMA type INT4 .
  methods CIKARMA
    importing
      !IV_NUMBER_CIKARMA_1 type INT4
      !IV_NUMBER_CIKARMA_2 type INT4
    exporting
      !EV_RESULT_CIKARMA type INT4 .
  methods CARPMA
    importing
      !IV_NUMBER_CARPMA_1 type INT4
      !IV_NUMBER_CARPMA_2 type INT4
    exporting
      !EV_RESULT_CARPMA type INT4 .
  methods BOLME
    importing
      !IV_NUMBER_BOLME_1 type INT4
      !IV_NUMBER_BOLME_2 type INT4
    exporting
      !EV_RESULT_BOLME type INT4 .
  methods ISLEM_KONTROL
    importing
      !IV_SEMBOL type CHAR1
      !IV_NUMBER_2 type INT4
    exporting
      !EV_OK type CHAR1 .
protected section.
private section.
ENDCLASS.



CLASS ZMGTEST_HM IMPLEMENTATION.


  METHOD bolme.
    ev_result_bolme = iv_number_bolme_1 / iv_number_bolme_2.
  ENDMETHOD.


  METHOD carpma.
    ev_result_carpma =  iv_number_carpma_1 * iv_number_carpma_2.
  ENDMETHOD.


  METHOD cikarma.
    ev_result_cikarma = iv_number_cikarma_1 - iv_number_cikarma_2.
  ENDMETHOD.


  METHOD islem_kontrol.
    IF iv_sembol = '+' OR iv_sembol = '-' OR
       iv_sembol = '/' OR iv_sembol = '*' .

      ev_ok = abap_true.

    ENDIF.

    IF iv_sembol = '/' AND iv_number_2 = 0.

      CLEAR ev_ok.


    ENDIF.
  ENDMETHOD.


  METHOD toplama.
    ev_result_toplama = iv_number_toplama_1 + iv_number_toplama_2.
  ENDMETHOD.
ENDCLASS.
