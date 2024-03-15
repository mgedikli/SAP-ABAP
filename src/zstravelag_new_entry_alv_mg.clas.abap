class ZSTRAVELAG_NEW_ENTRY_ALV_MG definition
  public
  final
  create public .

public section.

  methods NEW_ENTRY
    importing
      !IV_AGENCYNUM type S_AGNCYNUM
      !IV_NAME type S_AGNCYNUM
      !IV_STREET type S_STREET
      !IV_POSTBOX type S_POSTBOX
      !IV_POSTCODE type POSTCODE
      !IV_CITY type CITY
      !IV_COUNTRY type S_COUNTRY
      !IV_REGION type S_REGION
      !IV_TELEPHONE type S_PHONENO
      !IV_CURRENCY type S_CURR_AG .
  methods PREP_FCAT
    exporting
      !ET_FCAT type SLIS_T_FIELDCAT_ALV .
  methods PREP_LAYOUT
    importing
      !IV_ZEBRA type CHAR1 optional
      !IV_COLWIDTH_OPTIMIZE type CHAR1 optional
    exporting
      !ES_LAYOUT type SLIS_LAYOUT_ALV .
  methods PREP_DATA
    exporting
      !ET_STRAVELAG type ZCM_TT_STRAVELAG .
  methods SHOW_DATA
    importing
      !IT_FCAT type SLIS_T_FIELDCAT_ALV
      !IS_LAYOUT type SLIS_LAYOUT_ALV
      !IT_STRAVELAG type ZCM_TT_STRAVELAG .
protected section.

  methods MAKE_URL
    importing
      !IV_NAME type S_AGNCYNAM
    returning
      value(RV_URL) type S_URL .
private section.
ENDCLASS.



CLASS ZSTRAVELAG_NEW_ENTRY_ALV_MG IMPLEMENTATION.


  method MAKE_URL.
  endmethod.


  method NEW_ENTRY.
  endmethod.


  method PREP_DATA.
  endmethod.


  method PREP_FCAT.
  endmethod.


  method PREP_LAYOUT.
  endmethod.


  method SHOW_DATA.
  endmethod.
ENDCLASS.
