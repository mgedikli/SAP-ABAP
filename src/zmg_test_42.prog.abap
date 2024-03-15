*&---------------------------------------------------------------------*
*& Report ZMG_TEST_42
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_42.

*STANDART, Sorted ve Hashed Tablolar ve SORT Komutu
*STANDART Tablolara APPEND TO komutu ile veri atilir; ama
*SORTED Tablolara ise INSERT INTO TABLE ile veri atilir.

TYPES : BEGIN OF gty_structure ,
          id      TYPE n LENGTH 8,
          name    TYPE c LENGTH 40,
          surname TYPE c LENGTH 40,
          job     TYPE c LENGTH 20,
          salary  TYPE i,
          curr    TYPE c LENGTH 3,
          gsm     TYPE string,
          e_mail  TYPE string,
        END OF gty_structure.

DATA : gs_structure TYPE gty_structure,

*       gt_table     TYPE SORTED TABLE OF gty_structure WITH UNIQUE KEY id.
       gt_table     TYPE SORTED TABLE OF gty_structure WITH NON-UNIQUE KEY id.

"UNIQUE KEY kullanilinca KEY Fieldlari ayni iki satir olamaz; siralama yapar ve KEY Field ayni ise kayit atmaz; sy_subrc 4 döner.
"UNIQUE KEY ise siralama yapar ve KEY ayni olsa bile en güncel kaydi eski kaydin bir öncesine atar.

START-OF-SELECTION.

  gs_structure-id      = 20220002.
  gs_structure-name    = 'Ali'.
  gs_structure-surname = 'Öztürk'.
  gs_structure-job     = 'Doctor'.
  gs_structure-salary  = 4000.
  gs_structure-curr    = 'EURO'.
  gs_structure-gsm     = '+4916634543254'.
  gs_structure-e_mail  = 'ozturkali@gmail.com'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 20220001.
  gs_structure-name    = 'Mehmet'.
  gs_structure-surname = 'Yilmaz'.
  gs_structure-job     = 'Teacher'.
  gs_structure-salary  = 3000.
  gs_structure-curr    = 'EURO'.
  gs_structure-gsm     = '+4916634543298'.
  gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 20220003.
  gs_structure-name    = 'Ali'.
  gs_structure-surname = 'Öztürk'.
  gs_structure-job     = 'Doctor'.
  gs_structure-salary  = 4000.
  gs_structure-curr    = 'EURO'.
  gs_structure-gsm     = '+4916634543254'.
  gs_structure-e_mail  = 'ozturkali@gmail.com'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 20220002.
  gs_structure-name    = 'Mehmet'.
  gs_structure-surname = 'Yilmaz'.
  gs_structure-job     = 'Teacher'.
  gs_structure-salary  = 3000.
  gs_structure-curr    = 'EURO'.
  gs_structure-gsm     = '+4916634543298'.
  gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

*SORT gt_table by id DESCENDING. "Default ASCENDING. NOT: SORT komutu sadece STANDART Tablolarda kullanilir.
" SORTED tablolarda bu komut hata mesaji verir.
"GT_TABLE" is a table of the type SORTED. The SORT command cannot be used with this type of table.


  LOOP AT gt_table INTO gs_structure WHERE id NE 20220002.

    WRITE : / gs_structure-id     ,
            / gs_structure-name   ,
            / gs_structure-surname,
            / gs_structure-job    ,
            / gs_structure-salary ,
            / gs_structure-curr   ,
            / gs_structure-gsm    ,
            / gs_structure-e_mail .
    SKIP.
    ULINE.
  ENDLOOP.
