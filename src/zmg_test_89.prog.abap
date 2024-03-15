*&---------------------------------------------------------------------*
*& Report ZMG_TEST_89
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_89.
*Sayfa 167
*Alıştırma – 5: Yeni bir rapor oluşturun ve kullanıcıdan 4 adet parametre alin. (2 adet BOOKID (SBOOK
*tablosu BOOKID kolonu), 1 adet Radiobutton (Eşittir isminde), 1 adet Radiobutton (Arasında isminde)).
*Parametrelerden gelen veriyi Type Range komutu kullanarak oluşturacağınız Select-Options yapılarına
*aktarın ve SBOOK tablosundan satırları okuyarak ekrana yazdırın.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_bkid1 TYPE s_book_id,
              p_bkid2 TYPE s_book_id,
              p_esit  RADIOBUTTON GROUP rbd,
              p_ara   RADIOBUTTON GROUP rbd.
SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_bookid,
         sign   TYPE c LENGTH 1,
         option TYPE c LENGTH 2,
         low    TYPE s_book_id,
         high   TYPE s_book_id,
       END OF gty_bookid.

DATA: gt_selopt_bookid TYPE RANGE OF s_book_id,
      gs_selopt_bookid TYPE gty_bookid,
      gt_sbook         TYPE TABLE OF sbook,
      gs_sbook          TYPE sbook.

START-OF-SELECTION.

  IF p_esit IS NOT INITIAL.
    IF p_bkid1 IS NOT INITIAL.
      MESSAGE 'Lütfen alani bos birakmayiniz.' TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ELSE.
      gs_selopt_bookid-sign   = 'I'.
      gs_selopt_bookid-option = 'eq'.
      gs_selopt_bookid-low    = p_bkid1.

      APPEND gs_selopt_bookid TO gt_selopt_bookid.
      CLEAR: gs_selopt_bookid.
    ENDIF.
    IF p_bkid2 IS INITIAL.
      MESSAGE 'Lütfen alani bos birakmayiniz.' TYPE 'S' DISPLAY LIKE 'E'.
      EXIT.
    ELSE.
      gs_selopt_bookid-sign   = 'I'.
      gs_selopt_bookid-option = 'eq'.
      gs_selopt_bookid-low    = p_bkid2.

      APPEND gs_selopt_bookid TO gt_selopt_bookid.
      CLEAR: gs_selopt_bookid.
    ENDIF.

  ELSEIF p_ara IS NOT INITIAL.
    gs_selopt_bookid-sign   = 'I'.
    gs_selopt_bookid-option = 'eq'.
    gs_selopt_bookid-low    = p_bkid1.
    gs_selopt_bookid-high   = p_bkid2.

    APPEND gs_selopt_bookid TO gt_selopt_bookid.
    CLEAR: gs_selopt_bookid.
  ENDIF.

  SELECT * FROM sbook
    INTO TABLE gt_sbook
    WHERE bookid IN gt_selopt_bookid.

  LOOP AT gt_sbook INTO gs_sbook.
    WRITE: / 'CARRID       :',  gs_sbook-carrid     ,
           / 'CONNID       :',  gs_sbook-connid     ,
           / 'FLDATE       :',  gs_sbook-fldate     ,
           / 'BOOKID       :',  gs_sbook-bookid     ,
           / 'CUSTOMID     :',  gs_sbook-customid   ,
           / 'CUSTTYPE     :',  gs_sbook-custtype   ,
           / 'SMOKER       :',  gs_sbook-smoker     ,
           / 'LUGGWEIGHT   :',  gs_sbook-luggweight ,
           / 'WUNIT        :',  gs_sbook-wunit      ,
           / 'INVOICE      :',  gs_sbook-invoice    ,
           / 'CLASS        :',  gs_sbook-class      ,
           / 'FORCURAM     :',  gs_sbook-forcuram   ,
           / 'FORCURKEY    :',  gs_sbook-forcurkey  ,
           / 'LOCCURAM     :',  gs_sbook-loccuram   ,
           / 'LOCCURKEY    :',  gs_sbook-loccurkey  ,
           / 'ORDER_DATE   :',  gs_sbook-order_date ,
           / 'COUNTER      :',  gs_sbook-counter    ,
           / 'AGENCYNUM    :',  gs_sbook-agencynum  ,
           / 'CANCELLED    :',  gs_sbook-cancelled  ,
           / 'RESERVED     :',  gs_sbook-reserved   .
    SKIP. ULINE.
  ENDLOOP.
