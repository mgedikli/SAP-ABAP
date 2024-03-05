class ZCALCULATOR_MG definition
  public
  final
  create public .

public section.

  methods TOPLA
    importing
      !IV_NUM_TOPLA_01 type INT4
      !IV_NUM_TOPLA_02 type INT4
    exporting
      !EV_SONUC_TOPLAM type INT4 .
  methods CIKAR
    importing
      !IV_NUM_CIKAR_01 type INT4
      !IV_NUM_CIKAR_02 type INT4
    exporting
      !EV_SONUC_CIKARMA type INT4 .
  methods CARP
    importing
      !IV_NUM_CARP_01 type INT4
      !IV_NUM_CARP_02 type INT4
    exporting
      !EV_SONUC_CARPMA type INT4 .
  methods BOL
    importing
      !IV_NUM_BOL_01 type INT4
      !IV_NUM_BOL_02 type INT4
    exporting
      !EV_SONUC_BOLME type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZCALCULATOR_MG IMPLEMENTATION.


  METHOD bol.

    ev_sonuc_bolme = iv_num_bol_01 / iv_num_bol_02.

  ENDMETHOD.


  METHOD carp.

    ev_sonuc_carpma = iv_num_carp_01 * iv_num_carp_02.

  ENDMETHOD.


  method CIKAR.

    ev_sonuc_cikarma = iv_num_cikar_01 - iv_num_cikar_02.

  endmethod.


  METHOD topla.

    ev_sonuc_toplam = iv_num_topla_01 + iv_num_topla_02.

  ENDMETHOD.
ENDCLASS.
