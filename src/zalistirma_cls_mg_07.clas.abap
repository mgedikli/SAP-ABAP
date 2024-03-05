class ZALISTIRMA_CLS_MG_07 definition
  public
  final
  create public .

public section.

  data GT_SCARR type ZCM_TT_SCARR .
  data GT_SPFLI type ZCM_TT_SPFLI .
  data GT_SFLIGHT type ZCM_TT_SFLIGHT .
  data GT_FCAT type LVC_T_FCAT .
  data GS_LAYOUT type LVC_S_LAYO .

  methods CONSTRUCTOR
    importing
      !IV_SCARR type CHAR1
      !IV_SPFLI type CHAR1
      !IV_SFLIGHT type CHAR1 .
  methods SHOW_ALV_SCARR .
  methods SHOW_ALV_SPFLI .
  methods SHOW_ALV_SFLIGHT .
protected section.
private section.
ENDCLASS.



CLASS ZALISTIRMA_CLS_MG_07 IMPLEMENTATION.


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
ENDCLASS.
