*&---------------------------------------------------------------------*
*& Report ZMG_TEST_151
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_151.
*Alıştırma – 8:
*Besinci, altıncı ve yedinci alıştırmaları lokal Class tanımlayarak yapın.
*5. Alistirma:
*Yeni bir rapor oluşturun ve kullanıcıdan select-options yardımıyla 1 adet CARRID alin.
*Ayrıca 3 adet checkbox olsun. Checkboxların isimleri sırasıyla “Scarr”, “Spfli” ve “Sflight” olsun. Yeni
*bir Class oluşturun. Class içerisinde 4 adet metot olsun. Birinci metot (Instance-Public), kullanıcının
*verdiği CARRID bilgisini ve seçilen checkbox bilgisini import etsin. Hangi checkboxlar seçildiyse o
*tablodan veri çeksin ve kullanıcıya export etsin. Her tablodan veri çekmek için ayrı (Instance-Protected)
*metotlar oluşturun ve ilk metot içerisinde kullanın.

CLASS lcl_selection DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA : gt_scarr           TYPE zcm_tt_scarr,
                 gt_spfli           TYPE zcm_tt_spfli,
                 gt_sflight         TYPE zcm_tt_sflight,
                 gt_carr_id_selopt  TYPE zmg_tt_carrid.

    METHODS: get_tables IMPORTING iv_select_scarr   TYPE char1
                                  iv_select_spfli   TYPE char1
                                  iv_select_sflight TYPE char1.
  PROTECTED SECTION.
    METHODS:  get_scarr,
              get_spfli,
              get_sflight.
ENDCLASS.

CLASS lcl_selection IMPLEMENTATION.
  METHOD get_scarr.

    SELECT * FROM scarr
      INTO TABLE gt_scarr
      WHERE carrid IN gt_carr_id_selopt.

  ENDMETHOD.

  METHOD get_spfli.

    SELECT * FROM spfli
      INTO TABLE gt_spfli
      WHERE carrid IN gt_carr_id_selopt.

  ENDMETHOD.

  METHOD get_sflight.

    SELECT * FROM sflight
      INTO TABLE gt_sflight
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

DATA: gv_carrid    TYPE s_carr_id,
      go_selection TYPE REF TO lcl_selection.

SELECT-OPTIONS: so_cid FOR gv_carrid.
PARAMETERS: p_scarr AS CHECKBOX,
            p_spfli AS CHECKBOX,
            p_sflgt AS CHECKBOX.

START-OF-SELECTION.
  CREATE OBJECT go_selection.

  go_selection->gt_carr_id_selopt = so_cid[].

  go_selection->get_tables(
    EXPORTING
      iv_select_scarr   = p_scarr
      iv_select_spfli   = p_spfli
      iv_select_sflight = p_sflgt ).
