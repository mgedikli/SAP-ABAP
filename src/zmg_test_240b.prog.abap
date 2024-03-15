*&---------------------------------------------------------------------*
*& Report ZMG_TEST_240
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_240b.

TYPES: BEGIN OF gty_table,
         id    TYPE n LENGTH 3,
         name  TYPE c LENGTH 20,
         sname TYPE c LENGTH 20,
       END OF gty_table.

DATA: gt_table_1 TYPE STANDARD TABLE OF gty_table,
      gt_table_2 TYPE SORTED TABLE OF gty_table WITH NON-UNIQUE KEY id,
      gs_str     TYPE gty_table.

START-OF-SELECTION.

  gs_str-id         = 23.
  gs_str-name       = 'Hande'.
  gs_str-sname      = 'Canan'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.

  gs_str-id         = 23.
  gs_str-name       = 'Hande'.
  gs_str-sname      = 'Canan'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.

  gs_str-id         = 20.
  gs_str-name       = 'Tarik'.
  gs_str-sname      = 'Öztürk'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.

  gs_str-id         = 20.
  gs_str-name       = 'Tarik'.
  gs_str-sname      = 'Öztürk'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.

  gs_str-id         = 29.
  gs_str-name       = 'Erkin'.
  gs_str-sname      = 'Degirmenci'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.

  gs_str-id         = 23.
  gs_str-name       = 'Ahmet'.
  gs_str-sname      = 'Degirmenci'.
  INSERT gs_str INTO TABLE gt_table_2.
  CLEAR: gs_str.