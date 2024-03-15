*&---------------------------------------------------------------------*
*& Report ZMG_TEST_56A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_56a.

*Alıştırma-12:
*Yeni bir program oluşturun. Program içerisinde bir satir tanımlayın. Satirin hücreleri
*sırasıyla “İlan No”, “Kiralık”, “Satılık”, “Fiyat”, “Metrekare”, “Adres”, “Şehir” olsun. Bu satir ile ayni
*yapıya sahip bir SORTED internal tablo tanımlayın ve ID alanını unique key olarak belirleyin. Satiri kendi
*üreteceğiniz veriyle 10 kere doldurun ve her doldurmadan sonra Insert komutu ile internal tabloya
*kaydedin. (Internal tabloyu doldururken ID sırasını rastgele belirleyelim ve Sorted internal tablonun
*mantığını görelim.) Tablonun satırlarını ekrana yazdırın.

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
*
*  PARAMETERS: p_ilan  TYPE n LENGTH 3,
*              p_artis TYPE n LENGTH 3.
*SELECTION-SCREEN END OF BLOCK a1.
*
TYPES: BEGIN OF gty_structure,
         ilan_no   TYPE n LENGTH 3,
         kiralik   TYPE c LENGTH 10,
         satilik   TYPE c LENGTH 10,
         fiyat     TYPE i,
         metrekare TYPE i,
         adres     TYPE c LENGTH 30,
         sehir     TYPE c LENGTH 20,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE SORTED TABLE OF gty_structure WITH UNIQUE KEY ilan_no.

gs_structure-ilan_no    = '104'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '108'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '106'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '101'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '105'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '103'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '109'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '102'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '107'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '110'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

INSERT gs_structure INTO TABLE gt_table.
CLEAR gs_structure.

LOOP AT gt_table INTO gs_structure.

  WRITE: / gs_structure-ilan_no   ,
     / gs_structure-kiralik       ,
     / gs_structure-satilik       ,
     /(7) gs_structure-fiyat      ,
     /(3) gs_structure-metrekare  ,
     / gs_structure-adres         ,
     / gs_structure-sehir         .
  SKIP.
  ULINE.

ENDLOOP.
