*&---------------------------------------------------------------------*
*& Report ZMG_TEST_70
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_70.

*Alıştırma – 18: Yeni bir rapor oluşturun. Rapor içerisinde 1 adet parametre tanımlayın. Kullanıcıdan bir
*Country alin. Kendi oluşturduğunuz ve SPFLI ile ayni satir yapısına sahip olan database tablosunda
*kullanıcının girdiği Country ile ayni Country bilgisine sahip olan satırları kalıcı olarak silin. (Delete)
*.

*REPORT zgi_test_30.

*SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
*
*  PARAMETERS : p_countr TYPE zgi_spfli-countryfr OBLIGATORY.
*
*SELECTION-SCREEN END OF BLOCK a1.
*
*DATA: gs_scarr TYPE zgi_spfli,
*      gt_scarr TYPE TABLE OF zgi_spfli.
*
*START-OF-SELECTION.
*
*  SELECT * FROM zgi_spfli INTO TABLE gt_scarr.
*  IF p_countr IS NOT INITIAL.
*
*
*    LOOP AT gt_scarr INTO gs_scarr.
*
*      DELETE FROM ZGI_SPFLI WHERE COUNTRYFR = p_countr.
*
*    ENDLOOP.
*  ELSE.
*    MESSAGE TEXT-001 TYPE 'I'.
*  ENDIF.
*****************************************************************************
*****************************************************************************
*Alıştırma – 19:
*Yeni bir rapor oluşturun. Rapor içerisinde 3 adet parametre tanımlayın. Kullanıcıdan bir
*Fldate alin. 2 ve 3’üncü parametreler radiobutton olsun. İlki girilen tarihten büyük, ikincisi ise girilen
*tarihten küçük seklinde isimlendirilsin. Kendi oluşturduğunuz ve SFLIGHT ile ayni satir yapısına sahip
*olan database tablosunda kullanıcının girdiği Fldate bilgisinden önce veya sonra olanları (öncesinin
*veya sonrasının silineceği 2 ve 3’üncü parametrelere göre belirlenecektir) kalıcı olarak silin. (Delete)

*SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-013 NO INTERVALS.
*  PARAMETERS: p_fldate TYPE S_DATE,
*              p_buyuk RADIOBUTTON GROUP abc,
*              p_kucuk RADIOBUTTON GROUP abc.
*SELECTION-SCREEN END OF BLOCK a2.
*
**DATA: gs_sflight TYPE ZMK_TABLE_SFLIGH,
**      gt_sflight TYPE TABLE OF ZMK_TABLE_SFLIGH.
*
*START-OF-SELECTION.
*
*IF p_fldate IS INITIAL.
*  MESSAGE TEXT-014 TYPE 'S' DISPLAY LIKE 'E'.
*  EXIT.
*ENDIF.
*
*IF p_buyuk = abap_true.
*  DELETE FROM ZMK_TABLE_SFLIGH WHERE ZMK_FLDATE > p_fldate.
*  MESSAGE TEXT-016 TYPE 'I'.
*ELSEIF p_kucuk = abap_true.
*  DELETE FROM ZMK_TABLE_SFLIGH WHERE ZMK_FLDATE < p_fldate.
*  MESSAGE TEXT-016 TYPE 'I'.
*ELSE.
*  MESSAGE TEXT-015 TYPE 'S' DISPLAY LIKE 'E'.
*ENDIF.
