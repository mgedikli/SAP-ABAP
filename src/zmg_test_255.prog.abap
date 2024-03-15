*&---------------------------------------------------------------------*
*& Report ZMG_TEST_255
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_255 MESSAGE-ID zmg_msg_class. " MESSAGE-ID zmg_msg_class (eki) "2. ve 3.Yöntem
*se91 Tcode Message Class  (Mesaj olusturma ve Raporda kullanma YÖNTEMLERi)

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  PARAMETERS : p_basari RADIOBUTTON GROUP abc,
               p_hata   RADIOBUTTON GROUP abc,
               p_uyari  RADIOBUTTON GROUP abc,
               p_bilgi  RADIOBUTTON GROUP abc.

SELECTION-SCREEN END OF BLOCK a1.

"&1 &2 &3 &4  =>WITH ile belirtilen kisimda 4 tane deger

DATA : go_msg_types_mg TYPE REF TO zmessage_types_mg. "A2

START-OF-SELECTION.

**********************************************************************A3.

*  CALL FUNCTION 'ZMG_FUNCTION_MSG'
*    EXPORTING
*      iv_success     = p_basari
*      iv_error       = p_hata
*      iv_warning     = p_uyari
*      iv_information = p_bilgi.


**********************************************************************A2.
**A2 Yöntem: SE24 Class olusturup rapora cagirarak mesaj verme
*  CREATE OBJECT go_msg_types_mg.
*
*  go_msg_types_mg->show_message(
*    EXPORTING
*      iv_success     =  p_basari
*      iv_error       =  p_hata
*      iv_information =  p_bilgi
*      iv_warning     =  p_uyari ).


**********************************************************************1.

  IF p_basari = abap_true.

    MESSAGE s011(zmg_msg_class) WITH '1' 'SUCCESS'. "1.Yöntem -genel kullanim
*    MESSAGE s000. "2.Yöntem
*    MESSAGE s011 WITH '1' 'SUCCESS'. "3. Yöntem (WITH eklenebilir)
*    MESSAGE s011 WITH '1' 'SUCCESS' DISPLAY LIKE 'E'. "3. Yöntem (DISPLAY LIKE 'E' eklenebilir)/RDB ekranindan ayrilip rapor ekranina dönüyor

  ELSEIF p_hata = abap_true.

    MESSAGE e011(zmg_msg_class) WITH '2' 'ERROR'. "1.Yöntem
*    MESSAGE e000. "2.Yöntem
*    MESSAGE e011 WITH '2' 'ERROR'. "3. Yöntem (WITH eklenebilir)

  ELSEIF p_uyari = abap_true.

    MESSAGE w011(zmg_msg_class) WITH '3' 'WARNING'. "1.Yöntem
*    MESSAGE w000. "2.Yöntem
*    MESSAGE w011 WITH '3' 'WARNING'. "3. Yöntem (WITH eklenebilir)

  ELSEIF p_bilgi = abap_true.

    MESSAGE i011(zmg_msg_class) WITH '4' 'INFORMATION'. "1.Yöntem
*    MESSAGE i000. "2.Yöntem
*    MESSAGE i011 WITH '4' 'INFORMATION'. "3. Yöntem (WITH eklenebilir)

  ENDIF.
