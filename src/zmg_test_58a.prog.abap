*&---------------------------------------------------------------------*
*& Report ZMG_TEST_58A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_58a.

*IF, CASE, WHEN, DO ANDDO, WHILE

*data gv_degs1 TYPE i.
*data gv_degs2 TYPE n LENGTH 10.
*
DATA: gv_degs1 TYPE i,
      gv_degs2 TYPE n LENGTH 10,
      gv_sonuc TYPE i,
      gv_metin TYPE string.

gv_degs1 = 0.
gv_degs2 = 60.

*write gv_degs1.
*write / gv_degs2.

*gv_metin = 'Toplami = '.
*gv_sonuc = gv_degs1 + gv_degs2.
*WRITE: 'Toplami = ',  gv_sonuc.
*
*gv_sonuc = gv_degs1 - gv_degs2.
*WRITE: / 'Farki = ', gv_sonuc.
*
*gv_sonuc = gv_degs1 * gv_degs2.
*WRITE: / 'Carpimi = ', gv_sonuc.
*
*gv_sonuc = gv_degs1 / gv_degs2.
*WRITE: / 'Bölümü = ', gv_sonuc.


*KOSUL ifadeleri:
**********************************************
*IF KOSULU
**********
*IF gv_degs1 > gv_degs2.
*  write: 'Birinci sayi büyüktür.'.
*ENDIF.
*
*IF gv_degs1 < gv_degs2.
*  write: 'ikinci sayi büyüktür.'.
*ENDIF.
*
*IF gv_degs1 = gv_degs2.
*  write: 'iki sayi esittir.'.
*ENDIF.

*IF gv_degs1 > gv_degs2.
*  write: 'Birinci sayi büyüktür.'.
*
*  ELSEIF gv_degs1 < gv_degs2.
*  write: 'ikinci sayi büyüktür.'.
*
*  ELSE.
*  write: 'iki sayi esittir.'.
*
*ENDIF.

*IF  gv_degs1 = 1.
*  write 'Degisken degerim 1.'.
*  ELSEIF gv_degs1 = 2.
*    write 'Degisken degerim 2.'.
*
*    ELSEIF gv_degs1 = 3.
*    write 'Degisken degerim 3.'.
*
*  ELSEIF gv_degs1 = 4.
*    write 'Degisken degerim 4.'.
*
*  ELSEIF gv_degs1 = 4.
*    write 'Degisken degerim 4.'.
*
*  ELSEIF gv_degs1 = 5.
*    write 'Degisken degerim 5.'.
*
*  ELSEIF gv_degs1 = 6.
*    write 'Degisken degerim 6.'.
*
*  ELSEIF gv_degs1 = 7.
*    write 'Degisken degerim 7.'.
*
*     ELSE.
*       write 'Hicbir degere esit degildir!'.
*
*ENDIF.

*CASE KOSULU
************
*CASE  gv_degs1.
*  WHEN 1 .
*    WRITE 'Degisken degerim 1.'.
*  WHEN 2.
*    WRITE 'Degisken degerim 2.'.
*  WHEN 3.
*    WRITE 'Degisken degerim 3.'.
*  WHEN 4.
*    WRITE 'Degisken degerim 4.'.
*  WHEN 5.
*    WRITE 'Degisken degerim 5.'.
*  WHEN 6.
*    WRITE 'Degisken degerim 6.'.
*  WHEN 7.
*    WRITE 'Degisken degerim 7.'.
*  WHEN OTHERS.
*    WRITE 'Hicbir degere esit degildir!'.
*ENDCASE.

********************************************************
*DÖNGÜLER
*********
*DO 10 TIMES.
*  gv_degs1 = gv_degs1 + 1.
*  WRITE: / gv_degs1, 'Do döngüsünü ögreniyorum!'.
*ENDDO.

*WHILE DÖNGÜSÜ
**************

WHILE gv_degs1 < 10.
gv_degs1 = gv_degs1 + 1.
write: / gv_degs1, 'While döngüsünü ögreniyorum!'.
ENDWHILE.
