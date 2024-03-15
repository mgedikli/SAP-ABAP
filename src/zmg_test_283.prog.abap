*&---------------------------------------------------------------------*
*& Report ZMG_TEST_283
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_283.

PARAMETERS: p_num TYPE s_agncynum,
            p_street TYPE s_street.

START-OF-SELECTION.

UPDATE zmg_stravelag SET street      = p_street
                     WHERE agencynum = p_num.
