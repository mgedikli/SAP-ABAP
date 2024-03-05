*&---------------------------------------------------------------------*
*& Report ZABAP_MG_006C
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_006c.
*TYPE RANGE OF

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_carrid TYPE s_carr_id,
              p_inc1   RADIOBUTTON GROUP abc,
              p_exc1   RADIOBUTTON GROUP abc.
SELECTION-SCREEN END OF BLOCK a1.


SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_connid TYPE s_conn_id,
              p_inc2   RADIOBUTTON GROUP xyz,
              p_exc2   RADIOBUTTON GROUP xyz.
SELECTION-SCREEN END OF BLOCK a2.

TYPES: BEGIN OF gty_carrid,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE s_carr_id,
         high   TYPE s_carr_id,
       END   OF gty_carrid.

TYPES: BEGIN OF gty_connid,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE s_conn_id,
         high   TYPE s_conn_id,
       END   OF gty_connid.

DATA: gs_carrid   TYPE gty_carrid,
      gs_connid   TYPE gty_connid,
      gt_carrid   TYPE RANGE OF s_carr_id,
      gt_connid   TYPE RANGE OF s_conn_id,
      gt_sflight  TYPE TABLE OF sflight,
      gs_sflight  TYPE sflight,
      gv_no_lines TYPE i.

START-OF-SELECTION.

  IF p_carrid IS INITIAL AND p_connid IS INITIAL.
    MESSAGE 'Alanlari bos birakmayiniz.' TYPE 'S' DISPLAY LIKE 'E'.
    LEAVE PROGRAM.
  ENDIF.

  IF  p_carrid IS NOT INITIAL.
    IF p_inc1 IS NOT INITIAL.
      gs_carrid-sign = 'I'.
    ELSE.
      gs_carrid-sign = 'E'.
    ENDIF.
    gs_carrid-option = 'EQ'.
    gs_carrid-low = p_carrid.

    APPEND gs_carrid TO gt_carrid.
    CLEAR: gs_carrid.
  ENDIF.

  IF  p_connid IS NOT INITIAL.
    IF p_inc2 IS NOT INITIAL.
      gs_connid-sign = 'I'.
    ELSE.
      gs_connid-sign = 'E'.
    ENDIF.
    gs_connid-option = 'EQ'.
    gs_connid-low = p_carrid.

    APPEND gs_connid TO gt_connid.
    CLEAR: gs_connid.
  ENDIF.

  SELECT * FROM sflight INTO TABLE gt_sflight
    WHERE carrid IN gt_carrid
    AND   connid IN gt_connid.

  IF gt_sflight IS NOT INITIAL.
    DESCRIBE TABLE gt_sflight LINES gv_no_lines.
    WRITE: 'Satir Sayisi :', gv_no_lines.
    SKIP.

    LOOP AT gt_sflight INTO gs_sflight.
      WRITE: / gs_sflight-carrid, gs_sflight-connid, gs_sflight-price, gs_sflight-fldate.
      CLEAR: gs_sflight.
    ENDLOOP.
  ELSE.
    MESSAGE 'Veri Bulunamadi.' TYPE 'S' DISPLAY LIKE 'E'.

  ENDIF.
