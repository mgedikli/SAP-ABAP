*&---------------------------------------------------------------------*
*& Report ZMG_TEST_19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_19.

*Alistimalar s.27
*
*"CONCATENATE
*DATA: gv_ad TYPE string,
*      gv_soyad TYPE string,
*      gv_ad_soyad TYPE string.
*
*gv_ad = 'Mustafa'.
*gv_soyad = 'Gedikli'.
*
*CONCATENATE gv_ad gv_soyad INTO gv_ad_soyad SEPARATED BY space.
*
*
*
*"CONDENSE
*DATA : gv_text TYPE c LENGTH 50.
*
*gv_text = '    Sampiyon   BESIKTAS  '.
*
*CONDENSE gv_text.
*
*WRITE : gv_text.
*
*CONDENSE gv_text NO-GAPS.
*
*WRITE : / gv_text.
*
*
*"REPLACE
*
*DATA : gv_city1 TYPE string,
*       gv_city2 TYPE string.
*
*gv_city1 = 'Manisa'.
*gv_city2 = 'İstanbul'.
*
*REPLACE ALL OCCURRENCES OF 'M' IN gv_city1 WITH 'N'.
*REPLACE ALL OCCURRENCES OF 'b' IN gv_city2 WITH 'K'.
*
*WRITE : gv_city1,
*      / gv_city2.
*
*
*
*"SEARCH
*DATA : gv_atasozu TYPE string.
*
*gv_atasozu = 'Uzum uzume baka baka kararır.'.
*
*SEARCH gv_atasozu FOR 'kara'.
*
*WRITE: sy-subrc , 'Sonuc Olumlu'.
*
*
*
*"SHIFT
*DATA : gv_text_01 TYPE string,
*       gv_text_02 TYPE string,
*       gv_text_03 TYPE string,
*       gv_text_04 TYPE string.
*
*gv_text_01 = '9876543210'.
*gv_text_02 = '9876543210'.
*gv_text_03 = '98765000000'.
*gv_text_04 = '00000098765'.
*
*SHIFT gv_text_01 RIGHT UP TO '43'.
*WRITE: gv_text_01.
*SKIP.
*
*SHIFT gv_text_02 LEFT UP TO '32'.
*WRITE: gv_text_02.
*SKIP.
*
*SHIFT gv_text_03 RIGHT DELETING TRAILING '0'.
*WRITE: gv_text_03.
*SKIP.
*
*SHIFT gv_text_04 LEFT DELETING LEADING '0'.
*WRITE: gv_text_04.
*SKIP.
*
*
*"STRLEN
*
*DATA : gv_text   TYPE string,
*       gv_lenght TYPE i.
*
*gv_text = 'manisa ege bölgesindedir.'.
*
*gv_lenght = strlen( gv_text ).
*
*WRITE : 'Text' , gv_lenght, 'uzunluğundadır.'.
*
*
*"SPLIT
*DATA : gv_text  TYPE string,
*       gv_word1 TYPE string,
*       gv_word2 TYPE string,
*       gv_word3 TYPE string,
*       gv_word4 TYPE string,
*       gv_word5 TYPE string.
*
*gv_text = 'Bugün günlerden perşembe hava yağmurlu'.
*
*SPLIT gv_text AT space INTO gv_word1
*                            gv_word2
*                            gv_word3
*                            gv_word4
*                            gv_word5.
*
*WRITE : gv_word1,
*      / gv_word2,
*      / gv_word3,
*      / gv_word4,
*      / gv_word5.
*
*
*"TRANSLATE
*
*DATA : gv_text1 TYPE string,
*       gv_text2 TYPE string,
*       gv_text3 TYPE string.
*
*
*gv_text1 = 'lenovo pc'.
*gv_text2 = 'CASPER PC'.
*gv_text3 = 'AsUs pC'.
*
*TRANSLATE gv_text1 TO UPPER CASE.
*WRITE: gv_text1.
*SKIP.
*
*TRANSLATE gv_text2 TO LOWER CASE .
*WRITE: gv_text2.
*SKIP.
*
*TRANSLATE gv_text3 TO LOWER CASE .
*WRITE: gv_text3.
*SKIP.
*
*TRANSLATE gv_text3 TO UPPER CASE .
*WRITE: gv_text3.
*SKIP.

