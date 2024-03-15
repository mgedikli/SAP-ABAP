*&---------------------------------------------------------------------*
*& Report ZMG_TEST_310
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_310.
**ABAP-7.40'la gelen yenilikler: Value Komutu: 1.Vers.
*
*TYPES: BEGIN OF gty_table,
*         id      TYPE n LENGTH 6,
*         name    TYPE c LENGTH 20,
*         surname TYPE c LENGTH 20,
*         address TYPE c LENGTH 50,
*       END OF gty_table.
*
**TYPES: gtt_table TYPE TABLE OF gty_table.
*
*DATA: gs_str   TYPE gty_table,
*      gt_table TYPE TABLE OF gty_table.
*
*START-OF-SELECTION.
*
**  Abap 7.40 Öncesi.
*  gs_str-id      = '00001'.
*  gs_str-name    = 'Mehmet'.
*  gs_str-surname = 'Öztürk'.
*  gs_str-address = 'Mehmet Pasa Mh, Ince Sk, 4/5'.
*  APPEND gs_str TO gt_table.
*  CLEAR: gs_str.
*
*  "Abap 7.40 sonrasi:Aynı anda birden fazla satırı Tabloya atabiliyoruz.
*  gs_str = VALUE #( id      = '00002'
*                    name    = 'Ahmet'
*                    surname = 'Yilmaz'
*                    address = 'Yilmaz Pasa Mh, Ince Sk, 4/5' ).
*
*  DATA(gs_str_new) = VALUE gty_table( id      = '00003'
*                                      name    = 'Ali'
*                                      surname = 'Sazak'
*                                      address = 'Sancak Mh, Hale Sk, 44/2' ).
*
*
*                gt_table = VALUE #( ( id = '00004' name = 'Selim'   surname = 'Balta' address   = 'Cicek Mh, Bugday Sk, 8/9' )
**  DATA(gt_table) = VALUE gtt_table( ( id = '00004' name = 'Selim'   surname = 'Balta' address   = 'Cicek Mh, Bugday Sk, 8/9' ) "2. versiyon:InDec + Value
*                                    ( id = '00005' name = 'Aysenur' surname = 'Has'    address  = 'Cankiri Mh, 1024 Sk, 10/4' )
*                                    ( id = '00006' name = 'Murat'   surname = 'Gül'   address   = 'Uzunyol Mh, 1065 Sk, 15/1' )
*                                    ( id = '00007' name = 'Ahmet'   surname = 'Pala'   address  = 'Kale Mh, Cemre Sk, 20/2' ) ).
*
*
*  BREAK-POINT.

*******************************************************************************************************
*******************************************************************************************************
*ABAP-7.40'la gelen yenilikler: Value Komutu
*Simdi; Structure'daki gibi Int Table'da da hem Inline Decleration ve hem de Value kullanarak kayit ekleyelim:

TYPES: BEGIN OF gty_table,
         id      TYPE n LENGTH 6,
         name    TYPE c LENGTH 20,
         surname TYPE c LENGTH 20,
         address TYPE c LENGTH 50,
       END OF gty_table.

TYPES: gtt_table TYPE TABLE OF gty_table WITH NON-UNIQUE KEY address.  "WITH NON-UNIQUE KEY address. ibaresi ekleyerek
                                                                       "DATA(gt_table) = VALUE gtt_table( (" da hata vermesi önlenir.
DATA: gs_str   TYPE gty_table.
*      gt_table TYPE TABLE OF gty_table. "1.Versiyon

START-OF-SELECTION.

  "Abap 7.40 Öncesi.
  gs_str-id      = '00001'.
  gs_str-name    = 'Mehmet'.
  gs_str-surname = 'Öztürk'.
  gs_str-address = 'Mehmet Pasa Mh, Ince Sk, 4/5'.
*  APPEND gs_str TO gt_table.
  CLEAR: gs_str.

  "Abap 7.40 sonrasi:Aynı anda birden fazla satırı Tabloya atabiliyoruz.
  gs_str = VALUE #( id      = '00002'
                    name    = 'Ahmet'
                    surname = 'Yilmaz'
                    address = 'Yilmaz Pasa Mh, Ince Sk, 4/5' ).

  DATA(gs_str_new) = VALUE gty_table( id      = '00003'
                                      name    = 'Ali'
                                      surname = 'Sazak'
                                      address = 'Sancak Mh, Hale Sk, 44/2' ).


*  gt_table = VALUE #( ( id = '000004' name = 'Selim'   surname = 'Balta' address = 'Cicek Mh, Bugday Sk, 8/9' ) "1.Versiyon
  DATA(gt_table) = VALUE gtt_table( ( id = '000004' name = 'Selim'   surname = 'Balta' address  = 'Cicek Mh, Bugday Sk, 8/9' )
                                    ( id = '000005' name = 'Aysenur' surname = 'Has'    address = 'Cankiri Mh, 1024 Sk, 10/4' )
                                    ( id = '000006' name = 'Murat'   surname = 'Gül'   address  = 'Uzunyol Mh, 1065 Sk, 15/1' )
                                    ( id = '000007' name = 'Ahmet'   surname = 'Pala'   address = 'Kale Mh, Cemre Sk, 20/2' ) ).


  BREAK-POINT.
