class ZALISTIRMA_CLS_MG_04 definition
  public
  final
  create public .

public section.

  data GT_SCARR type ZCM_TT_SCARR .
  data GT_SPFLI type ZCM_TT_SPFLI .
  data GT_SFLIGHT type ZCM_TT_SFLIGHT .
  data GT_CARR_ID_SELOPT type ZMG_TT_CARRID .

  methods GET_TABLES
    importing
      !IV_SELECT_SCARR type CHAR1
      !IV_SELECT_SPFLI type CHAR1
      !IV_SELECT_SFLIGHT type CHAR1 .
protected section.

  methods GET_SCARR .
  methods GET_SPFLI .
  methods GET_SFLIGHT .
private section.
ENDCLASS.



CLASS ZALISTIRMA_CLS_MG_04 IMPLEMENTATION.


  METHOD get_scarr.

    SELECT * FROM scarr
      INTO TABLE gt_scarr
      WHERE carrid IN gt_carr_id_selopt.

  ENDMETHOD.


  METHOD get_sflight.

    SELECT * FROM sflight
      INTO TABLE gt_sflight
      WHERE carrid IN gt_carr_id_selopt.

  ENDMETHOD.


  METHOD get_spfli.

    SELECT * FROM spfli
      INTO TABLE gt_spfli
      WHERE carrid IN gt_carr_id_selopt.

  ENDMETHOD.


  METHOD get_tables.

    IF iv_select_scarr = abap_true.
      get_scarr( ).
    ENDIF.

    IF  iv_select_spfli = abap_true.
      get_spfli( ).
    ENDIF.

    IF iv_select_sflight = abap_true.
      get_sflight( ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.