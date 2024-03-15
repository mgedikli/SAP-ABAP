*&---------------------------------------------------------------------*
*& Report ZMG_TEST_290
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_290.
*S.330_Alıştırma – 8: Yeni bir rapor oluşturun. Raporda 2 adet radiobutton olsun. Kullanıcı ilk radiobuttonu
*seçerse ZCM_TABLO_1, ikinci radiobuttonu seçerse ZCM_TABLO_2 tablosundaki bütün satırların
*okuyup internal tablo içine kaydedin. Select komutunu sadece 1 kere kullanılan. TYPE ANY TABLE
*komutu yardımıyla bir field sembol tanımlayın ve internal tabloyu bu field sembole assign edin. Field
*sembol üzerinde loop ederek tüm kolonları ekrana yazdırın.
*
*Dinamik Veri cekme,Rdb.Secili satirlari IT'ya kaydet,select, Type Any Table, FS assign, loop at kolonlari yazdir.

PARAMETERS: p_tb1 RADIOBUTTON GROUP abc,
            p_tb2 RADIOBUTTON GROUP abc.

DATA: gt_table_1 TYPE TABLE OF zcm_tablo_1,
      gt_table_2 TYPE TABLE OF zcm_tablo_2,
      gv_tabname TYPE tabname.

FIELD-SYMBOLS: <fs_table> TYPE ANY TABLE.

START-OF-SELECTION.

  IF p_tb1 = abap_true.
    ASSIGN gt_table_1 TO <fs_table>.
    gv_tabname = 'ZCM_TABLO_1'.
  ELSE.
    ASSIGN gt_table_2 TO <fs_table>.
    gv_tabname = 'ZCM_TABLO_2'.
  ENDIF.

  SELECT * FROM (gv_tabname) INTO TABLE <fs_table>.

  BREAK-POINT.
