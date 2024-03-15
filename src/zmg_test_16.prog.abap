*&---------------------------------------------------------------------*
*& Report ZMG_TEST_16
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_16.
"Strlen Komutu

DATA: gv_text_01 TYPE string,
      gv_int TYPE i.

gv_text_01 = 'Bugun alisveris yapmam gerekiyor.'.

gv_int = strlen( gv_text_01 ).

WRITE: 'Text icerisinde', gv_int, 'tane karakter bulunuyor.'.
