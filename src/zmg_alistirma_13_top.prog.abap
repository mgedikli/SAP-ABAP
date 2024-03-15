*&---------------------------------------------------------------------*
*& Include          ZMG_ALISTIRMA_13_TOP
*&---------------------------------------------------------------------*

DATA: gs_scarr   TYPE scarr,
      gs_spfli   TYPE spfli,
      gs_sflight TYPE sflight,
      gt_scarr   TYPE TABLE OF scarr,
      gt_spfli   TYPE TABLE OF spfli,
      gt_sflight TYPE TABLE OF sflight.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: so_carid FOR gs_scarr-carrid.
SELECTION-SCREEN END OF BLOCK a1.
