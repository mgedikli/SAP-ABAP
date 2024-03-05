*&---------------------------------------------------------------------*
*& Report ZABAP_MG_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MG_004.

data: gv_num1 type n LENGTH 2,
      gv_num2 type n LENGTH 2.

gv_num1 = 50.

IF gv_num1 > 50.
  gv_num2 = gv_num1 + 10.

  write: 'gv_num2' , gv_num2.
  MESSAGE ' islem basarili' type 'I'.
  ELSE.
    MESSAGE 'islem basarisiz' type 'E'.


ENDIF.
