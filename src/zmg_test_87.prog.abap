*&---------------------------------------------------------------------*
*& Report ZMG_TEST_87
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_87.
*Alıştırma – 3: Yeni bir rapor oluşturun ve kullanıcıdan 2 adet parametre alin. Her ikisi de CARRID tipinde
*olsun. Parametrelerden gelen veriyi Type Range komutu kullanarak oluşturacağınız Select-Options
*yapılarına aktarın ve SPFLI tablosunda satırları okuyup ekrana yazdırın.
TYPES: BEGIN OF gty_carrid,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE s_carr_id,
         high   TYPE s_carr_id,
       END OF gty_carrid.

DATA: gt_sel_carrid TYPE RANGE OF s_carr_id,
      "gt_sel_carrid TYPE TABLE OF gty_carrid,
      gs_sel_carrid TYPE gty_carrid,
      gt_spfli      TYPE TABLE OF spfli.
.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carr1 TYPE s_carr_id,
              p_carr2 TYPE s_carr_id.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  gs_sel_carrid-sign    = 'I'.
  gs_sel_carrid-option = 'EQ'.
  gs_sel_carrid-low     = p_carr1.
*gs_sel_carrid-sign    = 'I'.
  APPEND gs_sel_carrid TO gt_sel_carrid.
  CLEAR: gs_sel_carrid.

  gs_sel_carrid-sign    = 'I'.
  gs_sel_carrid-option = 'EQ'.
  gs_sel_carrid-low     = p_carr2.
*gs_sel_carrid-sign    = 'I'.
  APPEND gs_sel_carrid TO gt_sel_carrid.
  CLEAR: gs_sel_carrid.

  SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid IN gt_sel_carrid.

    BREAK-POINT.
