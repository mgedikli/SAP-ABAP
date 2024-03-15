*&---------------------------------------------------------------------*
*& Report ZMG_TEST_145
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_145.
*Alıştırma – 1: Yeni bir rapor oluşturun ve kullanıcıdan 2 adet sayı alin. Yeni bir Class oluşturun. Class
*içerisinde 1 adet metot olsun. (Instance-Public) Metodun sayı tipinde 2 adet import parametresi olsun,
*yine sayı tipinde 1 adet export parametresi olsun. Metot kendisine verilen birinci sayıyı (kendisine
*verilen ikinci sayı kadar) kendisiyle çarpsın. (Örnek: metoda sırasıyla 10 ve 3 sayıları verildiyse, metot
*10 sayısını kendisiyle 3 kere çarpacak ve elde ettiği sonucu export parametresine kaydedecek.) elde
*ettiğiniz sonucu ekrana yazdırın.

PARAMETERS: p_num_01 TYPE i,
            p_num_02 TYPE i.
DATA: go_class  TYPE REF TO zalistirma_cls_mg_01,
      gv_result TYPE i.

START-OF-SELECTION.

  CREATE OBJECT go_class.

  go_class->method_01(
    EXPORTING
      iv_number_01 = p_num_01
      iv_number_02 = p_num_02
    IMPORTING
      ev_result    = gv_result ).
  WRITE: gv_result.

***se38 icin 1.Yöntem:*********************************************
**DATA: gv_number_01 TYPE i VALUE 10,
**      gv_number_02 TYPE i VALUE 5.
**
**DATA: gv_number TYPE i.
**
**gv_number = gv_number_01.
**
**DO ( gv_number_02 - 1 ) TIMES.
**  gv_number = gv_number * gv_number_01.
**ENDDO.
***se38 icin 2.Yöntem: Birinci ile ayni; sadece gv-> iv oldu; lv tanimlandi.*****************

*DATA: iv_number_01 TYPE i VALUE 10,
*      iv_number_02 TYPE i VALUE 8.
*
*DATA: lv_number TYPE i.
*
*lv_number = iv_number_01.
*
*DO ( iv_number_02 - 1 ) TIMES.
*    lv_number = lv_number * iv_number_01.
*ENDDO.

***se38 icin 3.Yöntem:*****************************************
*
*DATA: gv_number_01 TYPE i VALUE 10,
*      gv_number_02 TYPE i VALUE 5.
*
*DATA: gv_number TYPE i.
*
*DO gv_number_02 TIMES.
*  IF sy-index = 1.
*    gv_number = gv_number_01.
*  ELSE.
*    gv_number = gv_number * gv_number_01.
*  ENDIF.
*ENDDO.
