*&---------------------------------------------------------------------*
*& Report ZABAP_MG_018A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_018a.
*Container ALV işlemi,2 fonksiyon kombinasyonu kullanarak ya da Classlar yardımıyla olusturulur.
*Class kullanarak ALV oluşturma: CL_GUI_ALV_GRID /ve/ CL_GUI_CUSTOM_CONTAINER Classları

DATA: go_alvgrid   TYPE REF TO cl_gui_alv_grid,
      go_container TYPE REF TO cl_gui_custom_container,
      gt_fieldcat  TYPE lvc_t_fcat,
      gs_fieldcat  TYPE lvc_s_fcat,
      gs_layout    TYPE lvc_s_layo.

TYPES: BEGIN OF gty_list.
         INCLUDE STRUCTURE sflight.
TYPES:   row_color TYPE c LENGTH 4.
TYPES:   cell_color TYPE lvc_t_scol.
*TYPES:   traffic_light TYPE c LENGTH 1.
TYPES:   traffic_light TYPE icon-id.
TYPES: END   OF gty_list.

DATA: gt_list TYPE TABLE OF gty_list.

START-OF-SELECTION.

  CALL SCREEN 0100.

MODULE status_0100 OUTPUT.
  SET PF-STATUS 'PF_STATUS_018A'.
  SET TITLEBAR 'TITLE_018A'.

  PERFORM select_data.
  PERFORM open_traffic_lights.
  PERFORM fcat.
  PERFORM layout.
  PERFORM show_alv.

ENDMODULE.

