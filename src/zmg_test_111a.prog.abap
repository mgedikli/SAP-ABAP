*&---------------------------------------------------------------------*
*& Report ZMG_TEST_111A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_111a.

DATA: lt_sflight     TYPE TABLE OF sflight,
      lt_zmg_sflight TYPE TABLE OF zmg_sflight.

SELECT * FROM sflight INTO TABLE lt_sflight.

IF sy-subrc IS NOT INITIAL.
  LOOP AT lt_sflight INTO DATA(ls_sflight).
    APPEND ls_sflight to lt_zmg_sflight.
  ENDLOOP.

  INSERT zmg_sflight FROM TABLE lt_zmg_sflight.
  CLEAR: ls_sflight.
  COMMIT WORK.
ENDIF.
BREAK-POINT.
