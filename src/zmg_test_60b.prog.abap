*&---------------------------------------------------------------------*
*& Report ZMG_TEST_60B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_60b.

*Sayfa 132 Alistirma 2

*Alıştırma – 2: Yeni bir program oluşturun. Program içerisinde, birinci alıştırmada oluşturulan structure
*objesinin her bir alanına karşılık gelecek şekilde 10 adet parametre tanımlayın. Parametrelerden
*gelecek olan veriyi structure objesinin ilgili alanlarına kaydedin. Bu structure objesi ile ayni satir
*yapısına sahip bir internal tablo oluşturun. Doldurduğunuz structure ile internal tablo içerisinde 10
*adet satir oluşturun. Satir oluştururken kullanıcı tarafından girilen fiyatı her defasında 50 EUR arttırın.
*Ayrıca telefon rengini her defasında farklı olacak şekilde düzenleyin. (Case-Endcase sy-index) Daha
*sonra internal tablo içerisinde loop edin ve sadece tek numaralı satırları yazdırın.
*
Tables: ZMG_TABLE_PHONE.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_BRAND  TYPE ZMG_DE_SBRAND   ,
              p_MODEL  TYPE  ZMG_DE_PMODEL  ,
              p_COLOR  TYPE  ZMG_DE_PCOLOR  ,
              p_OPRSYS TYPE  ZMG_DE_POPRS ,
              p_MEMORY TYPE  ZMG_PMEMO ,
              p_SCREEN TYPE  ZMG_PSCREEN,
              p_PRICE  TYPE  ZMG_PPRICE  ,
              p_CURR   TYPE  ZMG_PCURR   ,
              p_DSIM   TYPE  ZMG_DE_PDOBLSIM   ,
              p_WEIGHT TYPE  ZMG_PWEIGHT ,
              p_WUOM   TYPE  ZMG_PWUOM   .
SELECTION-SCREEN END OF BLOCK a1.

DATA:gs_structure TYPE ZMG_STR_PHONE,
      gt_table TYPE TABLE OF ZMG_STR_PHONE.

gs_structure-PHONE_BRAND      = P_BRAND.
gs_structure-PHONE_MODEL      = p_MODEL .
gs_structure-PHONE_COLOR      = p_COLOR .
gs_structure-PHONE_OPR_SYSTEM = p_OPRSYS.
gs_structure-PHONE_MEMORY     = p_MEMORY.
gs_structure-PHONE_SCREEN     = p_SCREEN.
gs_structure-PHONE_PRICE      = p_PRICE .
gs_structure-PHONE_CURR       = p_CURR  .
gs_structure-PHONE_DOBL_SIM = p_DSIM  .
gs_structure-PHONE_WEIGHT     = p_WEIGHT.
gs_structure-PHONE_WUOM       = p_WUOM  .

START-OF-SELECTION.

DO 10 TIMES.
  APPEND gs_structure TO gt_table.
gs_structure-PHONE_PRICE  = gs_structure-PHONE_PRICE + 50.

CASE  sy-index..
  WHEN 1.
    gs_structure-PHONE_COLOR = 'Beyaz'.
  WHEN 2.
    gs_structure-PHONE_COLOR = 'Sarı'.
  WHEN 3.
    gs_structure-PHONE_COLOR = 'Kırmızı'.
  WHEN 4.
    gs_structure-PHONE_COLOR = 'Mavi'.
  WHEN 5.
    gs_structure-PHONE_COLOR = 'Yeşil'.
  WHEN 6.
    gs_structure-PHONE_COLOR = 'Lila'.
  WHEN 7.
    gs_structure-PHONE_COLOR = 'Kahve'.
  WHEN 8.
    gs_structure-PHONE_COLOR = 'Lacivert'.
  WHEN OTHERS.
    gs_structure-PHONE_COLOR = 'Mor'.
ENDCASE.
ENDDO.


LOOP AT gt_table INTO gs_structure.
  IF sy-tabix MOD 2 = 1.
WRITE:  gs_structure-PHONE_BRAND      ,
        gs_structure-PHONE_MODEL      ,
        gs_structure-PHONE_COLOR      ,
        gs_structure-PHONE_OPR_SYSTEM ,
        gs_structure-PHONE_MEMORY     ,
        gs_structure-PHONE_SCREEN     ,
        gs_structure-PHONE_PRICE      ,
        gs_structure-PHONE_CURR       ,
        gs_structure-PHONE_DOBL_SIM ,
        gs_structure-PHONE_WEIGHT     ,
        gs_structure-PHONE_WUOM       .
SKIP. ULINE.
ENDIF.
ENDLOOP.

************************************************************
************************************************************
