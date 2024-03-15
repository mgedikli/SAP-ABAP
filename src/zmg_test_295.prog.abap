*&---------------------------------------------------------------------*
*& Report ZMG_TEST_295
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_295.
*Inline Decleration  READ TABLE ile kullanim

START-OF-SELECTION.

  SELECT * FROM scarr INTO TABLE @DATA(gt_scarr).

  LOOP AT gt_scarr ASSIGNING FIELD-SYMBOL(<fs_scarr>).

    ASSIGN COMPONENT 'CARRID' OF STRUCTURE <fs_scarr> TO FIELD-SYMBOL(<fs_hucre>).
    IF <fs_hucre> IS ASSIGNED.
      WRITE: <fs_hucre>.
    ENDIF.

    SKIP.
  ENDLOOP.

  BREAK-POINT.
