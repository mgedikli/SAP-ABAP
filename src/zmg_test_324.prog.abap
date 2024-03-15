*&---------------------------------------------------------------------*
*& Report ZMG_TEST_324
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_324.
*Type Ref To Referanslari ve Dinamik Programlama-Pointer

PARAMETERS : p_table TYPE tabname.

DATA : gr_data TYPE REF TO data.

START-OF-SELECTION.

  DATA(go_new) = NEW zcmdynamic_table_selection( ).

  go_new->get_data(
    EXPORTING
      iv_tabname = p_table
    IMPORTING
      et_data    = gr_data ).

  ASSIGN gr_data->* TO FIELD-SYMBOL(<fs_table>).

  BREAK-POINT.
