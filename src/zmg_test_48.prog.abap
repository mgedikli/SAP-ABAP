*&---------------------------------------------------------------------*
*& Report ZMG_TEST_48
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_48.

*Alıştırma -4: Yeni bir program oluşturun. 3 adet Radiobutton oluşturun. Bu Radiobuttonlar “Sadece
*Başarılı Olanlar”, “Sadece Basarisiz Olanlar” ve “Hepsi” seklinde olsun. Program içerisinde bir satir
*tanımlayın. Satirin hücreleri sırasıyla “Öğrenci ID”, “Öğrenci Adı”, “Öğrenci Soyadı”, “Ders”, “Alınan
*Not” ve “Basari Durumu” olsun. Bu satir ile ayni yapıya bir internal tablo tanımlayın. Satiri 10 kere
*doldurun ve her doldurmadan sonra Append komutu ile internal tabloya kaydedin. Daha sonra secim
*ekranından (selection screen) gelecek bilgiye göre internal tabloda loop ederek istenen satırları ekrana
*yazdırın. (Parametreler için selection screen oluşturun ve başlığını tanımlayın). (Loop where)

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS:p_rdb1 RADIOBUTTON GROUP abc,
             p_rdb2 RADIOBUTTON GROUP abc,
             p_rdb3 RADIOBUTTON GROUP abc.


SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_structure,
         id      TYPE n LENGTH 6,
         name    TYPE c LENGTH 30,
         surname TYPE c LENGTH 30,
         lesson  TYPE c LENGTH 20,
         mark    TYPE n LENGTH 3,
         success TYPE c LENGTH 12,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE TABLE OF gty_structure.

START-OF-SELECTION.



  gs_structure-id      = 200003.
  gs_structure-name    = 'ALI'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '70'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200001.
  gs_structure-name    = 'VELI'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '80'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200002.
  gs_structure-name    = 'MUSTAFA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '40'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200006.
  gs_structure-name    = 'MAHMUT'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '100'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200004.
  gs_structure-name    = 'SALIHA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '30'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200010.
  gs_structure-name    = 'GÜLCIN'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '90'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200008.
  gs_structure-name    = 'SÜREYYA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '85'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200009.
  gs_structure-name    = 'MEHMET'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '50'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200005.
  gs_structure-name    = 'ERKIN'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '20'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200007.
  gs_structure-name    = 'SEFIK'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '60'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  IF p_rdb1 = abap_true.
    DELETE gt_table WHERE success = 'Unsuccessful'.
  ELSEIF p_rdb2 = abap_true .
    DELETE gt_table WHERE success = 'Successful'.
  ENDIF.

  LOOP AT gt_table INTO gs_structure.
    WRITE : gs_structure-id,  gs_structure-name, gs_structure-surname,
                gs_structure-lesson, gs_structure-mark, gs_structure-success.
  CLEAR: gs_structure.
 SKIP.
  ENDLOOP.


*  IF p_rdb1 = abap_true .
*
*    LOOP AT  gt_table INTO gs_structure WHERE success = 'Successful'.
*
*
*      WRITE : gs_structure-id,  gs_structure-name, gs_structure-surname,
*              gs_structure-lesson, gs_structure-mark, gs_structure-success.
*      SKIP.
*
*    ENDLOOP.
*  ELSEIF p_rdb2 = abap_true .
*    LOOP AT  gt_table INTO gs_structure WHERE success = 'Unsuccessful'.
*
*
*      WRITE : gs_structure-id,  gs_structure-name, gs_structure-surname,
*              gs_structure-lesson, gs_structure-mark, gs_structure-success.
*      SKIP.
*    ENDLOOP.
*
*  ELSEIF p_rdb3 = abap_true .
*
*    LOOP AT  gt_table INTO gs_structure.
*
*
*      WRITE : gs_structure-id,  gs_structure-name, gs_structure-surname,
*              gs_structure-lesson, gs_structure-mark, gs_structure-success.
*      SKIP.
*    ENDLOOP.
*
*ENDIF .
