*&---------------------------------------------------------------------*
*& Report ZMG_TEST_53A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_53a.

"ZMG_STRUCTURE_011.

DATA: gs_structure TYPE zmg_structure_011,
      gt_table TYPE TABLE OF zmg_structure_011.

START-OF-SELECTION.


gs_structure-ID          =  '20240003'.
gs_structure-NAME        =  'Ali'.
gs_structure-SURNAME     =  'Öztürk'.
gs_structure-JOB         =  'Doctor'.
gs_structure-SALARY      =  4500.
gs_structure-CURR        =  'EUR'.
gs_structure-GSM         =  '+4917683729459'.
gs_structure-E_MAIL      =  'aliozturk@gmail.com'.

APPEND gs_structure TO gt_table.
clear gs_structure.

  gs_structure-id      = '20240001'.
  gs_structure-name    = 'Mehmet'.
  gs_structure-surname = 'Yılmaz'.
  gs_structure-job     = 'Teacher'.
  gs_structure-salary  = 4000.
  gs_structure-curr    = 'EUR'.
  gs_structure-gsm     = '+4917683729460'.
  gs_structure-e_mail  = 'mehmetyilmaz@gmail.com'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

  gs_structure-id      = '20240002'.
  gs_structure-name    = 'Hande'.
  gs_structure-surname = 'Caner'.
  gs_structure-job     = 'Developer'.
  gs_structure-salary  = 4000.
  gs_structure-curr    = 'EUR'.
  gs_structure-gsm     = '+4917683729461'.
  gs_structure-e_mail  = 'handecaner@gmail.com'.

  APPEND gs_structure TO gt_table.
  CLEAR gs_structure.

LOOP AT gt_table INTO gs_structure.
    WRITE : / gs_structure-id , gs_structure-name   , gs_structure-surname,
              gs_structure-job, gs_structure-salary , gs_structure-curr,
              gs_structure-gsm, gs_structure-e_mail .
    SKIP.
    ULINE.
  ENDLOOP.
