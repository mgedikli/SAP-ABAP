class ZMGPOWL_SFLIGHT definition
  public
  final
  create public .

public section.

  interfaces IF_POWL_FEEDER .
protected section.
private section.
ENDCLASS.



CLASS ZMGPOWL_SFLIGHT IMPLEMENTATION.


  method IF_POWL_FEEDER~GET_ACTIONS.

  endmethod.


  method IF_POWL_FEEDER~GET_ACTION_CONF.

  endmethod.


  method IF_POWL_FEEDER~GET_DETAIL_COMP.
  endmethod.


  METHOD if_powl_feeder~get_field_catalog.

    DATA: lt_fcat      TYPE lvc_t_fcat,
          ls_fcat_powl TYPE powl_fieldcat_sty.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZMG_S_SFLIGHT_POWL' "eski hali  'SFLIGHT' iken,(s.383-384)Satır ekleme:Renklendirme asamasinda
        i_bypassing_buffer     = abap_true            "COLOR kolonunu "RENK REFERANSI olarak belirleyip “TEKNIK KOLON” haline getirelim'
      CHANGING
        ct_fieldcat            = lt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    LOOP AT lt_fcat INTO DATA(ls_fcat).
      ls_fcat_powl-colid           = ls_fcat-fieldname.
      ls_fcat_powl-header_by_ddic  = abap_true.
      ls_fcat_powl-col_visible     = abap_true.
      ls_fcat_powl-enabled         = abap_true.
      ls_fcat_powl-colpos          = abap_true.
      ls_fcat_powl-allow_filter    = abap_true.
      ls_fcat_powl-allow_sort      = abap_true.

****************S.384- Satır renklendirme icin ekleme
      "Satir renk kolonunu bütün hücreler icin RENK REFERANSI Haline getir.
      ls_fcat_powl-color_ref = 'SATIR_RENK'.

      "Satir renk kolonunu ALV görünümünden cikar.
      IF ls_fcat-fieldname = 'SATIR_RENK'.
        ls_fcat_powl-technical_col = abap_true.
      ENDIF.
****************

      INSERT ls_fcat_powl INTO TABLE c_fieldcat.
    ENDLOOP.

    e_fieldcat_changed = abap_true.
  ENDMETHOD.


  METHOD if_powl_feeder~get_objects.

    DATA: lt_carrid_range TYPE RANGE OF s_carr_id,
          lt_connid_range TYPE RANGE OF s_conn_id,
          lt_results      TYPE zmg_tt_sflight1,
          lv_sonuc        TYPE p DECIMALS 2.

    "Secim ekranindan gelen degerleri kullanarak CARRID ve CONNID icin RANGE olusturalim.
    LOOP AT i_selcrit_values INTO DATA(ls_selcrit_value).
      CASE ls_selcrit_value-selname.
        WHEN 'CARRID'.
          APPEND INITIAL LINE TO lt_carrid_range ASSIGNING FIELD-SYMBOL(<fs_carrid_range>).
          <fs_carrid_range>-sign    = ls_selcrit_value-sign.
          <fs_carrid_range>-option  = ls_selcrit_value-option.
          <fs_carrid_range>-low     = ls_selcrit_value-low.
          <fs_carrid_range>-high    = ls_selcrit_value-high.
        WHEN 'CONNID'.
          APPEND INITIAL LINE TO lt_connid_range ASSIGNING FIELD-SYMBOL(<fs_connid_range>).
          <fs_connid_range>-sign    = ls_selcrit_value-sign.
          <fs_connid_range>-option  = ls_selcrit_value-option.
          <fs_connid_range>-low     = ls_selcrit_value-low.
          <fs_connid_range>-high    = ls_selcrit_value-high.
      ENDCASE.
    ENDLOOP.

    "RANGE Tablolarini kullanarak veri cekelim.
*    SELECT * FROM sflight INTO TABLE e_results WHERE carrid IN lt_carrid_range     "s.383-POWL List uygulaması için Field Catalog hazırlama
*                                               AND   connid IN lt_connid_range.
    SELECT * FROM sflight  "S.385 Satır renklendirme icin ek.
      INTO CORRESPONDING FIELDS OF TABLE lt_results
      WHERE carrid  IN lt_carrid_range
      AND  connid   IN lt_connid_range.

    LOOP AT lt_results ASSIGNING FIELD-SYMBOL(<ls_result>).
      TRY.
          lv_sonuc = <ls_result>-seatsocc / <ls_result>-seatsmax.
        CATCH cx_sy_zerodivide.
          CONTINUE.
      ENDTRY.

      IF lv_sonuc >= ( 4 / 5 ).
        <ls_result>-satir_renk = '11'.
      ENDIF.
    ENDLOOP.

    e_results = lt_results.
  ENDMETHOD.


  METHOD if_powl_feeder~get_object_definition.

    e_object_def ?= cl_abap_classdescr=>describe_by_name( p_name = 'ZMG_TT_SFLIGHT' ).
    "POWL List tarafindan gösterilecek listenin satir yapisi belirlendi.

  ENDMETHOD.


  METHOD if_powl_feeder~get_sel_criteria.

    APPEND INITIAL LINE TO c_selcrit_defs ASSIGNING FIELD-SYMBOL(<fs_srlcrit>).
    <fs_srlcrit>-selname      = 'CARRID'.      "Ekrande görünecek isim.
    <fs_srlcrit>-kind         = 'S'.           "Select-Options seklinde görünecek.
    <fs_srlcrit>-param_type   = 'I'.           "Inclusive.
    <fs_srlcrit>-selopt_type  = 'A'.           "Coklu secime imkan taniyacak.
    <fs_srlcrit>-datatype     = 'S_CARR_ID'.   "Bu hücreye girilebilecek verinin tipi.

    APPEND INITIAL LINE TO c_selcrit_defs ASSIGNING <fs_srlcrit>.
    <fs_srlcrit>-selname      = 'CONNID'.      "Ekrande görünecek isim.
    <fs_srlcrit>-kind         = 'S'.           "Select-Options seklinde görünecek.
    <fs_srlcrit>-param_type   = 'I'.           "Inclusive.
    <fs_srlcrit>-selopt_type  = 'A'.           "Coklu secime imkan taniyacak.
    <fs_srlcrit>-datatype     = 'S_CONN_ID'.   "Bu hücreye girilebilecek verinin tipi.

    e_selcrit_defs_changed = abap_true.        "Secim kriterleri düzenlendi.

  ENDMETHOD.


  method IF_POWL_FEEDER~HANDLE_ACTION.
  endmethod.
ENDCLASS.
