*&---------------------------------------------------------------------*
*& Report ZALTERNATIF_MG_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalternatif_mg_01.
*Alternatif GUI STATUS Olusturma
START-OF-SELECTION.
  CALL SCREEN 0100.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS '0100'.
 SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
data: lv_text TYPE char200.

CONCATENATE sy-ucomm
            'butonuna basilmistir.'
            INTO lv_text
            SEPARATED BY space.
            message lv_text TYPE 'I'.

CASE sy-ucomm.
  WHEN 'BACK' or 'EXIT' or 'CANCEL'.
    LEAVE PROGRAM.
*	WHEN .
*	WHEN OTHERS.
ENDCASE.
ENDMODULE.
