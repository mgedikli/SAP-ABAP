*&---------------------------------------------------------------------*
*& Report ZABAP_MG_008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_008.
"sogrulama işlemi için internal tablo oluşturuyoruz
"loop döngüsü için structure oluşturuyoruz
DATA: lt_spfli  TYPE TABLE OF spfli,
      ls_spfli  TYPE spfli,
      lv_deger  TYPE i,
      lv_deger2 TYPE i.

"veritabanından sorgulama yapıp program akışına devam etmek için
"kullacıya seçim yapması için parametre oluşturuyoruz
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_carrid TYPE spfli-carrid OBLIGATORY DEFAULT 'LH'.

SELECTION-SCREEN END OF BLOCK b1.

"kullnıcıdan bilgileri aldıktan sonra programa devam etiğinde
"çalışacağı kısmı belirtiyoruz

START-OF-SELECTION.
**********************************************************************
  "veritabanına sorgu atıyoruz
  SELECT * FROM spfli INTO TABLE lt_spfli
           WHERE carrid EQ p_carrid.
**********************************************************************
  "LOOP döngüsü
  "internal tablodaki kayıt kadar döngüye girer ve her kalem bilgisini
  " structure içerisine atar
  LOOP AT lt_spfli INTO ls_spfli.

    WRITE:/ 'Ucus no:', ls_spfli-connid,
            'Kalkis:' , ls_spfli-cityfrom,
            'Varis:'  , ls_spfli-cityto.
  ENDLOOP.
  ULINE.
*************************************************
  "Loop döngüsünde belirli bir koşula göre döngüye girme
  "uçuş uzaklığı 1000'e eşit ve büyük olanları yazdır demiş olduk
  LOOP AT lt_spfli INTO ls_spfli WHERE distance GE '1000'.

    WRITE:/ 'Ucus no:', ls_spfli-connid,
            'Kalkis:' , ls_spfli-cityfrom,
            'Varis:'  , ls_spfli-cityto,
            'Uzaklik:', ls_spfli-distance.

  ENDLOOP.
  ULINE.
**********************************************************************
  "loop döngüsünde birden fazla koşul verebiliyoruz.Bir önceki koşula ek olarak
  "Kalkış ülke bilgisi Almanya olanları getir demiş olduk
  LOOP AT lt_spfli INTO ls_spfli WHERE distance GE '1000'
                                 AND countryfr EQ 'DE'.

    WRITE:/ 'Ucus no:', ls_spfli-connid,
             'Kalkis:' , ls_spfli-cityfrom,
             'Varis:'  , ls_spfli-cityto,
             'Uzaklik:', ls_spfli-distance.
  ENDLOOP.
  ULINE.
***********************************************************************
"LOOP döngüsünde sadece istemiş olduğumuz değere sahip veriyi kontrol edip
"yazdırma işlemi yapma:CHECK ile veri uyuşmuyorsa
"döngü bir sonraki kalemde devam edecek şekilde yürütülür
  LOOP AT lt_spfli INTO ls_spfli.

    CHECK ls_spfli-distance EQ '555'.

    WRITE:/  'Ucus no:', ls_spfli-connid,
             'Kalkis:' , ls_spfli-cityfrom,
             'Varis:'  , ls_spfli-cityto,
             'Uzaklik:', ls_spfli-distance.

  ENDLOOP.
  ULINE.
**************************************************************************
  "LOOP döngüsünde sadece istemiş olduğumuz değere sahip veriyi kontrol edip
  "yazdırma işlemi yapma:CONTINUE ile istemediğimiz kalemi
  "sonraki kalemde devam et şeklinde yürütür

  LOOP AT lt_spfli INTO ls_spfli.

    IF ls_spfli-countryto NE 'US'.
      CONTINUE.

    ENDIF.

    WRITE:/     'Ucus no:', ls_spfli-connid,
                'Kalkis:' , ls_spfli-cityfrom,
                'Varis:'  , ls_spfli-cityto,
                'Uzaklik:', ls_spfli-distance.
  ENDLOOP.
  ULINE.
**********************************************************************
"LOOP döngüsünde bir veriyi kontrol edip o değere eşit ise döngüyü sonlandır diyebiliriz
"Sadece eşitlik değil;büyük,küçük veya eşit olmama gibi durumlarıda kontrol edebiliriz

  LOOP AT lt_spfli INTO ls_spfli.

    IF ls_spfli-airpfrom EQ 'JFK'.
      EXIT.
    ENDIF.

    WRITE:/    'Ucus no:', ls_spfli-connid,
               'Kalkis:' , ls_spfli-cityfrom,
               'Varis:'  , ls_spfli-cityto,
               'Uzaklik:', ls_spfli-distance.
  ENDLOOP.
  ULINE.
**************************************************************************
  "DO ile istediğimiz kadar döngü yapıyoruz
  "belirlediğimiz sayıya ulaştığında döngü sonlanıyor

  DO 5 TIMES.
    "lv_deger = lv_deger + 1. veya
    ADD 1 TO lv_deger.

    WRITE:/ 'Do:' , lv_deger.
  ENDDO.
  ULINE.
**************************************************************************
  "WHILE döngüsü ile değişken istemiş olduğumuz kurala uyduğu sürece çalışır
  WHILE lv_deger2 LT 5.
    ADD 1 TO lv_deger2.

    WRITE:/ 'While:', lv_deger2.
  ENDWHILE.
  BREAK-POINT.
