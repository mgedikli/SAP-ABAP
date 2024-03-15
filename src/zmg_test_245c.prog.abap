*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245C
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245c.
*Str tipi ile TT olusturma ve veri atma

DATA: gt_table TYPE zmg_tt_002,
      gs_table TYPE zmg_structure_002.

START-OF-SELECTION.

  gs_table-id           = 100200300.
  gs_table-isim         = 'Nur'.
  gs_table-soyisim      = 'Gözcü'.
  gs_table-cinsiyet     = 'K'.
  gs_table-meslegi      = 'Developer'.
  gs_table-gorevi       = 'IT Departman Sefi'.
  gs_table-maasi        = 4000.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200301.
  gs_table-isim         = 'Ali'.
  gs_table-soyisim      = 'Nar'.
  gs_table-cinsiyet     = 'E'.
  gs_table-meslegi      = 'Developer'.
  gs_table-gorevi       = 'Developer'.
  gs_table-maasi        = 3000.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200302.
  gs_table-isim         = 'Can'.
  gs_table-soyisim      = 'Gül'.
  gs_table-cinsiyet     = 'K'.
  gs_table-meslegi      = 'Developer'.
  gs_table-gorevi       = 'Developer'.
  gs_table-maasi        = 3000.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200401.
  gs_table-isim         = 'Halit'.
  gs_table-soyisim      = 'Dere'.
  gs_table-cinsiyet     = 'E'.
  gs_table-meslegi      = 'Muhasebeci'.
  gs_table-gorevi       = 'Muhasebe Departmani'.
  gs_table-maasi        = 3000.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200505.
  gs_table-isim         = 'Halil'.
  gs_table-soyisim      = 'Ala'.
  gs_table-cinsiyet     = 'E'.
  gs_table-meslegi      = 'Söför'.
  gs_table-gorevi       = 'Ulastirma'.
  gs_table-maasi        = 2500.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200510.
  gs_table-isim         = 'Naci'.
  gs_table-soyisim      = 'Uzun'.
  gs_table-cinsiyet     = 'E'.
  gs_table-meslegi      = 'Söför'.
  gs_table-gorevi       = 'Ulastirma'.
  gs_table-maasi        = 2500.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200832.
  gs_table-isim         = 'Nuri'.
  gs_table-soyisim      = 'Tak'.
  gs_table-cinsiyet     = 'E'.
  gs_table-meslegi      = 'Depocu'.
  gs_table-gorevi       = 'Lojistik'.
  gs_table-maasi        = 2500.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id           = 100200820.
  gs_table-isim         = 'Burcu'.
  gs_table-soyisim      = 'Nil'.
  gs_table-cinsiyet     = 'K'.
  gs_table-meslegi      = 'Depocu'.
  gs_table-gorevi       = 'Lojistik'.
  gs_table-maasi        = 2500.
  gs_table-para_birimi  = 'EUR'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  LOOP AT gt_table INTO gs_table.
    WRITE: / gs_table-id, gs_table-isim, gs_table-soyisim, gs_table-cinsiyet,
             gs_table-meslegi, gs_table-gorevi, gs_table-maasi, gs_table-para_birimi.
  ENDLOOP.
  SKIP.
  ULINE.
