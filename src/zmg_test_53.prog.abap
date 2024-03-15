*&---------------------------------------------------------------------*
*& Report ZMG_TEST_53
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_53.

*Alıştırma -9:
*Yeni bir program oluşturun. 1 adet parametre tanımlayın ve kullanıcıdan 1 “ilan No” alin.
*Program içerisinde bir satir tanımlayın. Satirin hücreleri sırasıyla “Ilan No”, “Kiralık”, “Satılık”, “Fiyat”,
*“Metrekare”, “Adres”, “Şehir” olsun. Bu satir ile ayni yapıya sahip bir internal tablo tanımlayın. Satiri
*kendi üreteceğiniz veriyle 10 kere doldurun ve her doldurmadan sonra Append komutu ile internal
*tabloya kaydedin. Daha sonra kullanıcıdan gelen ilan No hangi satıra karşılık geliyorsa o satirin kaçıncı
*satir olduğunu tespit edin ve sonrasında o satiri silin. Silinen satirin kaçıncı satir olduğunu ekrana
*yazdırın. Tablonun kalan satırlarını ekrana yazdırın. (Parametreler için selection screen oluşturun ve
*başlığını tanımlayın).

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

PARAMETERS: p_ilan TYPE n LENGTH 4.

SELECTION-SCREEN END OF BLOCK a1.

TYPES:  BEGIN OF gty_structure,
          ilan_no     TYPE n LENGTH 4,
          kiralik     TYPE c LENGTH 20,
          satilik     TYPE c LENGTH 20,
          fiyat       TYPE i,
          metrekare   TYPE p LENGTH 2,
          adres       TYPE string,
          sehir       TYPE c LENGTH 20,
        END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table TYPE TABLE OF gty_structure,
      gv_silinen_satir TYPE i.

START-OF-SELECTION.

gs_structure-ilan_no   = 5001.
gs_structure-kiralik   = 'İş yeri'.
gs_structure-satilik   = '......'.
gs_structure-fiyat     = 60000.
gs_structure-metrekare = 400.
gs_structure-adres     = 'Yenimahalle'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5002.
gs_structure-kiralik   = '........'.
gs_structure-satilik   = 'Daire'.
gs_structure-fiyat     = 6000000.
gs_structure-metrekare = 160.
gs_structure-adres     = 'Cankaya'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5003.
gs_structure-kiralik   = 'Dublex'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 20000.
gs_structure-metrekare = 500.
gs_structure-adres     = 'Ümitköy'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5004.
gs_structure-kiralik   = 'Daire'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 15000.
gs_structure-metrekare = 120.
gs_structure-adres     = 'Cukurambar'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5005.
gs_structure-kiralik   = '.......'.
gs_structure-satilik   = 'Daire'.
gs_structure-fiyat     = 8000000.
gs_structure-metrekare = 240.
gs_structure-adres     = 'Cukurambar'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5006.
gs_structure-kiralik   = 'Daire'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 18000.
gs_structure-metrekare = 140.
gs_structure-adres     = 'Dikmen'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5007.
gs_structure-kiralik   = '.......'.
gs_structure-satilik   = 'Daire'.
gs_structure-fiyat     = 8000000.
gs_structure-metrekare = 170.
gs_structure-adres     = 'Oran'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5008.
gs_structure-kiralik   = 'Daire'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 10000.
gs_structure-metrekare = 100.
gs_structure-adres     = 'Demetevler'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5009.
gs_structure-kiralik   = 'Daire'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 20000.
gs_structure-metrekare = 140.
gs_structure-adres     = 'Yenimahalle'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

gs_structure-ilan_no   = 5010.
gs_structure-kiralik   = 'Isyeri'.
gs_structure-satilik   = '.....'.
gs_structure-fiyat     = 50000.
gs_structure-metrekare = 300.
gs_structure-adres     = 'Ümitköy'.
gs_structure-sehir     = 'Ankara'.

APPEND gs_structure TO gt_table.
CLEAR: gs_structure.

LOOP AT  gt_table INTO gs_structure WHERE ilan_no = p_ilan.
    WRITE:gs_structure-ilan_no  ,
          gs_structure-kiralik  ,
          gs_structure-satilik  ,
          gs_structure-fiyat    ,
          gs_structure-metrekare,
          gs_structure-adres    ,
          gs_structure-sehir    .
    SKIP.
    ULINE.

DELETE gt_table WHERE ilan_no = p_ilan.

WRITE:Text-002, sy-tabix.
SKIP.
ULINE.
ENDLOOP.


LOOP AT  gt_table INTO gs_structure.
    WRITE:gs_structure-ilan_no  ,
          gs_structure-kiralik  ,
          gs_structure-satilik  ,
          gs_structure-fiyat    ,
          gs_structure-metrekare,
          gs_structure-adres    ,
          gs_structure-sehir    .
    SKIP.
    ULINE.
ENDLOOP.
