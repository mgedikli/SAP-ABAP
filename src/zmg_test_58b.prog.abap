*&---------------------------------------------------------------------*
*& Report ZMG_TEST_58B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_58b.
*PARAMETERS-SELECT OPTION-CHECKBOX-RADIOBUTTON-SELECTION SCREEN

*PARAMETERS

TABLES: zmg_pers_t.
DATA: gv_persoyad TYPE zmg_perssoyad_de.
PARAMETERS: p_num1  TYPE int4,
            p_perad TYPE zmg_persad_de.
**************************************************************
SELECT-OPTIONS: s_psoyad FOR gv_persoyad,
                s_perscn FOR zmg_pers_t-personel_cinsiyeti.

**************************************************************

PARAMETERS: p_cbox AS CHECKBOX.

*************************************************************
SELECTION-SCREEN BEGIN OF BLOCK blc1 WITH FRAME TITLE text-001.
PARAMETERS: p_radb1 RADIOBUTTON GROUP abc1,
            p_radb2 RADIOBUTTON GROUP abc1,
            p_radb3 RADIOBUTTON GROUP abc1.
SELECTION-SCREEN END OF BLOCK blc1.

SELECTION-SCREEN BEGIN OF BLOCK blc2 WITH FRAME TITLE text-002.
PARAMETERS: p_radb4 RADIOBUTTON GROUP abc2,
            p_radb5 RADIOBUTTON GROUP abc2.
SELECTION-SCREEN END OF BLOCK blc2.

**************************************************************
