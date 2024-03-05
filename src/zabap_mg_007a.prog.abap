*&---------------------------------------------------------------------*
*& Report ZABAP_MG_007A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MG_007A.
*Perform_include ( Hesap Makinesi)

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_num1  TYPE i,
              p_num2  TYPE i,
              p_topla RADIOBUTTON GROUP xyz,
              p_cikar RADIOBUTTON GROUP xyz,
              p_carp  RADIOBUTTON GROUP xyz,
              p_bol   RADIOBUTTON GROUP xyz.

SELECTION-SCREEN END OF BLOCK a1.

DATA: gv_sonuc TYPE p DECIMALS 2.

START-OF-SELECTION.


  IF p_topla = abap_true.
    PERFORM topla.

  ELSEIF p_cikar = abap_true.
    PERFORM cikar.

  ELSEIF p_carp = abap_true.
    PERFORM carp.

  ELSEIF p_bol = abap_true.
    PERFORM bol.

  ENDIF.

WRITE: / 'SONUC :', gv_sonuc.

FORM topla .
  gv_sonuc = p_num1 + p_num2.
ENDFORM.

FORM cikar .
  gv_sonuc = p_num1 - p_num2.
ENDFORM.


FORM carp .
  gv_sonuc = p_num1 * p_num2.
ENDFORM.

FORM bol .

  IF p_num2 NE 0.
    gv_sonuc = p_num1 / p_num2.
  ELSE.
    MESSAGE: 'Bolen Sayi Sifir Olamaz' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.
