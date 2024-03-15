*&---------------------------------------------------------------------*
*& Report ZMG_TEST_331X
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_331x.
*1-Excel dosyasını içe aktarma: "+ s.352/zcm_326, zcm_test_331 ve 333 DERS 73/dk.00-2:40
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS: p_file   TYPE rlgrap-filename OBLIGATORY,
              p_table  TYPE tabname OBLIGATORY,                     "excel tablosunu int.Tab cevirmemiz icin excel Tab. satir yapisi ne?
              p_header AS CHECKBOX,
              p_mandt  AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_table,
         row TYPE n LENGTH 4,
       END   OF gty_table.

DATA: gv_file_type TYPE sdbad-funct,
      gv_file_name TYPE dbmsgora-filename,
      gt_tablo     TYPE TABLE OF alsmex_tabline,
      gt_row       TYPE TABLE OF gty_table,
      gt_fcat      TYPE lvc_t_fcat,
      gs_layout    TYPE lvc_s_layo,
      gr_data      TYPE REF TO data.

FIELD-SYMBOLS: <fs_table> TYPE STANDARD TABLE.          " ASSIGN gr_data->* TO <fs_table>. "<fs_table> FIELD-SYMBOLS tanimlanmasi gerekir!

"Kullanıcıdan dosya adını (yolu) al, kulakcık oluştur.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    IMPORTING
      file_name = p_file.

START-OF-SELECTION.

  gv_file_name = p_file.                                "Kullanicinin girdigi dosya kontrol et; Excel mi? Bize "pure_extension" dosya uzantisi lazim.

  CALL FUNCTION 'SPLIT_FILENAME'                        "'SPLIT_FILENAME' functiona yukaridan gelen 'p_file' dosya adini verebilmek icin 'long_filename'
    EXPORTING                                           " parametresi ile ayni type bir parametreye ihtiyac var.
      long_filename  = gv_file_name                     "dosya uzantisi->'SPLIT_FILENAME' tikla/Export/PURE_EXTENSION ->TYPE.. SDBAD-FUNCT (gv_file_type)tanimla
    IMPORTING                                           "'p_file' tipi yanlis->DUMP->cöz:'SPLIT_FILENAME' hangi tipte veri kabul eder?tikla/Import/DBMSGORA-FILENAME
      pure_extension = gv_file_type.                    "bu tipte bir deg tanimla ve icine 'p_file' at. gv_file_name TYPE dbmsgora-filename/ve IMPORTING file_name = p_file.


  TRANSLATE gv_file_type TO UPPER CASE.

  "XLS ya da XLSX olup olmadigini kontrol et.
  CHECK gv_file_type = 'XLS' OR gv_file_type = 'XLSX'.   "IF gv_file_type NE 'XLS' and gv_file_type NE 'XLSX'. LEAVE PROGRAM.

  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = p_file
      i_begin_col             = 1
      i_begin_row             = 1
      i_end_col               = COND #( WHEN gv_file_type = 'XLS'   THEN 256
                                        WHEN gv_file_type = 'XLSX'  THEN 16834 )
      i_end_row               = COND #( WHEN gv_file_type = 'XLS'   THEN 65536
                                        WHEN gv_file_type = 'XLSX'  THEN 1048576 )
      "Bu function, kendisine bir dosya yolu 'p_file' verildiginde, oradaki tabloyu alip, bir INTERNAL TABLO olusturup bize geri veriyor.
      "'ALSM_EXCEL_TO_INTERNAL_TABLE'/Tables/ -> gt_tablo TYPE TABLE OF ALSMEX_TABLINE.
    TABLES
      intern                  = gt_tablo
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.
  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.
  "excel dosyasinda kolon basliklari varsa bu hücreleri sil.
  IF p_header = abap_true.                                  "eger gelen excel dosyasinda kolon basligi varsa (is not initial), tablodan satir 1'i sil.
    DELETE gt_tablo WHERE row = 1.

    LOOP AT gt_tablo ASSIGNING FIELD-SYMBOL(<gs_str>).
      <gs_str>-row = <gs_str>-row - 1.
    ENDLOOP.
  ENDIF.
  "excel dosyasinda mandt yoksa, manuel olarak ekle.
  IF p_mandt IS INITIAL.
    LOOP AT gt_tablo ASSIGNING <gs_str>.
      <gs_str>-col = <gs_str>-col + 1.
    ENDLOOP.

    gt_row = VALUE #( FOR gs_line IN gt_tablo ( row = gs_line-row ) ).
    SORT gt_row.
    DELETE ADJACENT DUPLICATES FROM gt_row.

    LOOP AT gt_row INTO DATA(gs_row).
      APPEND INITIAL LINE TO gt_tablo ASSIGNING <gs_str>.
      <gs_str>-row = gs_row-row.
      <gs_str>-col = '0001'.
      <gs_str>-value = sy-mandt.
    ENDLOOP.

    SORT gt_tablo BY row col.

  ENDIF.

  "gelen Tablo veya Str. tipinde bir DATA referansini olustur.(dinamik)
  CREATE DATA gr_data TYPE STANDARD TABLE OF (p_table).       "gr_data' icinde her tür veriyi(Tablo/Str vs) tutabilecek birreferans.
  "(p_table)kullanicinin verdigi TBLO/STR adi(zB.stravelag).
  "Referans icindeki internal tabloyu kullanilabilir hale getirebilmek icin FS'e ata.
  ASSIGN gr_data->* TO <fs_table>.

