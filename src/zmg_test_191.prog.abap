*&---------------------------------------------------------------------*
*& Report ZMG_TEST_191
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_191.

"Alistirma-1:
"Yeni bir rapor olusturun. Raporda 1 yeni parametre tanimlayin. (Type c ve ya type string).
"Ayrica “Büyük Harf” ve “Kücük Harf” adinda 2 yeni parametre daha tanimlayin.
"Rapor icerisinde, kullanicidan alinan bilgiye göre, girilen texti ekrana büyük veya kücük harfle yazdirin.
"(Ayrica bu alistirma ve asagidaki alistirmalarin tamaminda parametreleri isimlendirin.)

*PARAMETERS: p_bh TYPE string,
*            p_kh TYPE string.
*WRITE:/ p_bh,
*       p_kh.

***************************************

"Alistirma-2:
"Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type i).
"Rapor icerisinde verilen 2 sayiyi toplayarak ekrana yazdirin.

*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i.
*DATA: gv_top TYPE i.
*gv_top = P_sayi1 + P_sayi2.
*WRITE:'TOPLAM :' ,gv_top.

********************************************

"Alistirma-3:
"Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type i).
"Rapor icerisinde ilk parametrenin ikinci parametreye bölünmesi sonucu ortaya cikan sayiyi ekrana yazdirin.
"(Bölenin sifir olmamasina dikkat edelim. Bu ihtimal olusursa ekrana bir uyari texti yazalim).
*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i.
*DATA: gv_bol TYPE i.
*
*IF p_sayi2 > 0.
*gv_bol = P_sayi1 / P_sayi2.
*WRITE:'TOPLAM :' ,gv_bol.
*ELSEIF p_sayi2 = 0.
*  WRITE: 'Bu işlem yapılamaz'.
*ENDIF.

************************************************

"Alistirma-4: Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type i).
"Ayrica tek karakterli (type c length 1) 1 yeni parametre daha tanimlayin.
"Rapor icerisinde kullanicinin girdigi iki sayiyi ve matematiksel islemi kullanarak elde edilen sayiyi ekrana yazdirin. (Basit hesap makinesi)
*PARAMETERS: p_sayi1 TYPE i,
*            p_sayi2 TYPE i,
*            P_isl   TYPE c LENGTH 1.
*DATA:p_son   TYPE p DECIMALS 2.
*IF p_isl EQ '+'.
*  p_son = p_sayi1 + p_sayi2.
*  WRITE: 'Toplama Sonuç:', p_son.
*  ELSEIF p_isl EQ '-'.
*  p_son = p_sayi1 - p_sayi2.
*  WRITE: 'Çıkarma Sonuç:', p_son.
*  ELSEIF p_isl EQ '*'.
*  p_son = p_sayi1 * p_sayi2.
*  WRITE: 'Çarpma Sonuç:', p_son.
*  ELSEIF p_isl EQ '/' AND p_sayi2 NE 0.
*  p_son = p_sayi1 / p_sayi2.
*  WRITE: 'Bölme Sonuç:', p_son.
*  ELSEIF p_isl EQ '/' AND p_sayi2 EQ 0.
*  WRITE: 'Bu işlem yapılamaz'.
*ENDIF.

**********************************************

"Alistirma-5:
"Yeni bir rapor olusturun. Raporda 1 yeni parametre tanimlayin. (Type c ve ya type string).
"Ayrica yeni bir parametre ile (yine type c ve ya type string ancak daha kisa) kullanicidan kisa bir text daha alin.
"Replace komutu yardimiyla ilk parametrede girilen text icerisinde bulunan
"ikinci parametredeki textleri ücüncü parametre icerisinde bulunan text ile degistirin.

*PARAMETERS: p_text1 TYPE string,
*            p_text2 TYPE string,
*            p_text3 TYPE string.
*REPLACE ALL OCCURRENCES OF p_text2 IN p_text1 WITH p_text3 IGNORING CASE.
*WRITE: p_text1.

*Alistirma-7:
"Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type c ve ya type string).
*Kullanicidan 2 adet text (Parametre 1 ve Parametre 2) alin.
*Daha sonra Concatenate komutu ile bi iki texti birlestirip ekrana yazdirin.
*PARAMETERS: p_par1 TYPE string,
*            p_par2 TYPE string.
*DATA: p_text TYPE string.
*
*CONCATENATE p_par1 p_par2 INTO p_text SEPARATED BY space.
*WRITE: p_text.

"Alistirma-8:
"Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type c ve ya type string).
"Kullanicidan 2 adet text (Parametre 1 ve Parametre 2) alin.
"Ancak nu textlerin basinda ve sonunda bosluklar olsun.
"Daha sonra Condense komutu ile bu bosluklardan kurtulun.
"Concatenate komutu bu iki text birlestirip ekrana yazdirin.

*PARAMETERS: p_par1 TYPE string,
*            p_par2 TYPE string.
*DATA: p_text TYPE string.
*CONDENSE p_par1 NO-GAPS.
*CONDENSE p_par2 NO-GAPS.
*CONCATENATE p_par1 p_par2 INTO p_text SEPARATED BY space.
*WRITE: p_text.

"Alistirma-9:
"Yeni bir rapor olusturun. Raporda 2 yeni parametre tanimlayin. (Type c ve ya type string).
"Kullanicidan uzun ve kisa birer text alin. (Pr. 1 ve Pr. 2)
"Daha sonra Search komutu ile kisa texti uzun text icerisinde aratin.
"Sonucun olumlu veya olumsuz olmasina göre ekrana sonuc bilgisi yazdirin.

