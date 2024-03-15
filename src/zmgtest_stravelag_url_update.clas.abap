class ZMGTEST_STRAVELAG_URL_UPDATE definition
  public
  final
  create public .

public section.

  methods ID_KONTROL
    importing
      !IV_ID type ZMG_DE_YENI_ID
    returning
      value(RV_OK) type CHAR1 .
  methods UPDATE_URL
    importing
      !IV_ID type ZMG_DE_YENI_ID
      !IV_URL type STRING
    returning
      value(RV_SONUC) type CHAR1 .
  methods URL_KONTROL
    importing
      !IV_URL type STRING
    returning
      value(RV_URL) type STRING .
protected section.
private section.
ENDCLASS.



CLASS ZMGTEST_STRAVELAG_URL_UPDATE IMPLEMENTATION.


  METHOD id_kontrol.
    DATA: ls_stravelag TYPE zmg_stravelag.

    SELECT SINGLE * FROM zmg_stravelag
      INTO ls_stravelag
      WHERE id = iv_id.

    IF ls_stravelag IS NOT INITIAL.
      rv_ok = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD update_url.

    UPDATE zmg_stravelag SET url = iv_url
                         WHERE id = iv_id.

    IF sy-subrc IS INITIAL.
      rv_sonuc = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD url_kontrol.

    DATA: lv_url TYPE string.
    lv_url = iv_url.

    CONDENSE lv_url NO-GAPS.
    TRANSLATE lv_url USING 'çcğgıiöoşsüu'.
    CONCATENATE 'https://www.' lv_url '.com' INTO rv_url.

  ENDMETHOD.
ENDCLASS.