MODULE user_command_0100 INPUT.

  DATA: lt_selected_rows  TYPE lvc_t_roid,
        ls_selected_row   TYPE lvc_s_roid,
        lt_list           TYPE TABLE OF gty_list,
        ls_list           TYPE gty_list,
        lt_index_columns  TYPE lvc_t_col,
        ls_index_columns  TYPE lvc_s_col,
        lv_color          TYPE lvc_emphsz,
        lv_answer         TYPE c LENGTH 1,
        lt_selected_cells TYPE lvc_t_cell,
        ls_selected_cells TYPE lvc_s_cell,
        ls_sell_color     TYPE lvc_s_scol,
        lv_color_number   TYPE c LENGTH 1,
        lv_intensified    TYPE c LENGTH 1,
        lv_inverse        TYPE c LENGTH 1,
        lt_filter         TYPE lvc_t_filt,
        ls_filter         TYPE lvc_s_filt,
        lt_sort           TYPE lvc_t_sort,
        ls_sort           TYPE lvc_s_sort.


  CASE sy-ucomm.
    WHEN 'LEAVE' OR 'CANCEL' OR 'EXIT'.
      LEAVE PROGRAM.

    WHEN 'SIL'.
      go_alvgrid->get_selected_rows(
        IMPORTING
          et_row_no = lt_selected_rows ).

      lt_list = gt_list.

      LOOP AT lt_selected_rows INTO ls_selected_row.
        READ TABLE lt_list INTO ls_list INDEX ls_selected_row-row_id.
        IF sy-subrc IS INITIAL.
          DELETE gt_list  WHERE carrid = ls_list-carrid
                          AND   connid = ls_list-connid
                          AND   fldate = ls_list-fldate.

        ENDIF.
      ENDLOOP.

    WHEN 'RESET'.
      CLEAR: gt_list.
      SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_list. "DersteYOK

    WHEN 'K_RENK'.
      go_alvgrid->get_selected_columns(
        IMPORTING
          et_index_columns = lt_index_columns ).

      IF lt_index_columns IS NOT INITIAL.
        CALL FUNCTION 'ZCM_COLOR_SELECTION'
          IMPORTING
            ev_color  = lv_color
            ev_answer = lv_answer.
        IF lv_answer IS INITIAL AND lv_color IS NOT INITIAL.
          LOOP AT lt_index_columns INTO ls_index_columns.
            READ TABLE gt_fieldcat INTO gs_fieldcat WITH KEY fieldname = ls_index_columns-fieldname.
            IF sy-subrc IS INITIAL.
              gs_fieldcat-emphasize = lv_color.
              MODIFY gt_fieldcat FROM gs_fieldcat TRANSPORTING emphasize WHERE fieldname = gs_fieldcat-fieldname.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ELSE.
        MESSAGE 'En az bir adet KOLON seciniz.' TYPE 'I'.
      ENDIF.

    WHEN 'S_RENK'.
      go_alvgrid->get_selected_rows(
        IMPORTING
          et_row_no  = lt_selected_rows ).

      IF lt_selected_rows IS NOT INITIAL.
        CALL FUNCTION 'ZCM_COLOR_SELECTION'
          IMPORTING
            ev_color  = lv_color
            ev_answer = lv_answer.

        IF lv_answer IS INITIAL AND lv_color IS NOT INITIAL.
          LOOP AT lt_selected_rows INTO ls_selected_row.
            READ TABLE gt_list INTO ls_list INDEX ls_selected_row-row_id.
            IF sy-subrc IS INITIAL.
              ls_list-row_color = lv_color.
              MODIFY gt_list FROM ls_list TRANSPORTING row_color WHERE carrid = ls_list-carrid
                                                                  AND  connid = ls_list-connid
                                                                  AND  fldate = ls_list-fldate.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ELSE.
        MESSAGE 'En az bir adet SATIR seciniz.' TYPE 'I'.
      ENDIF.

    WHEN 'H_RENK'.
      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      IF lt_selected_cells IS NOT INITIAL.
        CALL FUNCTION 'ZCM_COLOR_SELECTION_CELL'
          IMPORTING
            ev_color_number = lv_color_number
            ev_intensified  = lv_intensified
            ev_inverse      = lv_inverse
            ev_answer       = lv_answer.

        LOOP AT lt_selected_cells INTO ls_selected_cells.
          ls_sell_color-fname       = ls_selected_cells-col_id.
          ls_sell_color-color-col   = lv_color_number.
          ls_sell_color-color-int   = lv_intensified.
          ls_sell_color-color-inv   = lv_inverse.

          READ TABLE gt_list INTO ls_list INDEX ls_selected_cells-row_id.
          IF sy-subrc IS INITIAL.
            APPEND ls_sell_color TO ls_list-cell_color.

            MODIFY gt_list FROM ls_list TRANSPORTING cell_color WHERE carrid  = ls_list-carrid
                                                                AND  connid   = ls_list-connid
                                                                AND  fldate   = ls_list-fldate.
          ENDIF.
        ENDLOOP.
      ELSE.
        MESSAGE 'En az bir adet HÜCRE seciniz.' TYPE 'I'.
      ENDIF.

    WHEN 'F_UCAK'.
      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      IF lines( lt_selected_cells ) = 1.
        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.
        IF sy-subrc IS INITIAL.
          IF ls_selected_cells-col_id = 'PLANETYPE'.
            READ TABLE gt_list INTO ls_list INDEX ls_selected_cells-row_id.
            IF sy-subrc IS INITIAL.
              ls_filter-fieldname = ls_selected_cells-col_id.
              ls_filter-sign      = 'I'.
              ls_filter-option    = 'EQ'.
              ls_filter-low       = ls_list-planetype.

              APPEND ls_filter TO lt_filter.
            ENDIF.
          ELSE.
            MESSAGE 'Sadece PLANE TYPE kolonundan bir hücre secerek kullaniniz.' TYPE 'I'.
          ENDIF.
        ENDIF.
      ELSE.
        MESSAGE 'Filtreleme butonunu sadece bir hücre secerek kullaniniz.' TYPE 'I'.
      ENDIF.

    WHEN 'A_Z'.
      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      IF lines( lt_selected_cells ) = 1.
        CLEAR: lt_sort.
        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.
        IF sy-subrc IS INITIAL.
          ls_sort-spos        = sy-tabix.
          ls_sort-fieldname   = ls_selected_cells-col_id.
          ls_sort-up          = abap_true.
          ls_sort-down        = ' '.
          APPEND ls_sort TO lt_sort.
        ENDIF.
      ELSE.
        MESSAGE 'Siralama Butonunu sadece 1 Hücre secerek kullaniniz.' TYPE 'I'.
      ENDIF.

    WHEN 'Z_A'.
      go_alvgrid->get_selected_cells(
        IMPORTING
          et_cell = lt_selected_cells ).

      IF lines( lt_selected_cells ) = 1.
        CLEAR: lt_sort.
        READ TABLE lt_selected_cells INTO ls_selected_cells INDEX 1.
        IF sy-subrc IS INITIAL.
          ls_sort-spos        = sy-tabix.
          ls_sort-fieldname   = ls_selected_cells-col_id.
          ls_sort-up          = ' '.
          ls_sort-down        = abap_true.
          APPEND ls_sort TO lt_sort.
        ENDIF.
      ELSE.
        MESSAGE 'Siralama Butonunu sadece 1 Hücre secerek kullaniniz.' TYPE 'I'.
      ENDIF.

  ENDCASE.
