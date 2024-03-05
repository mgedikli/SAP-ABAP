class ZALISTIRMA_CLS_MG_01 definition
  public
  final
  create public .

public section.

  methods METHOD_01
    importing
      !IV_NUMBER_01 type INT4
      !IV_NUMBER_02 type INT4
    exporting
      !EV_RESULT type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZALISTIRMA_CLS_MG_01 IMPLEMENTATION.


  METHOD method_01.

    ev_result = iv_number_01.

    DO ( iv_number_02 - 1 ) TIMES.

      ev_result = ev_result * iv_number_01.

    ENDDO.

******************************************************
*    DATA: lv_number TYPE i.
*    lv_number = iv_number_01.
*
*    DO ( iv_number_02 - 1 ) TIMES.
*
*      lv_number = lv_number * iv_number_01.
*
*    ENDDO.
*
*    ev_result = lv_number.

  ENDMETHOD.
ENDCLASS.
