*&---------------------------------------------------------------------*
*& Report ZMG_TEST_311
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_311.
*ABAP-7.40 Yenilikler/ Value Komutu 3  => SE11 Str. Tanimlayarak
*SE11-> Satir Yapisi 310'daki gty_table ile ayni olan Structure Tanimla -> ZMG_S_STR
*SE11-> ZMG_TT_TABLETYPE olustur. (Satir yapisi ZMG_S_STR).

DATA: gs_str TYPE zmg_s_str.

START-OF-SELECTION.

  "Abap 7.40 Öncesi.
  gs_str-id      = '00001'.
  gs_str-name    = 'Mehmet'.
  gs_str-surname = 'Öztürk'.
  gs_str-address = 'Mehmet Pasa Mh, Ince Sk, 4/5'.
*  APPEND gs_str TO gt_table.
  CLEAR: gs_str.

  "Abap 7.40 sonrasi:
  gs_str = VALUE #( id = '00002'
                    name = 'Ahmet'
                    surname = 'Yilmaz'
                    address = 'Dalaman Mh, Gonca Sk, 4/5' ).

  DATA(gs_str_new) = VALUE zmg_s_str( id = '00003'
                                      name = 'Ali'
                                      surname = 'Nar'
                                      address = 'Gazi Mh, Ince Sk, 4/5' ).


  DATA(gt_table) = VALUE zmg_tt_tabletype( ( id = '00003' name = 'Selim'   surname = 'Balta' address  = 'Cicek Mh, Bugday Sk, 8/9' )
                                           ( id = '00004' name = 'Aysenur' surname = 'Has'    address = 'Cankiri Mh, 1024 Sk, 10/4' )
                                           ( id = '00005' name = 'Murat'   surname = 'Gül'   address  = 'Uzunyol Mh, 1065 Sk, 15/1' )
                                           ( id = '00006' name = 'Ahmet'   surname = 'Pala'   address = 'Kale Mh, Cemre Sk, 20/2' ) ).


  BREAK-POINT.
