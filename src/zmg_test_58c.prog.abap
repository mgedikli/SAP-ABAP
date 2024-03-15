*&---------------------------------------------------------------------*
*& Report ZMG_TEST_58C
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_58c.

*VARIABLE - STRUCTURE - TABLE

DATA: gv_persid   TYPE zmg_persid_de,
      gv_persad   TYPE zmg_persad_de,
      gv_persoyad TYPE zmg_perssoyad_de,
      gv_perscins TYPE zmg_perscins_de,
      gs_pers_t   TYPE zmg_pers_t,
      gt_pers_t   TYPE TABLE OF zmg_pers_t.

*SQL Sorgusu: SELECT - UPDATE - INSERT - DELETE - MODIFY

*Tablo cekme
*SELECT * FROM zmg_pers_t
*  INTO TABLE gt_pers_t ". ama ayrica söyle devam edebilir:
*where personel_id EQ 1. "sadece erkek olanlari cek seklinde de olabilir.

**Structure cekme:
*SELECT SINGLE * FROM zmg_pers_t
*  INTO gs_pers_t.

**Colon cekme
*SELECT SINGLE personel_id FROM zmg_pers_t
*  INTO gv_persid.

**Update
*UPDATE zmg_pers_t SET personel_ad = 'HAKAN'
*WHERE personel_id EQ 1.
*WRITE: 'Update komutu calistirildi'.

**Insert Komutu
*gs_pers_t-personel_id = 4.
*gs_pers_t-personel_ad  = 'FURKAN'.
*gs_pers_t-personel_soyad  = 'SÖYLEMEZ'.
*gs_pers_t-personel_cinsiyeti = 'E'.
*INSERT zmg_pers_t FROM gs_pers_t.
*  WRITE: 'Insert komutu calistirildi'.

**Delete Komutu
*DELETE FROM zmg_pers_t WHERE personel_id eq 2.
*WRITE: 'Delete Komutu calistirildi.'.

*Modify Komutu:
*Update ve insert komutunun birlesimi ile calisir.
*update: bir satirin belli konumunun verilerini degistirir.
*insert: bir satirin verilerini direct tabloya ekler.
*Modify: verilen key tabloda varsa update olarak calisir
* ve diger kolonlarin hepsini update eder; yeni satir eklemez.
*Key tabloda yoksa insert olarak calisir; yani yeni bir satir ekler.

*gs_pers_t-personel_id = 5.
*gs_pers_t-personel_ad  = 'GÜLCIN'.
*gs_pers_t-personel_soyad  = 'GEDIKLI'.
*gs_pers_t-personel_cinsiyeti = 'K'.
*
*MODIFY zmg_pers_t FROM gs_pers_t.
*WRITE: 'Modify Komutu calistirildi.'.
