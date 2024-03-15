*&---------------------------------------------------------------------*
*& Report ZMG_TEST_350X
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_350x. "4 Mart day 76 son bölüm
*S.361)Alıştırma – 13: ZCM_DERS_NOTLARI tablosu içinde kayıt oluşturarak bu tablo için dinamik ALV hazırlayın.
TYPES: BEGIN OF gty_static,
         kayit_no  TYPE zcm_ders_notlari-kayit_no,
         ogr_id    TYPE zcm_ders_notlari-ogr_id,
         ogr_ad    TYPE zcm_ders_notlari-ogr_ad,
         ogr_soyad TYPE zcm_ders_notlari-ogr_soyad,
       END OF gty_static.

TYPES: BEGIN OF gty_ders,
         ders TYPE zcm_ders_notlari-ders,
       END OF gty_ders.

*TYPES: BEGIN OF gty_sonuc,                  "sonuc kismina gerek yok
*         sonuc TYPE zcm_ders_notlari-sonuc,
*       END OF gty_sonuc.

DATA: gt_static   TYPE TABLE OF gty_static,
      gt_ders     TYPE TABLE OF gty_ders,
*      gt_sonuc    TYPE TABLE OF gty_sonuc,  "sonuc kismina gerek yok
      gt_fieldcat TYPE lvc_t_fcat,
      gs_layout   TYPE lvc_s_layo.

DATA: ro_data TYPE REF TO data.

FIELD-SYMBOLS : <fs_table> TYPE STANDARD TABLE.

START-OF-SELECTION.

  SELECT * FROM zcm_ders_notlari INTO TABLE @DATA(gt_ders_notlari).

  gt_static = VALUE #( FOR gs_str IN gt_ders_notlari ( kayit_no    = gs_str-kayit_no
                                                       ogr_id      = gs_str-ogr_id
                                                       ogr_ad      = gs_str-ogr_ad
                                                       ogr_soyad   = gs_str-ogr_soyad ) ).

  SORT gt_static BY kayit_no.
  DELETE ADJACENT DUPLICATES FROM gt_static COMPARING kayit_no.

  gt_ders = VALUE #( FOR gs_str IN gt_ders_notlari ( ders = gs_str-ders ) ).
  SORT gt_ders BY ders.
  DELETE ADJACENT DUPLICATES FROM gt_ders COMPARING ders.

*  gt_sonuc = VALUE #( FOR gs_str IN gt_ders_notlari ( sonuc = gs_str-sonuc ) ).    "sonuc kismina gerek yok
*  SORT gt_sonuc BY sonuc.
*  DELETE ADJACENT DUPLICATES FROM gt_sonuc COMPARING sonuc.

  gt_fieldcat = VALUE #( ( fieldname = 'KAYIT_NO'   scrtext_s = 'KAYIT_NO'  outputlen = '5'  ) "dinamik ALV yapisinda gt_fieldcat i elle manuel dolduruyoruz.
                         ( fieldname = 'OGR_ID'     scrtext_s = 'OGR_ID'    outputlen = '5'  )
                         ( fieldname = 'OGR_AD'     scrtext_s = 'OGR_AD'    outputlen = '15' )
                         ( fieldname = 'OGR_SOYAD'  scrtext_s = 'OGR_SOYAD' outputlen = '15' ) ).

  gt_fieldcat = VALUE #( BASE gt_fieldcat FOR gs_fs IN gt_ders  ( fieldname = gs_fs-ders
                                                                  scrtext_s = gs_fs-ders
                                                                  outputlen = '25') ).

  cl_alv_table_create=>create_dynamic_table(
    EXPORTING
      it_fieldcatalog           = gt_fieldcat      " Field Catalog
  IMPORTING
    ep_table                    = ro_data          " dönen ro_data nin tablo olarak kullanilabilmasi icin FIELD-SYMBOLS: <fs_table> TYPE STANDARD TABLE tanimla

    EXCEPTIONS                                     " ve asagida ASSIGN ro_data->* TO <fs_table>. diyerek assign et.
      generate_subpool_dir_full = 1                " At Most 36 Subroutine Pools Can Be Generated Temporarily
      OTHERS                    = 2 ).

  ASSIGN ro_data->* TO <fs_table>.

********************************************************************************************************************

LOOP AT gt_static INTO DATA(gs_static).
  APPEND INITIAL LINE TO <fs_table> ASSIGNING FIELD-SYMBOL(<fs_str>).

  ASSIGN COMPONENT 'KAYIT_NO' OF STRUCTURE <fs_str> to FIELD-SYMBOL(<fs_value>).
  <fs_value> = gs_static-kayit_no.

  ASSIGN COMPONENT 'OGR_ID' OF STRUCTURE <fs_str> to <fs_value>.
  <fs_value> = gs_static-ogr_id.

  ASSIGN COMPONENT 'OGR_AD' OF STRUCTURE <fs_str> to <fs_value>.
  <fs_value> = gs_static-ogr_ad.

  ASSIGN COMPONENT 'OGR_SOYAD' OF STRUCTURE <fs_str> to <fs_value>.
  <fs_value> = gs_static-ogr_soyad.

  LOOP AT gt_ders_notlari INTO DATA(gs_ders_notlari) WHERE kayit_no = gs_static-kayit_no.

    ASSIGN COMPONENT gs_ders_notlari-ders OF STRUCTURE <fs_str> to <fs_value>.
   <fs_value> =  gs_ders_notlari-sonuc.

  ENDLOOP.

ENDLOOP.
********************************************************************************************************************

  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
 EXPORTING
   I_CALLBACK_PROGRAM                = sy-repid " 'ZMG_TEST_350X'
   IS_LAYOUT_LVC                     = gs_layout
   IT_FIELDCAT_LVC                   = gt_fieldcat
  TABLES
    t_outtab                          = <fs_table>
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2.
IF sy-subrc <> 0.
LEAVE PROGRAM.
ENDIF.


*  BREAK-POINT.
