*&---------------------------------------------------------------------*
*& Report ZMG_TEST_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_11.
*Concatenate

"Birden fazla değişken içerisinde bulunan verinin
"birleştirilerek tek değişken içerisine kaydedilmesini sağlayan komuttur.

DATA : gv_mahalle TYPE string,
       gv_cadde   TYPE string,
       gv_no      TYPE string,
       gv_pk      TYPE string,
       gv_ilce    TYPE string,
       gv_il      TYPE string,
       gv_adres   TYPE string.

gv_mahalle = '     Mustafa     Kemal    Mahallesi'.
gv_cadde   = '    Cumhuriyet     Caddesi'.
gv_no      = '24/8'.
gv_pk      = '06400'.
gv_ilce    = 'Cankaya'.
gv_il      = 'Ankara'.

CONCATENATE gv_mahalle ',' gv_cadde ',' gv_no ',' gv_pk ',' gv_ilce ',' gv_il '.'
       INTO gv_adres RESPECTING BLANKS.

CONDENSE gv_mahalle NO-GAPS.

CONDENSE gv_cadde.
*
*CONCATENATE gv_mahalle ',' gv_cadde ',' gv_no ',' gv_pk ',' gv_ilce ',' gv_il '.'
*       INTO gv_adres.

WRITE: 'Adres:' , gv_adres.
