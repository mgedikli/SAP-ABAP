*&---------------------------------------------------------------------*
*& Report ZMG_TEST_262
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_262a.
**Veri tipi tanımlama esnasında belirlenen field semboller s.324
**1.ASAMA: Önce Tablodaki EUR -> USD ve USD -> EUR'ya dönüstürelim.
*DATA: gt_scarr TYPE TABLE OF scarr,
*      gs_scarr TYPE scarr.
*
*SELECT * FROM scarr INTO TABLE gt_scarr.
*
*LOOP AT gt_scarr INTO gs_scarr.
*
*  IF gs_scarr-currcode = 'USD'.
*     gs_scarr-currcode = 'EUR'.
*
*    MODIFY gt_scarr FROM gs_scarr TRANSPORTING currcode WHERE carrid = gs_scarr-carrid.
*  ELSEIF gs_scarr-currcode = 'EUR'.
*         gs_scarr-currcode = 'USD'.
*
*    MODIFY gt_scarr FROM gs_scarr TRANSPORTING currcode WHERE carrid = gs_scarr-carrid.
*  ENDIF.
*ENDLOOP.
*BREAK-POINT.
********************************************************************************
**2.ASAMA: FIELD SYMBOLS ile Tablodaki EUR -> USD ve USD -> EUR'ya dönüstürelim.
*gs_scarr yerine -> <fs_scarr> kullandik ve bu nedenle MODIFY komutuna gerek kalmadi.

DATA: gt_scarr TYPE TABLE OF scarr.

FIELD-SYMBOLS: <fs_scarr> TYPE scarr.

SELECT * FROM scarr INTO TABLE gt_scarr.

LOOP AT gt_scarr ASSIGNING <fs_scarr>.

  IF <fs_scarr>-currcode = 'USD'.
     <fs_scarr>-currcode = 'EUR'.
  ELSEIF <fs_scarr>-currcode = 'EUR'.
         <fs_scarr>-currcode = 'USD'.
  ENDIF.
ENDLOOP.
BREAK-POINT.
