*&---------------------------------------------------------------------*
*& Report ZMG_TEST_215
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_215.
*Alıştırma – 1: Yeni bir rapor oluşturun ve kullanıcıdan tek bir hücre içerisinde adını ve soy adını alın.
*Ayrıca 2 adet parametre oluşturun. Parametreler “Yukarıdan Aşağıya” ve “Sağdan Sola” olsun. Rapor
*içerisinde kullanıcının adını ve soy adını alt alta veya sağdan sola olacak şekilde yazdırın.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_adsad  TYPE c LENGTH 30,
              p_yukas  RADIOBUTTON GROUP abc,
              p_sagsol RADIOBUTTON GROUP abc.
SELECTION-SCREEN END OF BLOCK a1.

DATA: gv_uzunluk_sayisi TYPE i,
      gv_tek_karakter   TYPE c LENGTH 1,
      gv_sayi           TYPE i.

START-OF-SELECTION.

  gv_uzunluk_sayisi = strlen( p_adsad ).

  IF p_yukas = abap_true.

    DO gv_uzunluk_sayisi TIMES.
      gv_tek_karakter = p_adsad+gv_sayi(1).
      IF gv_tek_karakter IS INITIAL.
        SKIP.
      ELSE.
        WRITE: / gv_tek_karakter.
      ENDIF.

      gv_sayi = gv_sayi + 1.   "ofset kullanimi ile harfleri tek tek soldan saga ayirdik.

    ENDDO.
  ELSE.

    gv_sayi = gv_uzunluk_sayisi - 1.

    DO gv_uzunluk_sayisi TIMES.
      gv_tek_karakter = p_adsad+gv_sayi(1).
      WRITE: gv_tek_karakter NO-GAP.
      gv_sayi = gv_sayi - 1.    "ofset kullanimi ile harfleri tek tek sagdan sola ayirdik.

    ENDDO.
  ENDIF.
