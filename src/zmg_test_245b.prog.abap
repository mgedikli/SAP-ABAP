*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245b.
*Sts kullanarak TT olusturma ve SE38 de veri atma.

DATA: gt_table TYPE zmg_tt_003,
      gs_table TYPE zmg_structure_003.

START-OF-SELECTION.

  gs_table-id         = 20240001.
  gs_table-adi        = 'Ali'.
  gs_table-soyadi     = 'Tas'.
  gs_table-cinsiyeti  = 'E'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Edebiyat'.
  gs_table-sinifi     = 'A'.
  gs_table-ogrenci_no = 21400.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.

  gs_table-id         = 20240099.
  gs_table-adi        = 'Banu'.
  gs_table-soyadi     = 'Has'.
  gs_table-cinsiyeti  = 'K'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Fizik'.
  gs_table-sinifi     = 'C'.
  gs_table-ogrenci_no = 21533.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.

  gs_table-id         = 20240077.
  gs_table-adi        = 'Nalan'.
  gs_table-soyadi     = 'Can'.
  gs_table-cinsiyeti  = 'E'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Matematik'.
  gs_table-sinifi     = 'B'.
  gs_table-ogrenci_no = 21322.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.

  gs_table-id         = 20240002.
  gs_table-adi        = 'Ali'.
  gs_table-soyadi     = 'Kus'.
  gs_table-cinsiyeti  = 'E'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Matematik'.
  gs_table-sinifi     = 'B'.
  gs_table-ogrenci_no = 21300.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.

  gs_table-id         = 20240018.
  gs_table-adi        = 'Hasan'.
  gs_table-soyadi     = 'Yas'.
  gs_table-cinsiyeti  = 'E'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Fizik'.
  gs_table-sinifi     = 'C'.
  gs_table-ogrenci_no = 21500.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.

  gs_table-id         = 20240025.
  gs_table-adi        = 'Ayse'.
  gs_table-soyadi     = 'Alp'.
  gs_table-cinsiyeti  = 'K'.
  gs_table-fakulte    = 'Egitim'.
  gs_table-bolum      = 'Kimya'.
  gs_table-sinifi     = 'D'.
  gs_table-ogrenci_no = 21500.

  APPEND gs_table TO gt_table.
  WRITE: gs_table.
  CLEAR: gs_table.
  SKIP.
  ULINE.
