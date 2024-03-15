*&---------------------------------------------------------------------*
*& Report ZMG_TEST_44A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_44a.

*Alıştırma -1: Yeni bir program oluşturun. 1 adet parametre tanımlayın ve kullanıcıdan 1 ile 10 arasında
*bir sayı alin. Program içerisinde bir satir tanımlayın. Satirin hücreleri sırasıyla “Öğrenci ID”, “Öğrenci
*Adi”, “Öğrenci Soyadı”, “Ders”, “Alınan Not” ve “Basari Durumu” olsun. Bu satir ile ayni yapıya sahip
*bir internal tablo tanımlayın. Satiri kendi üreteceğiniz veriyle 10 kere doldurun ve her doldurmadan
*sonra Append komutu ile internal tabloya kaydedin. Daha sonra secim ekranından (selection screen)
*gelecek bilgiye göre internal tabloyu Read Table komutu ile okuyun ve ekrana yazdırın. (Kullanıcı 4
*girdiyse internal tablonun 4. Satiri Read Table komutu ile okunup ekrana yazdırılacak) (Parametre için
*selection screen oluşturun ve başlığını tanımlayın).

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_num TYPE n LENGTH 2.
SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_structure,
         id      TYPE n LENGTH 6,
         name    TYPE c LENGTH 30,
         surname TYPE c LENGTH 30,
         lesson  TYPE c LENGTH 20,
         mark    TYPE n LENGTH 3,
         success TYPE c LENGTH 20,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE TABLE OF gty_structure.

START-OF-SELECTION.

  IF p_num IS INITIAL OR p_num > 10.
    MESSAGE TEXT-002 TYPE 'I'.
    EXIT.
  ENDIF.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Ali'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '70'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Veli'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '80'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Mustafa'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '40'.
  gs_structure-success  = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Mahmut'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '100'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Saliha'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '30'.
  gs_structure-success  = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Gülcin'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '90'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Süreyya'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '85'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Mehmet'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '50'.
  gs_structure-success  = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Erkin'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '20'.
  gs_structure-success  = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id       = 200001.
  gs_structure-name     = 'Sefik'.
  gs_structure-surname  = 'Cengiz'.
  gs_structure-lesson   = 'Math'.
  gs_structure-mark     = '60'.
  gs_structure-success  = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  READ TABLE gt_table INTO gs_structure INDEX p_num.
  IF sy-subrc IS INITIAL.
    WRITE:  gs_structure-id, gs_structure-name, gs_structure-surname,
            gs_structure-lesson, gs_structure-mark, gs_structure-success.
  ENDIF.
