*&---------------------------------------------------------------------*
*& Report ZMG_TEST_53B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_53b.

"ZMG_STRUCTURE_002

DATA: gs_structure TYPE zmg_structure_002,
      gt_table     TYPE TABLE OF zmg_structure_002.

START-OF-SELECTION.

  gs_structure-id          = '20230001'.
  gs_structure-isim        = 'ALI'.
  gs_structure-soyisim     = 'BAS'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'MÜHENDIS'.
  gs_structure-gorevi      = 'SUBE MÜDÜRÜ'.
  gs_structure-maasi       = 5000.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230002'.
  gs_structure-isim        = 'VELI'.
  gs_structure-soyisim     = 'TAS'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'DEVELOPER'.
  gs_structure-gorevi      = 'DEVELOPER'.
  gs_structure-maasi       = 4000.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230003'.
  gs_structure-isim        = 'AYLA'.
  gs_structure-soyisim     = 'CICEK'.
  gs_structure-cinsiyet    = 'K'.
  gs_structure-meslegi     = 'AVUKAT'.
  gs_structure-gorevi      = 'AVUKAT'.
  gs_structure-maasi       = 4500.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230004'.
  gs_structure-isim        = 'SADI'.
  gs_structure-soyisim     = 'CELIK'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'MUHASEBECI'.
  gs_structure-gorevi      = 'MUHASEBECI'.
  gs_structure-maasi       = 3000.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230005'.
  gs_structure-isim        = 'ARIF'.
  gs_structure-soyisim     = 'BAL'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'SATIS ELEMANI'.
  gs_structure-gorevi      = 'SATIS ELEMANI'.
  gs_structure-maasi       = 2500.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230006'.
  gs_structure-isim        = 'NERIMAN'.
  gs_structure-soyisim     = 'GÜL'.
  gs_structure-cinsiyet    = 'K'.
  gs_structure-meslegi     = 'ILETISIM UZMANI'.
  gs_structure-gorevi      = 'SEKRETER'.
  gs_structure-maasi       = 2500.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230007'.
  gs_structure-isim        = 'CANSU'.
  gs_structure-soyisim     = 'SAY'.
  gs_structure-cinsiyet    = 'K'.
  gs_structure-meslegi     = 'HALKLA ILISKILER UZMANI'.
  gs_structure-gorevi      = 'BÜRO CALISANI'.
  gs_structure-maasi       = 2500.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230008'.
  gs_structure-isim        = 'HASAN'.
  gs_structure-soyisim     = 'ALA'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'MUHASEBECI'.
  gs_structure-gorevi      = 'BÜRO AMIRI'.
  gs_structure-maasi       = 4000.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230009'.
  gs_structure-isim        = 'EDA'.
  gs_structure-soyisim     = 'KAYA'.
  gs_structure-cinsiyet    = 'K'.
  gs_structure-meslegi     = 'HALKLA ILISKILER UZMANI'.
  gs_structure-gorevi      = 'BÜRO AMIRI'.
  gs_structure-maasi       = 5000.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id          = '20230010'.
  gs_structure-isim        = 'AHMET'.
  gs_structure-soyisim     = 'LALA'.
  gs_structure-cinsiyet    = 'E'.
  gs_structure-meslegi     = 'AVUKAT'.
  gs_structure-gorevi      = 'AVUKAT'.
  gs_structure-maasi       = 4500.
  gs_structure-para_birimi = 'EUR'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  LOOP AT gt_table INTO gs_structure.
    WRITE: /
    gs_structure-id           ,
    gs_structure-isim         ,
    gs_structure-soyisim      ,
    gs_structure-cinsiyet     ,
    gs_structure-meslegi      ,
    gs_structure-gorevi       ,
    gs_structure-maasi        ,
    gs_structure-para_birimi  .
    SKIP.
    ULINE.
  ENDLOOP.
