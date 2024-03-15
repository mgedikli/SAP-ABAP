*&---------------------------------------------------------------------*
*& Report ZMG_TEST_60A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_60a.

*Sayfa 132- Alistirma 1

*Alıştırma – 1: SE11 işlem kodunu kullanarak bir structure tanımlayın. Bu structure objesinin alanları
*sırasıyla ‘PHONE_BRAND’, ‘PHONE_MODEL’, ‘PHONE_COLOR’, ‘PHONE_OPR_SYSTEM’
*‘PHONE_MEMORY’, ‘PHONE_SCREEN’, ‘PHONE_PRICE’, ‘PHONE_CURR’, ‘PHONE_DOUBLE_SIM’ ve
*‘PHONE_WEIGHT’ olsun. Bütün alanlar icin ayrı ayrı data element oluşturun. Yeni bir program
*oluşturun. Program içerisinde, az önce oluşturduğunuz satiri 1 kere doldurun ve ekrana yazdırın.
**********************************************************************

DATA: gs_structure TYPE zmg_de_mbrand.


gs_structure-phone_brand       = 'IPHONE'.
gs_structure-phone_model       = '15 PRO MAX'.
gs_structure-phone_color       = 'MAVI'.
gs_structure-phone_memory      = 'IOS'.
gs_structure-phone_opr_system  = 'IOS'.
gs_structure-phone_memory      = '256 GB'.
gs_structure-phone_screen      = '6.7 INCH'.
gs_structure-phone_price       = 1250.
gs_structure-phone_curr        = 'EUR'.
gs_structure-phone_dobl_sim    = abap_true.
gs_structure-phone_weight      = 221.
gs_structure-phone_wuom        = 'GR'.


WRITE: gs_structure-phone_brand        ,
     / gs_structure-phone_model        ,
     / gs_structure-phone_color        ,
     / gs_structure-phone_memory       ,
     / gs_structure-phone_opr_system   ,
     / gs_structure-phone_memory       ,
     / gs_structure-phone_screen       ,
     /(5) gs_structure-phone_price     ,
     / gs_structure-phone_curr         ,
     / gs_structure-phone_dobl_sim     ,
     / gs_structure-phone_weight     ,
     / gs_structure-phone_wuom         .
