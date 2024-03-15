class ZMGTEST_001_STATIC definition
  public
  final
  create public .

public section.

  class-methods METHOD_1
    importing
      !IV_NUMBER type INT4
      !IV_RDBUTTON type CHAR1
    exporting
      !EV_NUMBER type INT4 .
protected section.

  class-methods METHOD_2
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_NUMBER type INT4 .
  class-methods METHOD_3
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_NUMBER type INT4 .
private section.
ENDCLASS.



CLASS ZMGTEST_001_STATIC IMPLEMENTATION.


  method METHOD_1.
        IF iv_rdbutton = 2.
      method_2(
        EXPORTING
          iv_number = iv_number
        IMPORTING
          ev_number = ev_number ).
    ELSEIF iv_rdbutton = 3.
      method_3(
        EXPORTING
          iv_number = iv_number
        IMPORTING
          ev_number = ev_number ).
    ENDIF.
  endmethod.


  METHOD method_2.
    ev_number = iv_number * iv_number.
  ENDMETHOD.


  METHOD method_3.
    ev_number = iv_number * iv_number * iv_number.
  ENDMETHOD.
ENDCLASS.
