*&---------------------------------------------------------------------*
*& Report ZMG_TEST_245D
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_245d.
*TT ZMG_STRUCTURE_010 Personel Bilgisi
DATA: gt_table TYPE zmg_tt_010,
      gs_table TYPE zmg_structure_010.

START-OF-SELECTION.

  gs_table-id      = 20240001.
  gs_table-name    = 'Ahmet'.
  gs_table-surname = 'Hos'.
  gs_table-job     = 'Driver'.
  gs_table-salary  = 3000.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491785536.
  gs_table-e_mail  = 'ahmethos@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240002.
  gs_table-name    = 'Ali'.
  gs_table-surname = 'Konak'.
  gs_table-job     = 'Driver'.
  gs_table-salary  = 3000.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491787674.
  gs_table-e_mail  = 'alikonak@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240003.
  gs_table-name    = 'Veli'.
  gs_table-surname = 'Gül'.
  gs_table-job     = 'Driver'.
  gs_table-salary  = 3000.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491781123.
  gs_table-e_mail  = 'veligul@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240004.
  gs_table-name    = 'Ahmet'.
  gs_table-surname = 'Hos'.
  gs_table-job     = 'Driver'.
  gs_table-salary  = 3000.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491785536.
  gs_table-e_mail  = 'ahmethos@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240021.
  gs_table-name    = 'Gül'.
  gs_table-surname = 'Cinar'.
  gs_table-job     = 'Sekreter'.
  gs_table-salary  = 2500.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491780077.
  gs_table-e_mail  = 'gulcinar@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240088.
  gs_table-name    = 'Ingo'.
  gs_table-surname = 'Bauer'.
  gs_table-job     = 'Developer'.
  gs_table-salary  = 3500.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 00491764432.
  gs_table-e_mail  = 'ingobauer@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  gs_table-id      = 20240344.
  gs_table-name    = 'Thomas'.
  gs_table-surname = 'Schön'.
  gs_table-job     = 'Developer'.
  gs_table-salary  = 4500.
  gs_table-curr    = 'EUR'.
  gs_table-gsm     = 0049165566.
  gs_table-e_mail  = 'thomasschon@gmail.com'.

  APPEND gs_table TO gt_table.
  CLEAR: gs_table.

  LOOP AT gt_table INTO gs_table.
    WRITE: / gs_table-id, gs_table-name, gs_table-surname, gs_table-job,
             gs_table-salary, gs_table-curr,gs_table-gsm, gs_table-e_mail.
    SKIP.
    ULINE.
  ENDLOOP.
