*&---------------------------------------------------------------------*
*& Report ZMG_TEST_66
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_66.

*Alıştırma – 9:
*Yeni bir rapor oluşturun. Rapor içerisinde 1 adet parametre tanımlayın. Kullanıcıdan bir
*uçuş şirketi bilgisi (carrid) alin. Gelen bilgi doğrultusunda rapor içerisinde SPFLI tablosunda uçuş şirketi
*kullanıcının girdiği ile ayni olan satırları çekin. Okunan satir sayısını kullanarak kullanıcıya information
*mesajı verin.

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-002 NO INTERVALS.
*  PARAMETERS: p_carrid TYPE s_carr_id.
*SELECTION-SCREEN END OF BLOCK a1.
*
*DATA: gs_spfli   TYPE spfli,
*      gt_spfli  TYPE TABLE OF spfli,
*      gv_sayac   TYPE n LENGTH 3,
*      gv_msg TYPE string.
*
*START-OF-SELECTION.
*
*  SELECT * FROM spfli INTO TABLE gt_spfli WHERE carrid = p_carrid.
*
"  DESCRIBE TABLE gt_spfli LINES gv_sayac.
*IF sy-subrc IS INITIAL.
* LOOP AT gt_spfli INTO gs_spfli.
*
*    gv_sayac = gv_sayac + 1.
*
*  ENDLOOP.
*
*  gv_msg = TEXT-004.
*  REPLACE ALL OCCURRENCES OF '&1' IN gv_msg WITH gv_sayac RESPECTING CASE.
*  MESSAGE gv_msg TYPE 'I'.
*
*ELSE.
*  MESSAGE TEXT-003 TYPE 'I'.
*ENDIF.

*****************************************************************************************

* Alıştırma – 10:
* Yeni bir rapor oluşturun. Rapor içerisinde 1 adet parametre tanımlayın. Kullanıcıdan
*bir uçuş şirketi bilgisi (carrid) alin. Gelen bilgi doğrultusunda rapor içerisinde SFLIGHT tablosunda uçuş
*şirketi kullanıcının girdiği ile ayni olan satırları çekin. Okunan tüm satırlar içerisindeki toplam koltuk
*sayısını ve satılan koltuk sayısını hesaplayın ve kullanıcıya information mesajı verin. (Seatsmax ve
*Seatsocc kolonları önemli)

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-002 NO INTERVALS.
*  PARAMETERS: p_carrid TYPE s_carr_id.
*SELECTION-SCREEN END OF BLOCK a1.
*
*TYPES: BEGIN OF gty_sflight,
*         gty_seatsmax  TYPE s_seatsmax,
*         gty_seatsocc TYPE s_seatsocc,
*       END OF gty_sflight.
*
*DATA: gs_sflight TYPE gty_sflight,
*      gt_sflight TYPE TABLE OF gty_sflight,
*      gv_topkol  TYPE s_seatsmax,
*      gv_satkol  TYPE s_seatsocc,
*      gv_topkol_str  TYPE string,
*      gv_satkol_str  TYPE string,
*      gv_msg  TYPE string.
*
*START-OF-SELECTION.
*
*  SELECT seatsmax seatsocc FROM sflight INTO TABLE gt_sflight WHERE carrid = p_carrid.
*
*  IF sy-subrc IS INITIAL.
*    LOOP AT gt_sflight INTO gs_sflight.
*
*      gv_topkol = gv_topkol + gs_sflight-gty_seatsmax.
*      gv_satkol = gv_satkol + gs_sflight-gty_seatsocc.
*
*    ENDLOOP.
*
*    gv_msg = TEXT-005.
*    gv_topkol_str = gv_topkol.
*    gv_satkol_str = gv_satkol.
*
*    REPLACE ALL OCCURRENCES OF '&3' IN gv_msg WITH gv_topkol_str RESPECTING CASE.
*    REPLACE ALL OCCURRENCES OF '&4' IN gv_msg WITH gv_satkol_str RESPECTING CASE.
*
*    MESSAGE gv_msg TYPE 'I'.
*
*  ELSE.
*    MESSAGE TEXT-003 TYPE 'I'.
*  ENDIF.
