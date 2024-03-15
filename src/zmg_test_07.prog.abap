*&---------------------------------------------------------------------*
*& Report ZMG_TEST_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_07.

DATA: gv_string TYPE string,
      gv_char TYPE c LENGTH 5.



gv_string = 'RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR'.

WRITE: / gv_string.
