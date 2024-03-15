*&---------------------------------------------------------------------*
*& Report ZMG_TEST_141
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_141.
*Class Constructor
PARAMETERS: p_scarr  RADIOBUTTON GROUP abc,
            p_spfli  RADIOBUTTON GROUP abc,
            p_sflght RADIOBUTTON GROUP abc.

START-OF-SELECTION.

  IF p_scarr IS NOT INITIAL.

    zflight_data_mod_static_mg1=>show_alv_scarr( ).

  ELSEIF p_spfli IS NOT INITIAL.

    zflight_data_mod_static_mg1=>show_alv_spfli( ).

  ELSE.

    zflight_data_mod_static_mg1=>show_alv_sflight( ).

  ENDIF.
