*&---------------------------------------------------------------------*
*& Report ZMG_TEST_150
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_150.
*Sayfa : 224
*Alıştırma – 7: Yeni bir rapor oluşturun. İçerisinde 3 adet radiobutton olsun. Radibuttonlarin her birinin
*ismi bir db tablosu olsun. Radiobutonlar yardımıyla kullanıcıdan 1 adet db tablosu ismi alın. Yeni bir
*Class oluşturun ve 4 adet metot tanımlayın. (Tamamı Instance-Public) Gelen db tablosu ismini
*kullanarak sırasıyla veri çekin, fieldcatalog hazırlayın, Layout hazırlayın ve kullanıcı hangi tabloyu
*seçtiyse ekranda o tablonun ALV’sini gösterin.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_scarr RADIOBUTTON GROUP rdb,
              p_spfli RADIOBUTTON GROUP rdb,
              p_sflgt RADIOBUTTON GROUP rdb.
SELECTION-SCREEN END OF BLOCK a1.

DATA: go_database TYPE REF TO zalistirma_cls_mg_07.

START-OF-SELECTION.

CREATE OBJECT go_database
  EXPORTING
    iv_scarr   = p_scarr
    iv_spfli   = p_spfli
    iv_sflight = p_sflgt.

IF p_scarr IS NOT INITIAL.
  go_database->show_alv_scarr( ).
ELSEIF p_spfli IS NOT INITIAL.
  go_database->show_alv_spfli( ).
ELSEIF p_sflgt IS NOT INITIAL.
  go_database->show_alv_sflight( ).
ENDIF.
