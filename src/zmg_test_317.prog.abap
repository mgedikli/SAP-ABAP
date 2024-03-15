*&---------------------------------------------------------------------*
*& Report ZMG_TEST_317
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_317.
*Cond – When – Then – Else komutu s.339
*Herhangi bir değişkene veri atarken veya metot kullanımı sırasında herhangi bir veriyi export ederken koşul tanımlanabilmesine imkân veren komuttur.

PARAMETERS : p_number TYPE i.

DATA : gv_day_1 TYPE string,
       gv_day_2 TYPE string.

"7.40 öncesi
CASE p_number.
  WHEN '1'.
    gv_day_1 = 'Pazartesi'.
  WHEN '2'.
    gv_day_1 = 'Salı'.
  WHEN '3'.
    gv_day_1 = 'Çarşamba'.
  WHEN '4'.
    gv_day_1 = 'Perşembe'.
  WHEN '5'.
    gv_day_1 = 'Cuma'.
  WHEN '6'.
    gv_day_1 = 'Cumartesi'.
  WHEN '7'.
    gv_day_1 = 'Pazar'.
  WHEN OTHERS.
    gv_day_1 = 'Geçersiz Gün Numarası Girdiniz!'.
ENDCASE.

WRITE : gv_day_1.

"-------------------------------------------------------------------

"7.40 Sonrası ;

gv_day_2 = COND #( WHEN p_number = 1 THEN 'Pazartesi'
                   WHEN p_number = 2 THEN 'Salı'
                   WHEN p_number = 3 THEN 'Çarşamba'
                   WHEN p_number = 4 THEN 'Perşembe'
                   WHEN p_number = 5 THEN 'Cuma'
                   WHEN p_number = 6 THEN 'Cumartesi'
                   WHEN p_number = 7 THEN 'Pazar'
                   ELSE 'Geçersiz Gün Numarası Girdiniz!' ).

WRITE : / gv_day_2.
