*&---------------------------------------------------------------------*
*& Report ZMG_TEST_67
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_67.

*Alıştırma – 11:
*SE11 işlem kodu ile bir SCARR tablosunu ile ayni satir yapısına sahip yeni bir database
*tablosu tanımlayın. (SCARR tablosundaki data elementler kullanılabilir) yeni bir program oluşturun.
*Program içerisinde öncelikle SCARR tablosundan bütün satırları okuyun. Okunan satırların tamamına
*yeni oluşturduğunuz tablonun içine kaydedin. (Insert)

*DATA: gs_scarr TYPE scarr,          "ZMK_TABLE_SCARR da kullanılabilir.
*      gt_scarr TYPE TABLE OF scarr.
*
*SELECT * FROM scarr INTO TABLE gt_scarr.
*
*LOOP AT gt_scarr INTO gs_scarr.
* INSERT ZMK_TABLE_SCARR FROM gs_scarr.
*ENDLOOP.


******************************************************************************************


*Alıştırma – 12:
*SE11 işlem kodu ile bir SPFLI tablosunu ile ayni satir yapısına sahip yeni bir database
*tablosu tanımlayın. (SPFLI tablosundaki data elementler kullanılabilir) yeni bir program oluşturun.
*Program içerisinde öncelikle SPFLI tablosundan bütün satırları okuyun. Okunan satırların tamamına
*yeni oluşturduğunuz tablonun içine kaydedin. (Insert)

*DATA: gs_spfli TYPE spfli,
*      gt_spfli TYPE TABLE OF spfli.
*
*SELECT * FROM spfli INTO TABLE gt_spfli.
*
*LOOP AT gt_spfli INTO gs_spfli.
*  INSERT ZMK_TABLE_SPFLI FROM gs_spfli.
*
*ENDLOOP.

******************************************************************************************

*Alıştırma – 13:
*SE11 işlem kodu ile bir SFLIGHT tablosunu ile ayni satir yapısına sahip yeni bir database
*tablosu tanımlayın. (SFLIGHT tablosundaki data elementler kullanılabilir) yeni bir program oluşturun.
*Program içerisinde öncelikle SFLIGHT tablosundan bütün satırları okuyun. Okunan satırların tamamına
*yeni oluşturduğunuz tablonun içine kaydedin. (Insert)

*DATA: gs_sflight TYPE sflight,
*      gt_sflight TYPE TABLE OF sflight.
*
*SELECT * FROM sflight INTO TABLE gt_sflight.
*
*LOOP AT gt_sflight INTO gs_sflight.
*  INSERT ZMK_TABLE_SFLIGH FROM gs_sflight.
*ENDLOOP.

*******************************************************************************************

*Alıştırma – 14:
*Yeni bir rapor oluşturun. Rapor içerisinde 2 adet parametre tanımlayın. Kullanıcıdan bir
*uçuş şirketi bilgisi (carrid) ve yeni bir Currency alin. Kendi oluşturduğunuz ve SCARR ile ayni satir
*yapısına sahip olan database tablosunda kullanıcının girdiği uçuş şirketi ile ayni uçuş şirketi bilgisine
*sahip olan satırların “Currency” kolonlarını TL ile değiştirin. (Set-Update).

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-006 NO INTERVALS.
*  PARAMETERS: p_carrid TYPE S_CARR_ID,
*              p_curr   TYPE S_CURRCODE OBLIGATORY.
*SELECTION-SCREEN END OF BLOCK a1.
*
*START-OF-SELECTION.
*
*UPDATE ZMK_TABLE_SCARR SET ZMK_CURRCODE = p_curr WHERE ZMK_CARRID = p_carrid.
*
*IF p_curr IS INITIAL.
*  MESSAGE TEXT-007 TYPE 'S' DISPLAY LIKE 'E'.
*  EXIT.
*ENDIF.
*
*IF sy-subrc IS INITIAL.
*  MESSAGE TEXT-008 TYPE 'S'.
*ELSE.
*  MESSAGE TEXT-009 TYPE 'S' DISPLAY LIKE 'E'.
*ENDIF.
