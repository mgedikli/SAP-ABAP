*&---------------------------------------------------------------------*
*& Report ZMG_TEST_68
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_68.

*Alıştırma – 15:
*Yeni bir rapor oluşturun. Rapor içerisinde 4 adet parametre tanımlayın. Kullanıcıdan bir
*uçuş şirketi bilgisi (carrid) ve 1 ile 100 arasında bir sayı alin. (Ek olarak 2 adet radiobutton oluşturun.
*Birincisi arttırmak için ikincisi ise azaltmak için) Kendi oluşturduğunuz ve SPFLI ile ayni satir yapısına
*sahip olan database tablosunda kullanıcının girdiği uçuş şirketi ile ayni uçuş şirketi bilgisine sahip olan
*satırların “Distance” kolonundaki hücrelerini, kullanıcının girdiği ikinci parametredeki değer kadar
*değiştirin. (Tanımlanan 3 ve 4’üncü parametrelerden hangisi seçildiyse arttırmaya veya azaltmaya
*karar verin). (Set-Update).

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-010 NO INTERVALS.
*  PARAMETERS: p_carrid TYPE s_carr_id OBLIGATORY,
*              p_num    TYPE i OBLIGATORY,
*              p_rdb1   RADIOBUTTON GROUP abc,
*              p_rdb2   RADIOBUTTON GROUP abc.
*SELECTION-SCREEN END OF BLOCK a1.
*
*DATA: gs_spfli        TYPE zmk_table_spfli,
*      gt_spfli        TYPE TABLE OF zmk_table_spfli,
*      gv_distance_new TYPE i.
*
*START-OF-SELECTION.
*
*  IF p_num > 100.
*    MESSAGE TEXT-011 TYPE 'S' DISPLAY LIKE 'E'.
*    EXIT.
*  ENDIF.
*
*  SELECT * FROM zmk_table_spfli INTO TABLE gt_spfli WHERE zmk_carrid = p_carrid.
*
*  IF gt_spfli IS NOT INITIAL.
*    LOOP AT gt_spfli INTO gs_spfli.
*      IF p_rdb1 IS NOT INITIAL.
*        gv_distance_new = gs_spfli-zmk_distance + p_num.
*      ELSEIF p_rdb2 IS NOT INITIAL.
*        gv_distance_new = gs_spfli-zmk_distance - p_num.
*      ENDIF.
*
*      UPDATE zmk_table_spfli SET zmk_distance = gv_distance_new WHERE zmk_carrid = gs_spfli-zmk_carrid AND
*                                                                      zmk_connid = gs_spfli-zmk_connid.
*      CLEAR: gv_distance_new.
*    ENDLOOP.
*ELSE.
*  MESSAGE text-012 TYPE 'S' DISPLAY LIKE 'E'.
*  ENDIF.

********************************************************************************************

*Alıştırma – 16:
*Yeni bir rapor oluşturun. Rapor içerisinde 4 adet parametre tanımlayın. Kullanıcıdan bir
*uçuş şirketi bilgisi (carrid) ve 1 ile 100 arasında bir sayı alin. (Ek olarak 2 adet radiobutton oluşturun.
*Birincisi arttırmak için ikincisi ise azaltmak için) Kendi oluşturduğunuz ve SFLIGHT ile ayni satir yapısına
*sahip olan database tablosunda kullanıcının girdiği uçuş şirketi ile ayni uçuş şirketi bilgisine sahip olan
*satırların “Price” kolonundaki hücrelerini, kullanıcının girdiği ikinci parametredeki değer kadar
*değiştirin. (Tanımlanan 3 ve 4’üncü parametrelerden hangisi seçildiyse arttırmaya veya azaltmaya
*karar verin). (Set-Update).

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-010 NO INTERVALS.
*  PARAMETERS: p_carrid TYPE s_carr_id OBLIGATORY,
*              p_num    TYPE i OBLIGATORY,
*              p_artir   RADIOBUTTON GROUP abc,
*              p_azalt   RADIOBUTTON GROUP abc.
*SELECTION-SCREEN END OF BLOCK a1.
*
*DATA: gs_sflight        TYPE zmk_table_sfligh,
*      gt_sflight        TYPE TABLE OF zmk_table_sfligh,
*      gv_price_new TYPE i.
*
*START-OF-SELECTION.
*
*  IF p_num > 100.
*    MESSAGE TEXT-011 TYPE 'S' DISPLAY LIKE 'E'.
*    EXIT.
*  ENDIF.
*
*  SELECT * FROM zmk_table_sfligh INTO TABLE gt_sflight WHERE zmk_carrid = p_carrid.
*
*  IF gt_sflight IS NOT INITIAL.
*    LOOP AT gt_sflight INTO gs_sflight.
*      IF p_artir IS NOT INITIAL.
*        gv_price_new = gs_sflight-zmk_price + p_num.
*      ELSEIF p_azalt IS NOT INITIAL.
*        gv_price_new = gs_sflight-zmk_price - p_num.
*      ENDIF.
*
*      UPDATE zmk_table_sfligh SET zmk_price = gv_price_new WHERE zmk_carrid = gs_sflight-zmk_carrid AND
*                                                                 zmk_connid = gs_sflight-zmk_connid.
*      CLEAR: gv_price_new.
*    ENDLOOP.
*  ELSE.
*    MESSAGE text-012 TYPE 'S' DISPLAY LIKE 'E'.
*  ENDIF.
