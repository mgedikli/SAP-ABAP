*&---------------------------------------------------------------------*
*& Report ZMG_TEST_50
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_50.

*Alıştırma -6: Yeni bir program oluşturun. 5 adet parametre tanımlayın. Parametreler yardımıyla
*kullanıcıdan “Alışveriş Yeri”, “Alınan Ürün”, “Ödenen Miktar”, “Ödeme Yapılan Para Birimi”, “Alışveriş
*Tarihi” ve “Alışveriş Saati” bilgilerini alin. Rapor içerisinde bu bilgilerin tamamını içerisinde tutabilecek
*bir structure (satir) oluşturun. Structure ile ayni yapıya sahip standard bir internal tablo oluşturun.
*Parametrelerdeki veriyi önce structure içine atin. Daha sonra DO_ENDDO komutu yardımıyla ayni satiri
*internal tablo içerisine 10 kere kaydedin (Append). LOOP-ENDLOOP kullanarak tablonun sadece çift
*satırlarını ekrana yazdırın. (Döngü içerisinde sy-tabix kontrol edilecek. Eger 1,3,5,7 veya 9 ise
*CONTINUE komutu ile devam edilip bir sonraki satir okunacak) (Parametreler için selection screen
*oluşturun ve başlığını tanımlayın).

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_ayeri  TYPE c LENGTH 30,
              p_urun   TYPE c LENGTH 10,
              p_miktar TYPE p DECIMALS 2,
              p_birim  TYPE c LENGTH 3,
              p_tarih  TYPE datum,
              p_saat   TYPE uzeit.
SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_structure,
         ayeri  TYPE c LENGTH 20,
         urun   TYPE c LENGTH 10,
         miktar TYPE p DECIMALS 2,
         birim  TYPE c LENGTH 3,
         tarih  TYPE datum,
         saat   TYPE uzeit,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE TABLE OF gty_structure.


START-OF-SELECTION.

  gs_structure-ayeri  = p_ayeri.
  gs_structure-urun   = p_urun.
  gs_structure-miktar = p_miktar.
  gs_structure-birim  = p_birim.
  gs_structure-tarih  = p_tarih.
  gs_structure-saat   = p_saat.

  DO 10 TIMES.
    APPEND gs_structure TO gt_table.

    gs_structure-tarih = gs_structure-tarih + 1.
    gs_structure-miktar = gs_structure-miktar + '0.50'.

  ENDDO.

  CLEAR: gs_structure.

  LOOP AT gt_table INTO gs_structure.

*    IF  sy-tabix = 1 or sy-tabix = 3 or sy-tabix = 5 or sy-tabix = 7 or sy-tabix = 9.

    IF sy-tabix MOD 2 = 1.

      CONTINUE.

    ELSE.

      WRITE: gs_structure-ayeri,
               gs_structure-urun,
               gs_structure-miktar,
               gs_structure-birim,
               gs_structure-tarih,
               gs_structure-saat.
      CLEAR: gs_structure.
      SKIP.

    ENDIF.

  ENDLOOP.
