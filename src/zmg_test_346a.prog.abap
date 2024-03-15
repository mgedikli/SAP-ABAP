*&---------------------------------------------------------------------*
*& Report ZMG_TEST_346A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_346A.
*Alıştırma – 9:
*Yeni bir rapor oluşturun ve kullanıcıdan 2 adet CARRID alın. Rapor içinde 2 kere SPFLI
*tablosundan ilgili satırları okuyun ve iki ayrı internal tablo içine kaydedin. Her okumada secim
*ekranından gelen bir CARRID bilgisini koşul olarak belirleyin. Inline declaration ile SPFLI tablosunun
*satir yapısı ile ayni satır yapısında bir internal tablo tanımlayın. Öncelikle FOR IN döngüsü kullanarak
*birinci internal tablodaki verileri, daha sonra BASE FOR IN komutlarını kullanarak ikinci internal
*tablodaki verileri üçüncü internal tablonun içine aktarın.

PARAMETERS: p_carid1 TYPE s_carr_id,
            p_carid2 TYPE s_carr_id.

TYPES: BEGIN OF gty_table.
  INCLUDE TYPE spfli.
TYPES: END OF gty_table.

TYPES: gtt_table TYPE TABLE OF gty_table WITH NON-UNIQUE KEY carrid.

START-OF-SELECTION.

SELECT * FROM spfli INTO TABLE @DATA(gt_spfli_01) WHERE carrid = @p_carid1.
SELECT * FROM spfli INTO TABLE @DATA(gt_spfli_02) WHERE carrid = @p_carid2.

  DATA(gt_table) = VALUE gtt_table( FOR gs_spfli_01
                                       IN gt_spfli_01
                                       WHERE ( carrid = p_carid1 ) ( gs_spfli_01 ) ).
  gt_table = VALUE #( BASE gt_table
                              FOR gs_spfli_02
                              IN gt_spfli_02
                              WHERE ( carrid = p_carid2 ) ( gs_spfli_02 ) ).

  BREAK-POINT.
