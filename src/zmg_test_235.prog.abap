*&---------------------------------------------------------------------*
*& Report ZMG_TEST_235
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_235.

PARAMETERS: p_name TYPE s_agncynam.

DATA: gt_stravelag TYPE TABLE OF zcm_stravelag,
      gs_stravelag TYPE zcm_stravelag,
      gv_msg       TYPE string.




START-OF-SELECTION.

  SELECT * FROM zcm_stravelag INTO TABLE gt_stravelag
    WHERE name = p_name.

  IF gt_stravelag IS NOT INITIAL.

    DELETE FROM zcm_stravelag WHERE name = p_name.

    IF sy-subrc IS INITIAL.
      LOOP AT gt_stravelag INTO gs_stravelag.

        CONCATENATE gs_stravelag-id  'id sine sahip satir datebase tablosundan silindi' INTO gv_msg.
        MESSAGE gv_msg TYPE 'I'.

      ENDLOOP.

    ENDIF.

  ENDIF.
