*&---------------------------------------------------------------------*
*& Report ZMG_TEST_186
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_186.
**Alistirma 7 S-271____zcm_test_186
DATA : go_alvgrid    TYPE REF TO cl_gui_alv_grid,
       go_container  TYPE REF TO cl_gui_custom_container,
       gt_fieldcat   TYPE lvc_t_fcat,
       gs_fieldcat   TYPE lvc_s_fcat,
       gs_layout     TYPE lvc_s_layo,
       gv_sayi       TYPE int4,
       gv_kucuk      TYPE flag,
       gv_buyuk      TYPE flag,
       ls_cell_color TYPE lvc_s_scol.

TYPES : BEGIN OF gty_table .
          INCLUDE STRUCTURE sflight.
TYPES :   cell_color TYPE lvc_t_scol.
TYPES : END OF gty_table.

DATA : gt_itab TYPE TABLE OF gty_table,
       gs_itab TYPE gty_table.

START-OF-SELECTION.

  CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
  MODULE status_0100 OUTPUT.
 SET PF-STATUS 'PF_STATUS_186'.
 SET TITLEBAR 'TITLE_186'.

  PERFORM select_data.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  DATA : ls_list TYPE gty_table.

  CASE sy-ucomm.
    WHEN 'BACK' OR 'CANCEL' OR 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'RENKLNDR'.

      CASE abap_true.
        WHEN gv_kucuk."Yeşil C511

          LOOP AT gt_itab INTO gs_itab WHERE seatsocc < gv_sayi.

            ls_cell_color-fname     = 'SEATSOCC'.
            ls_cell_color-color-col = 5.
            ls_cell_color-color-int = 1.
            ls_cell_color-color-inv = 1.

            APPEND ls_cell_color TO ls_list-cell_color.
            MODIFY gt_itab FROM ls_list TRANSPORTING cell_color.
            CLEAR : ls_list.
          ENDLOOP.

        WHEN gv_buyuk."Kırmızı C611

          LOOP AT gt_itab INTO gs_itab WHERE seatsocc > gv_sayi.

            ls_cell_color-fname     = 'SEATSOCC'.
            ls_cell_color-color-col = 6.
            ls_cell_color-color-int = 1.
            ls_cell_color-color-inv = 1.

            APPEND ls_cell_color TO ls_list-cell_color.
            MODIFY gt_itab FROM ls_list TRANSPORTING cell_color.
            CLEAR : ls_list.

          ENDLOOP.

      ENDCASE.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form select_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM select_data.
  IF gt_itab IS INITIAL.
    SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_itab.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fcat.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'SFLIGHT'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc <> 0.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM layout.

  gs_layout-zebra      = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-sel_mode   = 'A'.
  gs_layout-ctab_fname = 'CELL_COLOR'.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_alv .

  IF go_alvgrid IS INITIAL.

    CREATE OBJECT go_container
      EXPORTING
        container_name              = 'CC_ALV'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    CREATE OBJECT go_alvgrid
      EXPORTING
        i_parent          = go_container
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_table_for_first_display(
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_itab
        it_fieldcatalog               = gt_fieldcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.

    go_alvgrid->set_frontend_fieldcatalog( it_fieldcatalog = gt_fieldcat ).

    go_alvgrid->set_frontend_layout( is_layout = gs_layout ).

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.

  ENDIF.

ENDFORM.

**SFLIGHT tablosu için Container ALV hazırlayın. Kullanıcının bir sayı girebileceği 1 hücre
**(input field) oluşturun. 2 adet radiobuton oluşturun. Radiobutonlar “BÜYÜKTÜR” ve “KÜCÜKTÜR”
**seklinde isimlendirilsin. 1 adet buton oluşturun ve ismi “RENKLENDİR” olsun. Kullanıcı herhangi sayı
**girip radiobutonlardan birini seçtikten sonra kullanıcıdan bir renk alin. Tabloda satışı yapılan koltuk
**sayıları gelen koşula göre renklendirilsin. (Örnek: Kullanıcı 100 sayısını girdi ve “BÜYÜKTÜR” isimli
**radiobutonu seçtikten “RENKLENDIR” butonuna bastı ve “KIRMIZI” yazarak ok butonuna tıkladı. Bu
**durumda “SEATSOCC” kolonundaki 100’den büyük olan hücreler kırmızı ile renklendirilecek.)
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
