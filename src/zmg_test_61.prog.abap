*&---------------------------------------------------------------------*
*& Report ZMG_TEST_61
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_61.

*Sayfa 132  Alıştırma – 3: SE11 işlem kodu ile bir database tablosu tanımlayın. Kolonlar için birinci alıştırmada
*oluşturulan data elementleri kullanın. Tablo için bakim ekranı oluşturun ve 2 adet satir kaydedin.
*ZMG_TABLE_PHONE

DATA: gs_structure TYPE zmg_table_phone,
      gt_table     TYPE TABLE OF zmg_table_phone.

START-OF-SELECTION.
  SELECT * FROM zmg_table_phone INTO TABLE gt_table.

  LOOP AT   gt_table INTO gs_structure.
    WRITE: / gs_structure-phone_brand      ,
             gs_structure-phone_model      ,
             gs_structure-phone_color      ,
             gs_structure-phone_opr_system ,
             gs_structure-phone_memory     ,
             gs_structure-phone_screen     ,
             gs_structure-phone_price      ,
             gs_structure-phone_curr       ,
             gs_structure-phone_dobl_sim   ,
             gs_structure-phone_weight     ,
             gs_structure-phone_wuom       .
    CLEAR: gs_structure.
  ENDLOOP.
