*&---------------------------------------------------------------------*
*& Report ZMG_TEST_88
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_88.
*Sayfa 167-Alistirma 4: Yeni bir rapor oluşturun ve kullanıcıdan 3 adet parametre alin. (1 adet CARRID, 2 adet
*tarih). Parametrelerden gelen veriyi Type Range komutu kullanarak oluşturacağınız Select-Options
*yapılarına aktarın. Elde ettiğiniz Select-Options yapılarını kullanarak SFLIGHT tablosundan uygun
*satırları okuyun ve ekrana yazdırın.


SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS: p_carr  TYPE s_carr_id,
              p_date1 TYPE datum, "sy_datum
              p_date2 TYPE datum.
SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_selopt_carr,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE s_carr_id,
         high   TYPE s_carr_id,
       END OF gty_selopt_carr.
TYPES: BEGIN OF gty_selopt_date,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE datum,
         high   TYPE datum,
       END OF gty_selopt_date.


DATA: gs_selopt_carr TYPE gty_selopt_carr,
      gs_selopt_date TYPE gty_selopt_date,
      gs_sflight     TYPE sflight,
      gt_selopt_carr TYPE RANGE OF s_carr_id,
      gt_selopt_date TYPE RANGE OF datum,
      gt_sflight     TYPE TABLE OF sflight.


START-OF-SELECTION.

  gs_selopt_carr-sign     = 'I'.
  gs_selopt_carr-option   = 'EQ'.
  gs_selopt_carr-low      = p_carr.

  APPEND gs_selopt_carr TO gt_selopt_carr.
  CLEAR: gs_selopt_carr.

  gs_selopt_date-sign   = 'I'.
  gs_selopt_date-option = 'BT'.
  gs_selopt_date-low    = p_date1.
  gs_selopt_date-high   = p_date2.

  APPEND gs_selopt_date TO gt_selopt_date.
  CLEAR: gs_selopt_date.

  SELECT * FROM sflight INTO TABLE gt_sflight WHERE carrid IN gt_selopt_carr AND fldate IN gt_selopt_date.

  LOOP AT gt_sflight INTO gs_sflight.
    WRITE: / gs_sflight-carrid, gs_sflight-connid.
    ULINE.
    CLEAR: gs_sflight.
  ENDLOOP.
