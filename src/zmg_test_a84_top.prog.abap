*&---------------------------------------------------------------------*
*& Include ZMG_TEST_A84_TOP
*&---------------------------------------------------------------------*
DATA: gs_structure TYPE zmc_table_001,
      gt_table     TYPE TABLE OF zmc_table_001.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_id     TYPE zmc_table_001-id,
              p_name   TYPE zmc_table_001-name,
              p_sname  TYPE zmc_table_001-surname,
              p_job    TYPE zmc_table_001-job,
              p_slry   TYPE zmc_table_001-salary,
              p_curr   TYPE zmc_table_001-curr,
              p_gsm    TYPE zmc_table_001-gsm,
              p_email  TYPE zmc_table_001-e_mail,
              p_create RADIOBUTTON GROUP abc,
              p_read   RADIOBUTTON GROUP abc,
              p_update RADIOBUTTON GROUP abc,
              p_delete RADIOBUTTON GROUP abc.
SELECTION-SCREEN END OF BLOCK a1.
