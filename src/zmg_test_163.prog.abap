*&---------------------------------------------------------------------*
*& Report ZMG_TEST_163
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_163.
*6 S-271
*Alıştırma – 6: SFLIGHT tablosu için Container ALV hazırlayın. Kullanıcının bir sayı girebileceği 1 hücre
*(input field) oluşturun. 2 adet radiobuton oluşturun. Radiobutonlar “BÜYÜKTÜR” ve “KÜCÜKTÜR”
*seklinde isimlendirilsin. 1 adet buton oluşturun ve ismi “RENKLENDİR” olsun. Kullanıcı herhangi sayı
*girip radiobutonlardan birini seçtikten sonra kullanıcıdan bir renk alin. Tabloda satışı yapılan koltuk
*sayıları gelen koşula göre renklendirilsin. (Örnek: Kullanıcı 100 sayısını girdi ve “BÜYÜKTÜR” isimli
*radiobutonu seçtikten “RENKLENDIR” butonuna bastı ve “KIRMIZI” yazarak ok butonuna tıkladı. Bu
*durumda “SEATSOCC” kolonundaki 100’den büyük olan hücreler kırmızı ile renklendirilecek.)

DATA: go_cont_sflight TYPE REF TO cl_gui_custom_container,
      go_grid_sflight TYPE REF TO cl_gui_alv_grid,
      gt_fcat_sflight TYPE lvc_t_fcat,
      gs_fcat_sflight TYPE lvc_s_fcat,
      gt_sflight      TYPE TABLE OF sflight,
      gs_sflight      TYPE sflight.

DATA: gs_layout  TYPE lvc_s_layo,
      gv_sayi    TYPE i,
      rdb_1      TYPE c LENGTH 1,
      rdb_2      TYPE c LENGTH 1,
      gv_color   TYPE c LENGTH 10,
      gv_color_t TYPE c LENGTH 4.


START-OF-SELECTION.

  CALL SCREEN 0400.

  IF gv_color = 'KIRMIZI'.
    gv_color_t = 'C610'.
  ENDIF.

  IF gv_color = 'SARI'.
    gv_color_t = 'C310'.
  ENDIF.

  IF gv_color = 'YESIL'.
    gv_color_t = 'C510'.
  ENDIF.


MODULE status_0400 OUTPUT.
  SET PF-STATUS 'STATUS_163'.
  SET TITLEBAR 'TITLE_163'.

  PERFORM layout.

  PERFORM select_data_sflight.
  PERFORM fcat_sflight.
  PERFORM show_alv_sflight.

ENDMODULE.

MODULE user_command_0400 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      BREAK-POINT.

      LEAVE PROGRAM.
    WHEN 'RENK'.
      IF sy-ucomm = 'RBTN'.
        IF RDB_1 = 'X'.
          BREAK-POINT.
          PERFORM buyuktur.

        ELSEIF rdb_2 = 'X'.
          PERFORM kucuktur.
        ENDIF.

      ENDIF.
*	WHEN OTHERS.
  ENDCASE.

ENDMODULE.

FORM select_data_sflight .
  SELECT * FROM sflight INTO TABLE gt_sflight.
ENDFORM.

FORM fcat_sflight.
  IF gt_fcat_sflight IS INITIAL.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'SFLIGHT'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fcat_sflight
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.

FORM show_alv_sflight.
  IF go_grid_sflight IS INITIAL.

    CREATE OBJECT go_cont_sflight
      EXPORTING
        container_name              = 'CC_SFLIGHT'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    CREATE OBJECT go_grid_sflight
      EXPORTING
        i_parent          = go_cont_sflight
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_grid_sflight->set_table_for_first_display(
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_sflight
        it_fieldcatalog               = gt_fcat_sflight
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.
    go_grid_sflight->set_frontend_fieldcatalog( it_fieldcatalog = gt_fcat_sflight ).

    go_grid_sflight->set_frontend_layout( is_layout = gs_layout ).

    go_grid_sflight->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.

FORM layout.
  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.
ENDFORM.

FORM buyuktur.

  LOOP AT gt_sflight INTO gs_sflight.
    IF gs_sflight-seatsocc > gv_sayi.
      READ TABLE gt_fcat_sflight INTO gs_fcat_sflight WITH KEY fieldname = gs_sflight-seatsocc.
      IF sy-subrc IS INITIAL.
        gs_fcat_sflight-emphasize = gv_color_t.
        MODIFY gt_fcat_sflight
          FROM gs_fcat_sflight
          TRANSPORTING emphasize
          WHERE fieldname  = gs_sflight-seatsocc.
      ENDIF.
    ENDIF.

  ENDLOOP.
ENDFORM.

FORM kucuktur.
  LOOP AT gt_sflight INTO gs_sflight.
    IF gs_sflight-seatsocc < gv_sayi.
      READ TABLE gt_fcat_sflight INTO gs_fcat_sflight WITH KEY fieldname = gs_sflight-seatsocc.
      IF sy-subrc IS INITIAL.
        gs_fcat_sflight-emphasize = gv_color_t.
        MODIFY gt_fcat_sflight
          FROM gs_fcat_sflight
          TRANSPORTING emphasize
          WHERE fieldname = gs_fcat_sflight-fieldname.
      ENDIF.
    ENDIF.

  ENDLOOP.


ENDFORM.
