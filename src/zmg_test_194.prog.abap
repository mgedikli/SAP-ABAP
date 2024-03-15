*&---------------------------------------------------------------------*
*& Report ZMG_TEST_194
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_194.

TYPES: BEGIN OF gty_table,
         carrid    TYPE	s_carr_id,
         carrname  TYPE	s_carrname,
         connid    TYPE	s_conn_id,
         countryfr TYPE  land1,
         cityfrom  TYPE	s_from_cit,
         airpfrom  TYPE	s_fromairp,
       END OF gty_table.

DATA: gt_table_son TYPE TABLE OF gty_table.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_carrnm TYPE s_carrname.
SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  SELECT scarr~carrid, scarr~carrname,
         spfli~connid, spfli~countryfr, spfli~cityfrom, spfli~airpfrom
    INTO TABLE @gt_table_son
    FROM scarr
    INNER JOIN spfli
    ON scarr~carrid = spfli~carrid
    WHERE carrname = @p_carrnm.
BREAK-POINT.
