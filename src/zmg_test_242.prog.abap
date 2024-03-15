*&---------------------------------------------------------------------*
*& Report ZMG_TEST_242
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_242.

DATA: gt_table  TYPE zmg_tt_fatura_h,
      gt_table2 TYPE zmg_tt_fatura_i,
      gs_table  TYPE zmg_fatura_h,
      gs_table2 TYPE zmg_fatura_i.

SELECT * FROM zmg_fatura_h INTO TABLE gt_table.
SELECT * FROM zmg_fatura_i INTO TABLE gt_table2.

LOOP AT gt_table INTO gs_table.
  WRITE: / gs_table-fatura_no, gs_table-fatura_tarihi, gs_table-muh_sirket,
           gs_table-tutar, gs_table-para_birimi, gs_table-odeme_bilgisi.

  LOOP AT gt_table2 INTO gs_table2 WHERE fatura_no = gs_table-fatura_no.
    WRITE: / gs_table2-fatura_no, gs_table2-urun_no , gs_table2-urun_adet,
             gs_table2-birim_fiyati, gs_table2-toplam_fiyat, gs_table2-para_birimi.
  ENDLOOP.
  SKIP.
  ULINE.
ENDLOOP.
****************************************************************************
****************************************************************************
*DATA: gt_table  TYPE TABLE OF zmg_fatura_h, "TYPE zmg_tt_fatura_h,(se11 de olusturuldu
*      gt_table2 TYPE TABLE OF zmg_fatura_i, "TYPE zmg_tt_fatura_i,
*      gs_table  TYPE zmg_fatura_h,
*      gs_table2 TYPE zmg_fatura_i.
*
*SELECT * FROM zmg_fatura_h INTO TABLE gt_table.
*SELECT * FROM zmg_fatura_i INTO TABLE gt_table2.
*
*LOOP AT gt_table INTO gs_table.
*  WRITE: / gs_table-fatura_no, gs_table-fatura_tarihi, gs_table-muh_sirket,
*           gs_table-tutar, gs_table-para_birimi, gs_table-odeme_bilgisi.
*
*  LOOP AT gt_table2 INTO gs_table2 WHERE fatura_no = gs_table-fatura_no.
*    WRITE: / gs_table2-fatura_no, gs_table2-urun_no , gs_table2-urun_adet,
*             gs_table2-birim_fiyati, gs_table2-toplam_fiyat, gs_table2-para_birimi.
*  ENDLOOP.
*  SKIP.
*  ULINE.
*ENDLOOP.
