*&---------------------------------------------------------------------*
*& Report ZMG_ALIS_194_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_alis_194_10.
*Alıştırma – 10: Yeni bir database tablosu oluşturun. (Örneğin ZCM_SPFLI) Satir yapısı SPFLI database
*tablosu ile tamamen ayni olsun. Daha sonra yeni bir rapor oluşturun ve SPFLI tablosundaki bütün
*bilgileri okuyup oluşturduğunuz yeni database tablosu içine kaydedin. Oluşturduğunuz ve içini
*doldurduğunuz tablodaki bütün satırları okuyup ALV’sini gösterin. Tamamen kendinize ait veya kopya
*PF_Status kullanarak 2 yeni buton oluşturun. İlk butona basıldığında CITYFROM ve CITYTO kolonları
*değiştirilebilir (editable) hale gelsin. Daha sonra hücreler içerisinde yapılan değişiklikleri kullanarak
*kendinize ait database tablosunu güncelleyin. (İpucu: Kullanıcının, ALV hücresinde değişiklik yaptıktan
*sonra başka bir hücre üzerine çift tıklaması gerekmektedir. Aksi halde yapılan değişiklik SAP tarafından
*tamamlanmış kabul edilmiyor. Kullanıcıdan bu doğrultuda bir teyit almak mantıklı olacaktır.)


DATA: gt_spfli    TYPE TABLE OF spfli,
      gs_spfli    TYPE spfli,
      gt_fieldcat TYPE lvc_t_fcat,
      gs_fieldcat TYPE lvc_s_fcat,
      gs_layout   TYPE lvc_s_layo.

PERFORM select_data.
PERFORM fcat.
PERFORM layout.
PERFORM show_alv.

FORM select_data.
  SELECT * FROM spfli INTO TABLE gt_spfli.

  LOOP AT gt_spfli INTO gs_spfli.
    INSERT zmg_spfli FROM gs_spfli.
*    MODIFY gt_spfli FROM gs_spfli.
  ENDLOOP.
ENDFORM.

FORM fcat .
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_SPFLI'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.
  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM layout.
  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.
ENDFORM.

FORM show_alv .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
    EXPORTING
      i_callback_program       = sy-repid
      is_layout_lvc            = gs_layout
      it_fieldcat_lvc          = gt_fieldcat
      i_callback_pf_status_set = 'STATUS_ALS_10'
      i_callback_user_command  = 'UC_COMMAND'
    TABLES
      t_outtab                 = gt_spfli
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.

  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM status_als_10 USING lt_extab TYPE slis_t_extab.

  SET PF-STATUS 'STATUS_11'.

ENDFORM.

FORM uc_command USING ucomm TYPE sy-ucomm
      ls_selfield TYPE slis_selfield.
  CASE  ucomm.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'EKLE'.
      LOOP AT gt_fieldcat INTO gs_fieldcat.
        CASE  gs_fieldcat-fieldname.
          WHEN  'CITYTO'.
            gs_fieldcat-edit = abap_true.

          WHEN  'CITYFROM'.
            gs_fieldcat-edit = abap_true.

        ENDCASE.
        MODIFY gt_fieldcat FROM gs_fieldcat.
      ENDLOOP.
    WHEN 'KAYDET'.
      BREAK-POINT.
*      UPDATE zmg_spfli
*      SET cityfrom = gs_fieldcat
        endcase.
      PERFORM fcat.
      PERFORM show_alv.

ENDFORM.
