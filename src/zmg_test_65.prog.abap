*&---------------------------------------------------------------------*
*& Report ZMG_TEST_65
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_65.
*Alıştırma – 8: Yeni bir rapor oluşturun. Rapor içerisinde 1 adet parametre tanımlayın. Kullanıcıdan bir
*uçuş şirketi bilgisi (carrid) alin. Gelen bilgi doğrultusunda rapor içerisinde SCARR, SPFLI ve SFLIGHT
*database tablolarından uçuş şirketi kullanıcının girdiği ile ayni olan satırları çekerek ekrana yazdırın.

*Yeni bir rapor oluşturma ve icerisine parametre tanimlama
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
***PARAMETERS: p_carrid TYPE spfli-carrid.  Alternatif tanimlama.
***  PARAMETERS: p_carrid TYPE sflight-carrid. Alternatif tanimlama.
**
***  PARAMETERS: p_2 type c LENGTH 3. Alternatif tanimlama.s_carr_id ile type c ve length 3 bilgisi ayni olmak zorunda;
                                  "farki: calistirildiginda yaninda arama kulakcigi acilmaz. Bu dezavantaj.
PARAMETERS: p_3 TYPE s_carr_id.  "Alternatif tanimlama. scarr tablosunda carrier id DE "S_CARR_ID" koyala ve yapistir.

SELECTION-SCREEN END OF BLOCK a1.

DATA: gs_scarr   TYPE scarr,
      gs_spfli   TYPE spfli,
      gs_sflight TYPE sflight,
      gt_scarr   TYPE TABLE OF scarr,
      gt_spfli   TYPE TABLE OF spfli,
      gt_sflight TYPE TABLE OF sflight.

START-OF-SELECTION.


*  SELECT * FROM scarr   INTO TABLE gt_scarr   WHERE carrid = p_carrid.
*  SELECT * FROM spfli   INTO TABLE gt_spfli   WHERE carrid = p_carrid.
*  SELECT * FROM sflight INTO TABLE gt_sflight WHERE carrid = p_carrid.

  LOOP AT gt_scarr INTO gs_scarr.
    WRITE: / gs_scarr-carrid,
             gs_scarr-carrname,
             gs_scarr-currcode,
             gs_scarr-url.
    SKIP.
    CLEAR: gs_scarr.
  ENDLOOP.

  LOOP AT gt_spfli INTO gs_spfli.
    WRITE: / gs_spfli-carrid,
             gs_spfli-connid,
             gs_spfli-countryfr,
             gs_spfli-cityfrom,
             gs_spfli-airpfrom,
             gs_spfli-countryto,
             gs_spfli-cityto,
             gs_spfli-airpto,
             gs_spfli-fltime,
             gs_spfli-deptime,
             gs_spfli-arrtime,
             gs_spfli-distance,
             gs_spfli-distid,
             gs_spfli-fltype,
             gs_spfli-period.
    SKIP.
    CLEAR: gs_spfli.
  ENDLOOP.

  LOOP AT gt_sflight INTO gs_sflight.
    WRITE: / gs_sflight-carrid,
             gs_sflight-connid,
             gs_sflight-fldate,
             gs_sflight-price,
             gs_sflight-currency,
             gs_sflight-planetype,
             gs_sflight-seatsmax,
             gs_sflight-seatsocc,
             gs_sflight-paymentsum,
             gs_sflight-seatsmax_b,
             gs_sflight-seatsocc_b,
             gs_sflight-seatsmax_f.
    SKIP.
    CLEAR: gs_sflight.
  ENDLOOP.
