*&---------------------------------------------------------------------*
*& Report ZMG_TEST_255
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_255a MESSAGE-ID zmg_msg_class. "METHOD ve FUNCTION ile
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

*** Fonksiyon içinde Message Class kullanımı s.309
*** SE37/ZMG_FUNCTION_MSG olustur
*** (FUNCTION Group->ZCM_FUNCTION_GROUP_NEW ve Short Tx->Mesaj Tipleri icin Function

  CALL FUNCTION 'ZMG_FUNCTION_MSG'
    EXPORTING
      iv_success     = p_basari
      iv_error       = p_hata
      iv_warning     = p_uyari
      iv_information = p_bilgi.


**********************************************************************A2.
**A2 Yöntem: SE24 Class içinde Message Class kullanımı s.307

*  CREATE OBJECT go_msg_types_mg.
*
*  go_msg_types_mg->show_message(
*    EXPORTING
*      iv_success     =  p_basari
*      iv_error       =  p_hata
*      iv_information =  p_bilgi
*      iv_warning     =  p_uyari ).
