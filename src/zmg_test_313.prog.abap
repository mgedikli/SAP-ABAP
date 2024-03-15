*&---------------------------------------------------------------------*
*& Report ZMG_TEST_313
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_313.
*Reduce Komutu:1-IT'da belli özelliklere sahip kac satir var? zB.Kac tanesinin ülke kodlari DE?

DATA: gv_number_1 TYPE i.  "Abap 7.40 öncesi.
DATA: gv_number_2 TYPE i.

START-OF-SELECTION.

SELECT * FROM stravelag INTO TABLE @DATA(gt_stravelag).

"Abap 7.40 öncesi.
  LOOP AT gt_stravelag INTO DATA(gs_stravelag).
    IF gs_stravelag-country = 'DE'.
      gv_number_1 = gv_number_1 + 1.
    ENDIF.
  ENDLOOP.

"Abap 7.40 sonrasi.
 gv_number_2 = REDUCE i( INIT x = 0
                         FOR gs_str
                         IN gt_stravelag
                         WHERE ( country = 'DE' )
                         NEXT x = x + 1 ).

  BREAK-POINT.
