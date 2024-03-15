*&---------------------------------------------------------------------*
*& Report ZMG_TEST_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_10.


*Constant Komutu

"Constant komutu ile kodlama yaparken bazi sabit degiskenler tanimlayabiliriz.
"Constantlar tanimlanirken ayni anda kendilerine bir deger verilir.
"Kodlama icerisinde nerede ihtiyac duyulursa kullanilirlar.
"Constant kullanmamizin en önemli sebebi kodlama yaparken sürekli olarak tek tirnak acip text yazmanin zor olmasi ve performans kaybina sebep olmasidir.
"Ayrica constant icerisindeki deger tanimlama kisminda baska bir deger ile degistirilirse, constantin kullanildigi bütün yerlerdeki degerleri degismis olur.

CONSTANTS: gc_city   TYPE c LENGTH 10 VALUE 'Werne',
           gc_user   TYPE string VALUE 'USER15',
           gc_number TYPE i VALUE 1903,
           gc_numnum TYPE n LENGTH 5 VALUE 123,
           gc_date   TYPE d VALUE '20231130',
           gc_time   TYPE t VALUE '163700',
           gc_pnum   TYPE p DECIMALS 4 VALUE '120.1234'.

WRITE: 'Şehir: ', gc_city,
      / 'Kullanıcı: ', gc_user,
      / 'Numara: ',(4) gc_number,
      / 'Num: ',         gc_numnum,
      / 'Tarih: ', gc_date,
      / 'Zaman: ', gc_time,
      / 'Pnum: ', (4) gc_pnum.
