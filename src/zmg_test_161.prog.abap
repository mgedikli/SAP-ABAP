*&---------------------------------------------------------------------*
*& Report ZMG_TEST_161
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_161.
*Alistirma 4 -S- 271
DATA: go_cont_spfli TYPE REF TO cl_gui_custom_container,
      go_grid_spfli TYPE REF TO cl_gui_alv_grid,
      gt_fcat_spfli TYPE lvc_t_fcat,
      gt_spfli      TYPE TABLE OF spfli,
      gs_spfli      TYPE spfli.

DATA: go_cont_zmg  TYPE REF TO cl_gui_custom_container,
      go_grid_zmg  TYPE REF TO cl_gui_alv_grid,
      gt_fcat_zmg  TYPE lvc_t_fcat,
      gt_zmg_spfli TYPE TABLE OF zmg_spfli,
      gs_zmg_spfli TYPE zmg_spfli.

DATA: gs_layout TYPE lvc_s_layo,
gv_flag   type c length 1.

START-OF-SELECTION.

  CALL SCREEN 0400.

MODULE status_0400 OUTPUT.
  SET PF-STATUS 'STATUS_161'.
  SET TITLEBAR 'TITLE_161'.

  PERFORM layout.

  PERFORM select_data_spfli.
  PERFORM fcat_spfli.
  PERFORM show_alv_spfli.

  PERFORM select_data_zmg.
  PERFORM fcat_zmg.
  PERFORM show_alv_zmg.

ENDMODULE.

MODULE user_command_0400 INPUT.

  DATA: lt_selected_rows TYPE lvc_t_roid,
        ls_selected_rows TYPE lvc_s_roid,
        lt_spfli         TYPE TABLE OF spfli,
        ls_spfli         TYPE spfli.

  CASE sy-ucomm.
    WHEN 'GERI'.
      LEAVE PROGRAM.
    WHEN 'SAG'.
      go_grid_spfli->get_selected_rows(
        IMPORTING
          et_row_no     = lt_selected_rows ).

      CLEAR: lt_spfli.

      IF  lt_selected_rows  IS NOT INITIAL.

*        LOOP AT lt_selected_rows INTO ls_selected_rows.
*          READ TABLE gt_spfli INTO gs_spfli INDEX ls_selected_rows-row_id.
*          IF sy-subrc IS INITIAL.
*            DELETE gt_spfli INDEX ls_selected_rows-row_id.
*            APPEND gs_spfli TO gt_zmg_spfli.
*            INSERT zmg_spfli FROM gs_spfli.
*          ENDIF.
*        ENDLOOP. "Yanlis sonuc verdi.

        LOOP AT lt_selected_rows INTO ls_selected_rows.
          READ TABLE gt_spfli INTO gs_spfli INDEX ls_selected_rows-row_id.
          IF sy-subrc IS INITIAL.
            APPEND gs_spfli TO lt_spfli.
          ENDIF.
        ENDLOOP.

        LOOP AT lt_spfli INTO ls_spfli.
          DELETE: gt_spfli WHERE carrid = ls_spfli-carrid AND connid = ls_spfli-connid.
          APPEND ls_spfli TO gt_zmg_spfli.
          INSERT zmg_spfli FROM ls_spfli.
        ENDLOOP.

        gv_flag = abap_true.

      ENDIF.

    WHEN 'SOL'.
      go_grid_zmg->get_selected_rows(
         IMPORTING
           et_row_no     = lt_selected_rows ).

      CLEAR: lt_spfli.

      IF lt_selected_rows IS NOT INITIAL.
        LOOP AT lt_selected_rows INTO ls_selected_rows.
          READ TABLE gt_zmg_spfli INTO gs_zmg_spfli INDEX ls_selected_rows-row_id.
          IF sy-subrc IS INITIAL.
            APPEND gs_zmg_spfli TO lt_spfli.
          ENDIF.
        ENDLOOP.
      ENDIF.

      LOOP AT lt_spfli INTO ls_spfli.
        DELETE: gt_zmg_spfli WHERE carrid = ls_spfli-carrid AND connid = ls_spfli-connid.
        DELETE: FROM zmg_spfli WHERE carrid = ls_spfli-carrid AND connid = ls_spfli-connid.
        APPEND ls_spfli TO gt_spfli.
      ENDLOOP.

*    WHEN OTHERS.
  ENDCASE.
ENDMODULE.

FORM select_data_spfli.
  IF gt_spfli IS INITIAL AND gv_flag IS INITIAL.
    SELECT * FROM spfli INTO TABLE gt_spfli.
  ENDIF.
ENDFORM.

FORM fcat_spfli.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'SPFLI'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fcat_spfli
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

FORM show_alv_spfli.

  IF go_grid_spfli IS INITIAL.

    CREATE OBJECT go_cont_spfli
      EXPORTING
        container_name              = 'CC_SPFLI'
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

    CREATE OBJECT go_grid_spfli
      EXPORTING
        i_parent          = go_cont_spfli
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_grid_spfli->set_table_for_first_display(
      EXPORTING
        is_layout                     =  gs_layout
      CHANGING
        it_outtab                     =  gt_spfli
        it_fieldcatalog               =  gt_fcat_spfli
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.

    go_grid_spfli->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.

FORM select_data_zmg.
  SELECT * FROM zmg_spfli INTO TABLE gt_zmg_spfli.
ENDFORM.

FORM fcat_zmg.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_SPFLI'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fcat_zmg
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.

ENDFORM.

FORM show_alv_zmg.

  IF go_grid_zmg IS INITIAL.
    CREATE OBJECT go_cont_zmg
      EXPORTING
        container_name              = 'CC_ZMG_SPFLI'
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

    CREATE OBJECT go_grid_zmg
      EXPORTING
        i_parent          = go_cont_zmg
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_grid_zmg->set_table_for_first_display(
      EXPORTING
        is_layout                     =  gs_layout
      CHANGING
        it_outtab                     =  gt_zmg_spfli
        it_fieldcatalog               =  gt_fcat_zmg
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.

    go_grid_zmg->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.

ENDFORM.
