*&---------------------------------------------------------------------*
*& Report ZMG_TEST_262
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_262.
*Veri tipi tanımlama esnasında belirlenen field semboller s.324

DATA: gv_number TYPE i.

FIELD-SYMBOLS: <gv_sayi> TYPE i.


ASSIGN gv_number TO <gv_sayi>.

<gv_sayi> = 10.
WRITE: gv_number.

<gv_sayi> = 20.
WRITE: gv_number.

<gv_sayi> = 30.
WRITE: gv_number.

BREAK-POINT.
