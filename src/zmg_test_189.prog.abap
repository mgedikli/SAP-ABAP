*&---------------------------------------------------------------------*
*& Report ZMG_TEST_189
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_189.
*Alistirma 9 s- 271
DATA: go_alvgrid   TYPE REF TO cl_gui_alv_grid,
      go_container TYPE REF TO cl_gui_custom_container,
      gt_fieldcat  TYPE lvc_t_fcat,
      gs_fieldcat  TYPE lvc_s_fcat,
      gs_layout    TYPE lvc_s_layo.

TYPES: BEGIN OF gty_table,
         num_01 TYPE i,
         num_02 TYPE i,
         sonuc  TYPE i,
       END   OF gty_table.

DATA: gt_table     TYPE TABLE OF gty_table,
      gs_structure TYPE gty_table,
      gv_num_01    TYPE i,
      gv_num_02    TYPE i,
      gv_sonuc     TYPE i.
DATA text_goster.

START-OF-SELECTION.
  CALL SCREEN 0400.
*&---------------------------------------------------------------------*
*& Module STATUS_0400 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0400 OUTPUT.
  SET PF-STATUS 'PF_STATUS_189'.
  SET TITLEBAR 'TITLE_189'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0400  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0400 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'CANCEL' OR 'EXIT'.
      LEAVE PROGRAM.
    WHEN 'TOPLA'.
      CLEAR: gt_table.
      gv_sonuc = gv_num_01 + gv_num_02.

    WHEN 'CIKAR'.
      CLEAR: gt_table.
      gv_sonuc = gv_num_01 - gv_num_02.

    WHEN 'CARP'.
      CLEAR: gt_table.
      gv_sonuc = gv_num_01 * gv_num_02.

    WHEN 'BOL'.
      CLEAR: gt_table.
      IF gv_num_02 NE 0.
        gv_sonuc = gv_num_01 / gv_num_02.

      ELSE.
        MESSAGE '2. Sayi sifir olamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'SHOW'.
      PERFORM select_data.
      PERFORM fcat.
      PERFORM layout.
      PERFORM show_alv.
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
FORM select_data .
  gs_structure-num_01 = gv_num_01.
  gs_structure-num_02 = gv_num_02.
  gs_structure-sonuc = gv_sonuc.

  APPEND: gs_structure TO gt_table.
  CLEAR:  gs_structure.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fcat .
  gs_fieldcat-fieldname  = 'NUM_01'.
  gs_fieldcat-scrtext_m   = 'Sayı-1'.
  APPEND : gs_fieldcat TO gt_fieldcat.
  CLEAR: gs_fieldcat.

  gs_fieldcat-fieldname  = 'NUM_02'.
  gs_fieldcat-scrtext_m   = 'Sayı-2'.
  APPEND : gs_fieldcat TO gt_fieldcat.
  CLEAR: gs_fieldcat.

  gs_fieldcat-fieldname  = 'SONUC'.
  gs_fieldcat-scrtext_m    = 'İşlem Sonucu'.
  APPEND : gs_fieldcat TO gt_fieldcat.
  CLEAR: gs_fieldcat.

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

ENDFORM.
*&---------------------------------------------------------------------*
*& Form show_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM show_alv.
  IF go_alvgrid IS INITIAL.
    CREATE OBJECT go_container
      EXPORTING
        container_name              = 'CONT'
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

    CREATE OBJECT go_alvgrid
      EXPORTING
        i_parent          = go_container
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_table_for_first_display(
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_table
        it_fieldcatalog               = gt_fieldcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).
    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.