ENDMODULE.

FORM select_data.
  IF gt_list IS INITIAL.
    SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_list.
  ENDIF.
ENDFORM.

FORM fcat.
  IF gt_fieldcat IS INITIAL.
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
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    gs_fieldcat-fieldname = 'TRAFFIC_LIGHT'.      "Ducumentte eksik olan kisim
    gs_fieldcat-scrtext_m = 'Dolu Koltuk Oranı'.  "Ducumentte eksik olan kisim
    gs_fieldcat-col_pos = 7.                      "Ducumentte eksik olan kisim

    APPEND gs_fieldcat TO gt_fieldcat.
    CLEAR: gs_fieldcat.

  ENDIF.
ENDFORM.

FORM layout.
  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.
  gs_layout-info_fname = 'ROW_COLOR'.
  gs_layout-ctab_fname = 'CELL_COLOR'.
*  gs_layout-excp_fname = 'TRAFFIC_LIGHT'.
ENDFORM.

FORM show_alv.
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
        it_outtab                     = gt_list
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
    go_alvgrid->set_frontend_fieldcatalog(
        EXPORTING
          it_fieldcatalog = gt_fieldcat ).

    go_alvgrid->set_frontend_layout(
        EXPORTING
          is_layout = gs_layout ).

    go_alvgrid->set_filter_criteria(
      EXPORTING
        it_filter                 = lt_filter
      EXCEPTIONS
        no_fieldcatalog_available = 1
        OTHERS                    = 2 ).
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_sort_criteria(
      EXPORTING
        it_sort                   =  lt_sort
      EXCEPTIONS
        no_fieldcatalog_available = 1
        OTHERS                    = 2 ).
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.

FORM open_traffic_lights .
  DATA: ls_list    TYPE gty_list,
        lv_decimal TYPE p DECIMALS 1.

  LOOP AT gt_list INTO ls_list.

    lv_decimal =  ls_list-seatsocc / ls_list-seatsmax.

    IF lv_decimal >= ( 80 / 100 ).
*      ls_list-traffic_light = 1.
      ls_list-traffic_light = '@0A@'.
    ELSEIF lv_decimal < ( 80 / 100 ) AND lv_decimal >= ( 40 / 100 ).
*      ls_list-traffic_light = 2.
      ls_list-traffic_light = '@09@'.
    ELSEIF lv_decimal < ( 40 / 100 ).
*      ls_list-traffic_light = 3.
      ls_list-traffic_light = '@08@'.
    ENDIF.

    MODIFY gt_list FROM ls_list TRANSPORTING traffic_light WHERE carrid = ls_list-carrid
                                                            AND   connid = ls_list-connid
                                                            AND   fldate = ls_list-fldate.
  ENDLOOP.
ENDFORM.
