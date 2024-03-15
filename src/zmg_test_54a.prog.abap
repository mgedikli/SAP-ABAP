*&---------------------------------------------------------------------*
*& Report ZMG_TEST_54A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_54a.

*Alıştırma -10: Yeni bir program oluşturun. 1 adet parametre tanımlayın ve kullanıcıdan bir “ilan No”
*alin. Program içerisinde bir satir tanımlayın. Satirin hücreleri sırasıyla “ilan No”, “Kiralık”, “Satılık”,
*“Fiyat”, “Metrekare”, “Adres”, “Şehir” olsun. Bu satir ile ayni yapıya sahip bir internal tablo tanımlayın.
*Satiri kendi üreteceğiniz veriyle 10 kere doldurun ve her doldurmadan sonra Append komutu ile
*internal tabloya kaydedin. Daha sonra kullanıcıdan gelen ilan No hangi satıra karşılık geliyorsa o satiri
*ekrana yazdırın, Daha sonra fiyat bilgisini 5.000 arttırın ve internal tabloyu güncelleyin. Güncellenen
*satirin tablo içerisinde kaçıncı satir olduğunu ekrana yazın. Son olarak güncellenmiş satiri ekrana yazın.
*(Parametreler için selection screen oluşturun ve başlığını tanımlayın).

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_ilan TYPE n LENGTH 3.
SELECTION-SCREEN END OF BLOCK a1.

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
      gt_table     TYPE TABLE OF gty_structure.

gs_structure-ilan_no    = '101'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '102'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '103'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '104'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '105'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '106'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '107'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '108'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '109'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

gs_structure-ilan_no    = '110'.
gs_structure-kiralik    = 'X'.
gs_structure-satilik    = space.
gs_structure-fiyat      = 100000.
gs_structure-metrekare  = 120.
gs_structure-adres      = 'Merkez1'.
gs_structure-sehir      = 'Adiyaman'.

APPEND gs_structure TO gt_table.
CLEAR gs_structure.

LOOP AT gt_table INTO gs_structure WHERE ilan_no = p_ilan.

  gs_structure-fiyat = gs_structure-fiyat + 25000.
  MODIFY gt_table FROM gs_structure INDEX sy-tabix.

  WRITE: TEXT-002, sy-tabix.
  SKIP.
  ULINE.

  WRITE: / gs_structure-ilan_no     ,
     / gs_structure-kiralik       ,
     / gs_structure-satilik       ,
     /(7) gs_structure-fiyat      ,
     /(3) gs_structure-metrekare  ,
     / gs_structure-adres         ,
     / gs_structure-sehir         .
  CLEAR gs_structure.
  SKIP.
  ULINE.

ENDLOOP.