*PARAMETERS: p_text TYPE string,
*            p_part TYPE string.
*SEARCH p_text FOR p_part ABBREVIATED.
*WRITE: sy-subrc, 'Sonuç olumlu'.
*
*SEARCH p_text FOR p_part STARTING AT 3.
*WRITE:/ sy-subrc, 'Sonuç olumlu'.
*
*SEARCH p_text FOR p_part ENDING AT 8.
*WRITE:/ sy-subrc, 'Sonuç olumlu'.
*
*SEARCH p_text FOR p_part AND MARK.
*WRITE:/ sy-subrc, 'Sonuç olumlu'.

"Alistirma-11:
"Yeni bir rapor olusturun. Raporda 1 yeni parametre tanimlayin. (Type c ve ya type string).
"Kullanicidan herhangi bir text aldiktan sonra Strlen komutu ile
"girilen textin karakter uzunlugunu hesaplayin ve ekrana yazdirin.
*PARAMETERS: p_text TYPE string.
*DATA: gv_kar TYPE i.
*gv_kar = strlen( p_text ).
*WRITE: 'Tekstimiz ', gv_kar, ' karaterden oluşuyor.'.

"Alistirma-14:
"Yeni bir rapor olusturun. Raporda 1 yeni parametre tanimlayin. (Type c ve ya type string).
"Kullanicidan 1 ögrenci ismi alin. (Sadece isim ve isim-soyisim birlikte).
"Daha sonra raporda 10 tane degisken olusturun ve her bir degiskenin icerisine birer tane isim kaydedin.
"Kullanicinin girdigi ismin raporda bulunan 10 isimden herhangi birisine esit olmasi halinde
"o ögrencinin sinavdan aldigi notu ekrana yazdirin.
"Ögrenci bulunamadiysa, bulunamadigina dair bilgiyi ekrana yazdirin.
"İsim girilmeden rapor calistirildiysa kullanicinin isim girmesi gerektigine dair bilgiyi ekrana yazdirin.

*PARAMETERS: p_isim TYPE string.
*
*DATA: gv_ad_01  TYPE string VALUE 'MEHMET KÖKSAL',
*      gv_not_01 TYPE i VALUE '100',
*      gv_ad_02  TYPE string VALUE 'HABİBE KÖKSAL',
*      gv_not_02 TYPE i VALUE '95',
*      gv_ad_03  TYPE string VALUE 'MURAT KÖKSAL',
*      gv_not_03 TYPE i VALUE '90',
*      gv_ad_04  TYPE string VALUE 'ÖMER KÖKSAL',
*      gv_not_04 TYPE i VALUE '85',
*      gv_ad_05  TYPE string VALUE 'DÖKME KÖKSAL',
*      gv_not_05 TYPE i VALUE '80',
*      gv_ad_06  TYPE string VALUE 'HÜSEYİN KÖKSAL',
*      gv_not_06 TYPE i VALUE '75',
*      gv_ad_07  TYPE string VALUE 'HALİME KÖKSAL',
*      gv_not_07 TYPE i VALUE '70',
*      gv_ad_08  TYPE string VALUE 'HELİME KÖKSAL',
*      gv_not_08 TYPE i VALUE '65',
*      gv_ad_09  TYPE string VALUE 'MERYEM KÖKSAL',
*      gv_not_09 TYPE i VALUE '60',
*      gv_ad_10  TYPE string VALUE 'NURİYE KÖKSAL',
*      gv_not_10 TYPE i VALUE '55'.
*
*IF p_isim EQ gv_ad_01.
*  WRITE: gv_not_01.
*ELSEIF p_isim EQ gv_ad_02.
*  WRITE: gv_not_02.
*ELSEIF p_isim EQ gv_ad_03.
*  WRITE: gv_not_03.
*ELSEIF p_isim EQ gv_ad_04.
*  WRITE: gv_not_04.
*ELSEIF p_isim EQ gv_ad_05.
*  WRITE: gv_not_05.
*ELSEIF p_isim EQ gv_ad_06.
*  WRITE: gv_not_06.
*ELSEIF p_isim EQ gv_ad_07.
*  WRITE: gv_not_07.
*ELSEIF p_isim EQ gv_ad_08.
*  WRITE: gv_not_08.
*ELSEIF p_isim EQ gv_ad_09.
*  WRITE: gv_not_09.
*ELSEIF p_isim EQ gv_ad_10.
*  WRITE: gv_not_10.
*ELSE.
*  WRITE: 'Öğrenci ismi bulunamadı!'.
*ENDIF.

"Alistirma-15:
"Yeni bir rapor olusturun. Raporda 3 yeni parametre tanimlayin. (Type n veya i).
"Daha sonra girilen sayilardan hangisi büyük ise aciklamasiyla birlikte ekrana yazdirin.
PARAMETERS: p_s1 TYPE i,
            p_s2 TYPE i,
            p_s3 TYPE i.
IF p_s1 > p_s2 AND p_s1 > p_s3 .
  WRITE: 'Girdiğiniz sayılardan en büyüğü ilk sayı olan', p_s1, '''dir'.
ELSEIF p_s2 > p_s1 AND p_s2 > p_s3 .
  WRITE: 'Girdiğiniz sayılardan en büyüğü ikinci sayı olan', p_s2, '''dir'.
ELSEIF p_s3 > p_s1 AND p_s3 > p_s2 .
  WRITE: 'Girdiğiniz sayılardan en büyüğü üçüncü sayı olan', p_s3, '''dir'.
ENDIF.
