class ZMGMITARBEITER_INFO definition
  public
  final
  create public .

public section.

  methods MITARBEITER_INFO_HOLEN
    importing
      !IV_ID type ZCM_DE_ID
    exporting
      !ES_MITARBEITER_INFO type ZMG_TABLO_1 .
  methods URLAUB_INFO_HOLEN
    importing
      !IV_ID type ZCM_DE_ID
    exporting
      !ET_URLAUB_INFO type ZMG_TT_URLAUB .
protected section.
private section.
ENDCLASS.



CLASS ZMGMITARBEITER_INFO IMPLEMENTATION.


  METHOD mitarbeiter_info_holen.

    SELECT SINGLE * FROM zmg_tablo_1
         INTO es_mitarbeiter_info
         WHERE id = iv_id.

  ENDMETHOD.


  METHOD urlaub_info_holen.

    SELECT jahr, urlaub_alte FROM zmg_tablo_2
      INTO TABLE @et_urlaub_info
      WHERE id = @iv_id.

  ENDMETHOD.
ENDCLASS.
