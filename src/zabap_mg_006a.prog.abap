*&---------------------------------------------------------------------*
*& Report ZABAP_MG_006A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_006a.

DATA: gt_spfli TYPE TABLE OF spfli,
      gs_spfli TYPE spfli.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: so_carid FOR gs_spfli-carrid,
                  so_conid FOR gs_spfli-connid.

SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid IN so_carid
                                          AND connid IN so_conid.

  LOOP AT gt_spfli INTO gs_spfli.

    WRITE: gs_spfli-carrid, gs_spfli-connid, gs_spfli-countryfr, gs_spfli-countryto.
    CLEAR: gs_spfli.
    SKIP.

  ENDLOOP.
