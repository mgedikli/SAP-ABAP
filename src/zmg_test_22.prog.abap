*&---------------------------------------------------------------------*
*& Report ZMG_TEST_22
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_22.

"IF ENDIF Komutu

IF sy-subrc = 0. "Koşulu sağlıyorsa

ENDIF.


DATA : gv_integer TYPE i.

gv_integer = 110.

IF gv_integer < 100.
  WRITE : / 'Girilen sayi 100''den kücüktür.'.
  SKIP.

ELSEIF  gv_integer = 100.
  WRITE : / 'Girilen sayi 100''e eşittir.'.
  SKIP.

ELSEIF  gv_integer > 100.
  WRITE : / 'Girilen sayi 100''den büyüktür.'.
  SKIP.

ENDIF.


DATA : gv_number_01 TYPE n LENGTH 3,
       gv_number_02 TYPE n LENGTH 3.

gv_number_01 = 20.
gv_number_02 = 30.

IF gv_number_01 = gv_number_02 .

  WRITE : / 'gv_number_01 sayisi gv_number_02 sayisina eşittir.'.
  SKIP.

ELSE.
  WRITE : / 'gv_number_01 sayisi gv_number_02 sayisina eşit değildir.'.
  SKIP.

ENDIF.


IF gv_number_01 = gv_number_02 .

  WRITE : / 'gv_number_01 sayisi gv_number_02 sayisina eşittir.'.
  SKIP.

ELSEIF gv_number_01 > gv_number_02.

  WRITE : / 'gv_number_01 sayisi gv_number_02 sayisindan büyüktür.'.
  SKIP.

ELSE.
  WRITE: / 'gv_number_01 sayisi gv_number_02 sayisindan kücüktür.'.
  SKIP.

ENDIF.

*************************************************************************************************************************
*If endif komutu

*DATA: gv_integer TYPE i.

gv_integer = 100.

IF gv_integer < 100.
  WRITE: / 'Girilen sayi 100''den kücüktür. '.
  SKIP.

ELSEIF gv_integer = 100.
  WRITE: / 'Girilen sayi 100''e esittir.'.
  SKIP.

ELSEIF gv_integer > 100.
  WRITE: / 'Girilen sayi 100''den büyüktür.'.
ENDIF.
