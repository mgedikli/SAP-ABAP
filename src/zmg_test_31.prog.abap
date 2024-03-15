*&---------------------------------------------------------------------*
*& Report ZMG_TEST_31
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_31.

"Selection screen

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS : p_name  TYPE c LENGTH 20,
               p_sname TYPE c LENGTH 20.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002 NO INTERVALS.

  PARAMETERS : p_rb_up  RADIOBUTTON GROUP abc,
               p_rb_low RADIOBUTTON GROUP abc,
               p_cbx_in AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK a2.

DATA : gv_fullname TYPE string.

CONCATENATE p_name p_sname INTO gv_fullname SEPARATED BY space.

IF p_rb_up = abap_true. "Alternatif--> p_rb_up = 'X' veya p_rb_up = is not initial
  TRANSLATE gv_fullname TO UPPER CASE.
ELSEIF p_rb_low = abap_true.
  TRANSLATE gv_fullname TO LOWER CASE.
ENDIF.

IF p_cbx_in = abap_true.
  MESSAGE gv_fullname TYPE 'I'.
ELSE.
  WRITE : gv_fullname.
ENDIF.
