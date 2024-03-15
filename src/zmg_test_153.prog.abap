*&---------------------------------------------------------------------*
*& Report ZMG_TEST_153
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_153.
*Alistirma 8 (7)
*
CLASS lcl_show_alv DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA: gt_scarr   TYPE zcm_tt_scarr,
                gt_spfli   TYPE zcm_tt_spfli,
                gt_sflight TYPE zcm_tt_sflight,
                gt_fcat    TYPE lvc_t_fcat,
                gs_layout  TYPE lvc_s_layo.
    METHODS: constructor IMPORTING iv_scarr   TYPE char1
                                   iv_spfli   TYPE char1
                                   iv_sflight TYPE char1,
      show_alv_scarr,
      show_alv_spfli,
      show_alv_sflight.
ENDCLASS.

CLASS lcl_show_alv IMPLEMENTATION.

  METHOD constructor.

    IF iv_scarr IS NOT INITIAL.
      SELECT * FROM scarr INTO TABLE gt_scarr.
    ELSEIF iv_spfli IS NOT INITIAL.
      SELECT * FROM spfli INTO TABLE gt_spfli.
    ELSEIF iv_sflight IS NOT INITIAL.
      SELECT * FROM sflight INTO TABLE gt_sflight.
    ENDIF.

  ENDMETHOD.

  METHOD show_alv_scarr.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'SCARR'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    gs_layout-zebra      = abap_true.
    gs_layout-cwidth_opt = abap_true.
    gs_layout-sel_mode   = 'A'.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program = sy-repid
        is_layout_lvc      = gs_layout
        it_fieldcat_lvc    = gt_fcat
      TABLES
        t_outtab           = gt_scarr
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ENDMETHOD.

  METHOD show_alv_spfli.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'SPFLI'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    gs_layout-zebra      = abap_true.
    gs_layout-cwidth_opt = abap_true.
    gs_layout-sel_mode   = 'A'.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program = sy-repid
        is_layout_lvc      = gs_layout
        it_fieldcat_lvc    = gt_fcat
      TABLES
        t_outtab           = gt_spfli
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ENDMETHOD.

  METHOD show_alv_sflight.

    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'SFLIGHT'
        i_bypassing_buffer     = abap_true
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    gs_layout-zebra      = abap_true.
    gs_layout-cwidth_opt = abap_true.
    gs_layout-sel_mode   = 'A'.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program = sy-repid
        is_layout_lvc      = gs_layout
        it_fieldcat_lvc    = gt_fcat
      TABLES
        t_outtab           = gt_sflight
      EXCEPTIONS
        program_error      = 1
        OTHERS             = 2.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS: p_scarr RADIOBUTTON GROUP rdb,
              p_spfli RADIOBUTTON GROUP rdb,
              p_sflgt RADIOBUTTON GROUP rdb.

SELECTION-SCREEN END OF BLOCK a1.

DATA: go_database TYPE REF TO lcl_show_alv.

START-OF-SELECTION.

  CREATE OBJECT go_database
    EXPORTING
      iv_scarr   = p_scarr
      iv_spfli   = p_spfli
      iv_sflight = p_sflgt.

  IF p_scarr IS NOT INITIAL.
    go_database->show_alv_scarr( ).

  ELSEIF p_spfli IS NOT INITIAL.
    go_database->show_alv_spfli( ).

  ELSEIF p_sflgt IS NOT INITIAL.
    go_database->show_alv_sflight( ).

  ENDIF.
