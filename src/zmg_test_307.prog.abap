*&---------------------------------------------------------------------*
*& Report ZMG_TEST_307
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_307.
*ABAP-7.40'la gelen yenilikler_Read Table 1

DATA: gv_index TYPE i. ""2.Cözüm

START-OF-SELECTION.

  SELECT * FROM stravelag INTO TABLE @DATA(gt_table).

  "Abap 7.40 öncesi:
  READ TABLE gt_table INTO DATA(gs_table) INDEX 100.
  IF sy-subrc IS INITIAL.
    WRITE: gs_table-agencynum.
  ENDIF.

  "Abap 7.40 sonrasi: SORUN:Fazla sayida veri talebi karsisinda DAMP almamak icin:TRY-ENDTRY komutu kullanilir!!!
  TRY.
      DATA(gs_str) = gt_table[ 500 ].
    CATCH cx_sy_itab_line_not_found.
      MESSAGE 'Girilen index numarasi bulunmamaktadir' TYPE 'S' DISPLAY LIKE 'E'.
  ENDTRY.

  DESCRIBE TABLE gt_table LINES DATA(gv_no_lines).  ""2.2. Cözüm

  gv_index = 5.   ""2.1.Cözüm__Bu kisim Kaldirilabilir

  IF gv_no_lines >= 5.            ""2.Cözüm
*    DATA(gs_str_2) = gt_table[ gv_index ]. ""2.1.Cözüm_Kaldirilabilir:Data Inline Decleration ile tanimlandi-gv_index ise IF ile kosullandi.
    DATA(gs_str_2) = gt_table[ 5 ].
  ENDIF.
