*&---------------------------------------------------------------------*
*& Report ZMG_TEST_348
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_348.
*TYPES: BEGIN OF gty_table,
*         ders_adi      TYPE string,
*         ders_notu     TYPE i,
*         basari_durumu TYPE string,
*       END OF gty_table.
*
*DATA: gt_table TYPE TABLE OF gty_table.
*
*START-OF-SELECTION.
*  APPEND INITIAL LINE TO gt_table ASSIGNING FIELD-SYMBOL(<fs_str>).
*  <fs_str>-ders_adi = 'Matematik'.
*  <fs_str>-ders_notu = '80'.
*
*  APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
*  <fs_str>-ders_adi = 'Kimya'.
*  <fs_str>-ders_notu = '90'.
*
*  APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
*  <fs_str>-ders_adi = 'Almanca'.
*  <fs_str>-ders_notu = '70'.
*
*  LOOP AT gt_table ASSIGNING <fs_str>.
*    <fs_str>-basari_durumu = COND #( WHEN <fs_str>-ders_notu = '70'  THEN 3
*                                     WHEN <fs_str>-ders_notu = '80'  THEN 4
*                                     WHEN <fs_str>-ders_notu = '90'  THEN 5 ).
*
*    WRITE: / <fs_str>-ders_adi, <fs_str>-ders_notu, <fs_str>-basari_durumu.
*
*  ENDLOOP.
*
*  BREAK-POINT.
*********************************************************************************
*********************************************************************************

*Alıştırma – 11:
*Yeni bir rapor oluşturun ve içerisinde 3 kolonlu yeni bir internal tablo tanımlayın.
*Tablonun kolonları DERS_ADI, DERS_NOTU ve BASARI_DURUMU olsun. Internal tabloya 3 adet yeni
*satir ekleyin. Tabloda loop edin ve BASARI_DURUMU hücresini CON WHEN THEN ELSE komutu
*kullanarak doldurun.

TYPES: BEGIN OF gty_table,
         ders_adi      TYPE c LENGTH 15,
         ders_notu     TYPE n LENGTH 3,
         basari_durumu TYPE c LENGTH 10,
       END OF gty_table.

TYPES: gtt_table TYPE TABLE OF gty_table WITH NON-UNIQUE KEY ders_adi.

START-OF-SELECTION.

DATA(gt_table) = VALUE gtt_table( ( ders_adi  = 'Matematik'
                                    ders_notu = '90' )
                                  ( ders_adi  = 'Fen Bilgisi'
                                    ders_notu = '40' )
                                  ( ders_adi  = 'Sosyal Bilgiler'
                                    ders_notu = '70' ) ).

LOOP AT gt_table INTO DATA(gs_table).

  gs_table-basari_durumu = COND #( WHEN gs_table-ders_notu BETWEEN 0  AND 49 THEN 'D'
                                   WHEN gs_table-ders_notu BETWEEN 50 AND 60 THEN 'C'
                                   WHEN gs_table-ders_notu BETWEEN 61 AND 75 THEN 'B'
                                   ELSE 'A' ).
  MODIFY gt_table FROM gs_table.

ENDLOOP.

***********************************************************************************

*" 2. Yol
*
*APPEND INITIAL LINE TO gt_table ASSIGNING FIELD-SYMBOL(<fs_str>).
*<fs_str>-ders_adi  = 'Fizik'.
*<fs_str>-ders_notu = '75'.
*
*APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
*<fs_str>-ders_adi  = 'Kimya'.
*<fs_str>-ders_notu = '35'.
*
*APPEND INITIAL LINE TO gt_table ASSIGNING <fs_str>.
*<fs_str>-ders_adi  = 'Biyoloji'.
*<fs_str>-ders_notu = '55'.
*
*LOOP AT gt_table ASSIGNING <fs_str>.
*
*  <fs_str>-basari_durumu = COND #( WHEN <fs_str>-ders_notu BETWEEN 0  AND 49 THEN 'D'
*                                   WHEN <fs_str>-ders_notu BETWEEN 50 AND 60 THEN 'C'
*                                   WHEN <fs_str>-ders_notu BETWEEN 61 AND 75 THEN 'B'
*                                   ELSE 'A' ).
*ENDLOOP.
*
*BREAK-POINT.
*
