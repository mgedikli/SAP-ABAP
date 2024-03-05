class ZALISTIRMA_CLS_MG_02 definition
  public
  final
  create public .

public section.

  methods UZERI_2
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_RESULT type INT4 .
  methods UZERI_3
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_RESULT type INT4 .
  methods UZERI_4
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_RESULT type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZALISTIRMA_CLS_MG_02 IMPLEMENTATION.


  METHOD uzeri_2.
    ev_result = iv_number * iv_number.
  ENDMETHOD.


  METHOD uzeri_3.
    ev_result = iv_number * iv_number * iv_number.
  ENDMETHOD.


  METHOD uzeri_4.
    ev_result = iv_number * iv_number * iv_number * iv_number.
  ENDMETHOD.
ENDCLASS.
