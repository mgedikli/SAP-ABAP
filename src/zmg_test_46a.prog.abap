*&---------------------------------------------------------------------*
*& Report ZMG_TEST_46A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_46a.
*Sayfa 84-Alistirma 2 (sortet komutu ile)

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_id TYPE n LENGTH 6 OBLIGATORY.
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
      gt_table     TYPE SORTED TABLE OF gty_structure WITH UNIQUE KEY id.

START-OF-SELECTION.

*IF p_id IS INITIAL.
*  MESSAGE text-002 TYPE 'I'.
*  EXIT.
*  ENDIF.

*Kullanicinin girdigi sayinin 6 haneli olup olmadigini kontrol etmek ve uyarmak icin:

  SHIFT p_id LEFT DELETING LEADING '0'.

  IF strlen( p_id ) ne 6.
    MESSAGE TEXT-002 TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

  gs_structure-id        = 200003.
  gs_structure-name      = 'Ali'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '70'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200001.
  gs_structure-name      = 'Veli'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '80'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200002.
  gs_structure-name      = 'Mustafa'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '40'.
  gs_structure-success   = 'Unsuccessful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200006.
  gs_structure-name      = 'Mahmut'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '100'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200004.
  gs_structure-name      = 'Saliha'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '30'.
  gs_structure-success   = 'Unsuccessful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200010.
  gs_structure-name      = 'Gülcin'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '90'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200008.
  gs_structure-name      = 'Süreyya'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '85'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200009.
  gs_structure-name      = 'Mehmet'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '50'.
  gs_structure-success   = 'Unsuccessful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200005.
  gs_structure-name      = 'Erkin'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '20'.
  gs_structure-success   = 'Unsuccessful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

START-OF-SELECTION.
  gs_structure-id        = 200007.
  gs_structure-name      = 'Sefik'.
  gs_structure-surname   = 'Cengiz'.
  gs_structure-lesson    = 'Math'.
  gs_structure-mark      = '60'.
  gs_structure-success   = 'Successful'.

  INSERT gs_structure INTO TABLE gt_table.
  CLEAR: gs_structure.

  READ TABLE gt_table INTO gs_structure WITH KEY id = p_id.
  IF sy-subrc IS INITIAL.
    WRITE: gs_structure-id       ,
           gs_structure-name     ,
           gs_structure-surname  ,
           gs_structure-lesson   ,
           gs_structure-mark     ,
           gs_structure-success  .
  ENDIF.
