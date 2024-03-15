*&---------------------------------------------------------------------*
*& Report ZMG_TEST_21
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_21.

"Radiobutton ve Checkbox(gruplandırmaya gerek yok)

PARAMETERS: p_isim  TYPE c LENGTH 30,
            p_adres TYPE string,
            p_yas   TYPE n LENGTH 2,
            p_kilo  TYPE i,
            p_boy   TYPE p DECIMALS 2,
            p_dtar  TYPE datum,
            p_time  TYPE uzeit.
WRITE: p_isim,
          /  p_adres,
         /   p_yas,
         /   p_kilo,
         /   p_boy,
         /   p_dtar,
         /   p_time.
*************************************

PARAMETERS: p_rbd_01 RADIOBUTTON GROUP abc,
            p_rbd_02 RADIOBUTTON GROUP abc,
            p_rbd_03 RADIOBUTTON GROUP abc,
            p_rbd_04 RADIOBUTTON GROUP xyz,
            p_rbd_05 RADIOBUTTON GROUP xyz,
            p_rbd_06 RADIOBUTTON GROUP xyz,
            p_cbx_01 AS CHECKBOX,
            p_cbx_02 AS CHECKBOX,
            p_cbx_03 AS CHECKBOX.

*********************************************
*DATA: gv_sayi TYPE i.
*gv_sayi = 50.
*
*IF gv_sayi < 100.
*  WRITE: 'Girilen sayı 100''den küçüktür.'.
*ELSEIF gv_sayi = 100.
*  WRITE: 'Girilen sayı 100''e eşittir.'.
*ELSEIF gv_sayi > 100.
*  WRITE: 'Girilen sayı 100''den büyüktür.'.
*ENDIF.

*****************************************************

DATA: gv_num_01 TYPE n LENGTH 2 VALUE '22',
      gv_num_02 TYPE n LENGTH 2 VALUE '33',
      gv_deger TYPE p DECIMALS 2.

IF gv_num_01 = gv_num_02.
  gv_deger = gv_num_01 + gv_num_02.
  WRITE:'Toplama: ' ,gv_deger.
  ELSEIF gv_num_01 > gv_num_02.
    gv_deger = gv_num_01 - gv_num_02.
    WRITE:'Çıkarma :' ,gv_deger.
    ELSEIF gv_num_01 < gv_num_02.
      gv_deger = gv_num_02 / gv_num_01.
      WRITE:'Bölme :' ,gv_deger.
ENDIF.
