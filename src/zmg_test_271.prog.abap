*&---------------------------------------------------------------------*
*& Report ZMG_TEST_271
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_271.
*Generic Def. Veri tipi (runtime) belirlenen FC ( ANY TABLE ) s.327

DATA: gv_text    TYPE string VALUE 'Field sembol kullanimi örnek rapor',
      gs_scarr   TYPE scarr,
      gt_spfli   TYPE TABLE OF spfli,
      gt_sflight TYPE TABLE OF sflight,
      gt_scarr   TYPE TABLE OF scarr.

FIELD-SYMBOLS: <fs_genel> TYPE any,
               <fs_hucre> TYPE any,
               <fs_str>   TYPE any,
               <fs_table> TYPE ANY TABLE.

START-OF-SELECTION.

  SELECT * FROM sflight INTO TABLE gt_sflight.
  SELECT * FROM spfli INTO TABLE gt_spfli.
  SELECT * FROM scarr INTO TABLE gt_scarr.

  ASSIGN gt_sflight TO <fs_table>.
  ASSIGN gt_spfli TO <fs_table>.
  ASSIGN gt_scarr TO <fs_table>.

  BREAK-POINT.

**************************************************************************
*DATA: gv_text  TYPE string VALUE 'Field sembol kullanimi örnek rapor',
*      gs_scarr TYPE scarr,
*      gt_spfli TYPE TABLE OF spfli.
*
*FIELD-SYMBOLS: <fs_genel> TYPE any,
*               <fs_hucre> TYPE any,
*               <fs_str>   TYPE any.
*
*START-OF-SELECTION.
*
*  ASSIGN gv_text TO <fs_genel>.
*
*  WRITE: <fs_genel>.
*  SKIP.
*
*  SELECT SINGLE * FROM scarr INTO gs_scarr WHERE carrid = 'LH'.
*
*  ASSIGN gs_scarr TO <fs_genel>.
*
*  ASSIGN COMPONENT 'CARRID' OF STRUCTURE <fs_genel> TO <fs_hucre>.
*
*  IF sy-subrc IS INITIAL.
*    WRITE: <fs_hucre>.
*  ENDIF.
*
**  ASSIGN COMPONENT 'CONNID' OF STRUCTURE <fs_genel> TO <fs_hucre>. "DUMP alir
**
**  IF sy-subrc IS INITIAL.
**    WRITE: <fs_hucre>.
**  ENDIF.
*
*  BREAK-POINT.
