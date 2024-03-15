*&---------------------------------------------------------------------*
*& Report ZMG_TEST_233
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_233.

PARAMETERS: p_city TYPE city.

DATA: gv_number_n TYPE n LENGTH 2,
      gv_number_i TYPE i,
      gv_msg      TYPE string.

START-OF-SELECTION.

  SELECT COUNT(*) FROM zmg_stravelag
    INTO gv_number_i
    WHERE city = p_city.

  CONCATENATE p_city 'sehrinde bulunan seyahat acentasi sayisi' gv_number_n INTO gv_msg SEPARATED BY space.

  MESSAGE gv_msg TYPE 'I'.