*********************************************************************
**********************************************************************
*SAYFA 27 ALISTIRMALAR
*Alistirma-1
*Yeni bir rapor olusturun. Raporda 3 yeni degisken tanimlayin. (Type c ve ya type string).
*Degiskenlerden ilkine adinizi, ikincisine soyadinizi kaydedin.
*Daha sonra ilk 2 degiskendeki degerleri CONCATENATE komutu kullanarak
*3. degisken icerisine kaydedin ve ekrana yazdirin. (Arada bosluk olacak sekilde.)
*
*DATA: gv_ad    TYPE string VALUE 'Mustafa',
*      gv_soyad TYPE string VALUE 'Gedikli',
*      gv_isim TYPE string.
*CONCATENATE gv_ad gv_soyad INTO gv_isim SEPARATED BY space.
*WRITE: gv_isim.
*
***************************************************************
*
*Alistirma-2
*Yeni bir rapor olusturun. Raporda 1 yeni degisken tanimlayin. (Type c ve ya type string).
*Degiskenin icerisine saginda ve solunda bosluklar olacak sekilde bir text bilgisi kaydedin.
*Daha sonra CONDENSE komutu ile bu bosluklarda kurtulup elde edilen degeri ekrana yazdirin.
*
*DATA: gv_metin TYPE string VALUE ' Mustafa       Gedikli   '.
*CONDENSE gv_metin NO-GAPS.
*WRITE: gv_metin.
*
***************************************************************
*
*Alistirma-3
*Yeni bir rapor olusturun. Raporda 2 yeni degisken tanimlayin. (Type c ve ya type string).
*Daha sonra bu degiskenlere birer tane sehir ismi kaydedin.
*Her iki degisken icerisinde bulunan sehir isimlerinin
*istediginiz bir harfini veya bir kismini REPLACE komutu ile degistirin.
*Sonrasinda her iki degiskeni alt alta ekrana yazdirin
*
*DATA: gv_sehir_01 TYPE string VALUE 'Ankara',
*      gv_sehir_02 TYPE string VALUE 'Trabzon'.
*
*REPLACE ALL OCCURRENCES OF 'k' IN gv_sehir_01 WITH 't' RESPECTING CASE.
*WRITE: gv_sehir_01.
*
*REPLACE FIRST OCCURRENCE OF 'bz' IN gv_sehir_02 WITH 'kt' IGNORING CASE.
*WRITE: / gv_sehir_02.
*
***************************************************************
*
*Alistirma-4
*Yeni bir rapor olusturun. Raporda 1 yeni degisken tanimlayin. (Type c ve ya type string).
*Bu degisken icerisine herhangi bir atasözü kaydedin.
*Daha sonra SEARCH komutu kullanarak istediginiz herhangi bir karakteri
*veya kelimeyi bu degisken icerisinde bulmaya calisin.
*Yapilan islemin sonucuna göre sy-subrc bilgisini ekrana alt alta yazdirin.
*
*DATA: gv_atasozu TYPE string VALUE 'Sakla samani gelir zamani.'.
*
*SEARCH gv_atasozu FOR 'akla'.
*WRITE: sy-subrc, 'Sonuc olumlu' .
*
*SEARCH gv_atasozu FOR 'ani' ABBREVIATED.
*WRITE:/ sy-subrc, 'Sonuc olumlu'.
*
*SEARCH gv_atasozu FOR 'eli' STARTING AT 5.
*WRITE:/ sy-subrc, 'Sonuc olumlu'.
*
*SEARCH gv_atasozu FOR 'ama' ENDING AT 12.
*WRITE:/ sy-subrc, 'Sonuc olumlu'.
*
*******************************************************
*
*Alistirma-5
*Yeni bir rapor olusturun. Raporda 4 yeni degisken tanimlayin. (Type c ve ya type string).
*İlk 2 degiskene text formatinda 18 haneli sayilar girin.
*Daha sonra ilk degiskeni saga, ikinci degiskeni sola istediginiz yere kadar SHIFT komutu kullanarak kaydirin.
*3. ve 4. degiskenlere sirasiyla ilk 8 hanesi ve son 8 hanesi sifir olacak sekilde 16 haneli birer sayi kaydedin.
*SHIFT komutu yardimiyla bu sayilardan kurtulun.
*Tüm degiskenleri alt alta ekrana yazdirin.
*
*DATA: gv_text_01 TYPE c LENGTH 12,
*      gv_text_02 TYPE c LENGTH 12,
*      gv_text_03 TYPE c LENGTH 12,
*      gv_text_04 TYPE c LENGTH 12.
*gv_text_01 = '012345678912'.
*gv_text_02 = '012345678912'.
*gv_text_03 = '000001234567'.
*gv_text_04 = '123456700000'.
*
*SHIFT gv_text_01 RIGHT UP TO '34'.
*WRITE: gv_text_01.
*
*SHIFT gv_text_02 LEFT UP TO '56'.
*WRITE: / gv_text_02.
*
*SHIFT gv_text_03 LEFT DELETING LEADING '0'.
*WRITE: / gv_text_03.
*
*SHIFT gv_text_04 RIGHT DELETING TRAILING '0'.
*WRITE: / gv_text_04.
*
***************************************************
*
*Alistirma-6
*Yeni bir rapor olusturun. Raporda 1 yeni degisken tanimlayin. (Type c ve ya type string).
*Degisken icerisine en az 5 kelimeden olusan bir text kaydedin.
*Daha sonra bu kelimeyi ayri ayri iclerine kaydetmek icin 5 yeni degisken daha tanimlayin.
*SPLIT komutu yardimiyla textin her bir kelimesini bir degisken icerisine kaydedin ve ekrana alt alta yazdirin.
*
*DATA: gv_metin_01 TYPE string,
*      gv_mus_01   TYPE string,
*      gv_mus_02   TYPE string,
*      gv_mus_03   TYPE string,
*      gv_mus_04   TYPE string,
*      gv_mus_05   TYPE string.
*gv_metin_01 = 'Hicbirsey sagliktan daha önemli degildir!'.
*
*SPLIT gv_metin_01 AT space INTO gv_mus_01
*                                gv_mus_02
*                                gv_mus_03
*                                gv_mus_04
*                                gv_mus_05.
*WRITE: gv_metin_01,
*     / gv_mus_01,
*     / gv_mus_02,
*     / gv_mus_03,
*     / gv_mus_04,
*     / gv_mus_05.
*
************************************************************
*
*Alistirma-7
*Yeni bir rapor olusturun. Raporda 1 yeni degisken tanimlayin. (Type c veya type string).
*Degisken icerisine herhangi bir text kaydedin.
*STRLEN komutu yardimiyla textin icerisinde kac karakter oldugu aciklamasi ile birlikte ekrana yazdirin.
*(Text icerisinde “n” tane degisken bulunmaktadir).
*
*DATA: gv_metin_01 TYPE string,
*      gv_mus TYPE i.
*gv_metin_01 = 'Basari bir tesadüf degildir.'.
*gv_mus = strlen( gv_metin_01 ).
*WRITE:'Bu metin ' ,gv_mus, ' karakterden oluşmaktadır.'.
*
*********************************************************
*
*Alistirma-8
*Yeni bir rapor olusturun. Raporda 3 yeni degisken tanimlayin. (Type c ve ya type string).
*Ilkine tamamen kücük, ikincisine tamamen büyük, ücüncüsüne ise yarisi kücük yarisi büyük birer text ekleyin.
*Daha sonra TRANSLATE komutu yardimiyla ilk ve son degiskendeki textin tamamini büyük harfe,
*ikinci degiskendeki textin tamamini kücük harfe cevirin ve degiskenleri alt alta ekrana yazdirin.
*
*
*DATA: gv_mus_01 TYPE string VALUE 'mustafa kod yazmayi ögreniyor',
*      gv_mus_02 TYPE string VALUE 'MUSTAFA KOD YAZMAYI ÖGRENIYOR',
*      gv_mus_03 TYPE string VALUE 'mustafa KOD yazmayi ÖGRENIYOR'.
*
*TRANSLATE gv_mus_01 TO LOWER CASE.
*WRITE: gv_mus_01.
*
*TRANSLATE gv_mus_02 TO UPPER CASE.
*WRITE:/ gv_mus_02.
*
*TRANSLATE gv_mus_03 TO UPPER CASE.
*WRITE:/ gv_mus_03.