*  LOOP AT gt_tablo INTO DATA(gs_tablo) GROUP BY ( row = gs_tablo-row )
*                                       INTO DATA(gt_group).
*
*    APPEND INITIAL LINE TO <fs_table> ASSIGNING FIELD-SYMBOL(<fs_str>). "<fs_table> isimli Tabloya bos bir satir ekledik ve bu satiri (<fs_str>) sembolüne ASSIGN ettik.
*
*    LOOP AT GROUP gt_group INTO DATA(gs_group).                         "Simdi artik, <fs_str>da olacak tüm degisiklikler <fs_table> IntTab.da da gecerli olacak.
*      ASSIGN COMPONENT gs_group-col OF STRUCTURE <fs_str> TO FIELD-SYMBOL(<fs_hucre>).
*      IF sy-subrc IS INITIAL.
*        <fs_hucre> = gs_group-value.
*      ENDIF.
*    ENDLOOP.
*  ENDLOOP.              "ayni seyi LOOP AT GROUP kullanmadan Abap 7.0 öncesi yöntemle nasil yapariz?

  IF gt_row IS INITIAL.
    gt_row = VALUE #( FOR gs_line IN gt_tablo ( row = gs_line-row ) ).
    SORT gt_row.
    DELETE ADJACENT DUPLICATES FROM gt_row.
  ENDIF.

  LOOP AT gt_row INTO gs_row.

    APPEND INITIAL LINE TO <fs_table> ASSIGNING FIELD-SYMBOL(<fs_str>).

    LOOP AT gt_tablo INTO DATA(gs_tablo) WHERE row = gs_row-row.      "row = 1. -> yerine dinamik bir kodlama yapilir.

      ASSIGN COMPONENT gs_tablo-col OF STRUCTURE <fs_str> TO FIELD-SYMBOL(<fs_hucre>).

      IF sy-subrc IS INITIAL.
        <fs_hucre> = gs_tablo-value.
      ENDIF.
    ENDLOOP.
    CLEAR: gs_row.
  ENDLOOP.

  "fieldcatalog hazırlama

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = p_table
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  LOOP AT gt_fcat ASSIGNING FIELD-SYMBOL(<fs_fcat>).
    IF <fs_fcat>-fieldname NE 'MANDT'.
      <fs_fcat>-edit = abap_true.
    ENDIF.
  ENDLOOP.


  "Layout hazırlama
  gs_layout-zebra      = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-sel_mode   = 'A'.


  "Alv yi ekran da gösterme
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
      i_callback_program = sy-repid
      is_layout_lvc      = gs_layout
      it_fieldcat_lvc    = gt_fcat
    TABLES
      t_outtab           = <fs_table>
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.
