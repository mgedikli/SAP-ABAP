*&---------------------------------------------------------------------*
*& Report ZMG_TEST_29
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_29.
"Sayfa 50, Alistirma 1

"Alistirma-3:
"Yeni bir program oluşturun. Program içinde yeni bir parametre oluşturun. (Type c veya string)
"Kullanıcıdan aldığınız texti kullanarak hata mesajı verin.

*PARAMETERS: p_msg TYPE string.
"MESSAGE TEXT-001 TYPE 'S'.
"MESSAGE TEXT-001 TYPE 'I'.
"MESSAGE TEXT-001 TYPE 'E'.

"Alistirma-4:
"Yeni bir program oluşturun. Program içinde 2 parametre oluşturun. (Type i veya n)
"Kullanıcıdan aldığınız küçük sayıya DO_ENDDO döngüsü içerisinde 1 ekleyin.
"Üzerine 1 eklenen sayı, büyük sayıya ulaştığında döngüyü sonlandırın.
"İşlemin kaç döngü neticesinde başarılı olduğuna dair kullanıcıyı bilgilendirin.
**************************************************
**************************************************
*PARAMETERS: p_s1 TYPE i,
*            p_s2 TYPE i.
*DATA: gv_count1 TYPE i,
*      gv_count2 TYPE i,
*      gv_msg TYPE string,
*      gv_s1 TYPE c LENGTH 20,
*      gv_s2 TYPE c LENGTH 20,
*      gv_co1 TYPE c LENGTH 20,
*      gv_co2 TYPE c LENGTH 20.
*
*gv_s1  =  p_s1.
*gv_s2  =  p_s2.

*DO.
*  IF p_s1 < p_s2.
*    p_s1 = p_s1 + 1.
*    gv_count1 = gv_count1 + 1.
*    ELSE.
*      p_s2 = p_s2 + 1.
*      gv_count2 = gv_count2 + 1.
*  ENDIF.
*
* IF p_s1 = p_s2.
*   EXIT.
* ENDIF.
*ENDDO.
*
*gv_co1  = gv_count1.
*gv_co2  = gv_count2.

*IF p_s1 < p_s2.
*    CONCATENATE TEXT-002 gv_s1 TEXT-003 gv_s2 TEXT-004 gv_co1 TEXT-005 INTO gv_msg SEPARATED BY space.
*    MESSAGE gv_msg TYPE 'I'.
*  ELSE.
*    CONCATENATE TEXT-003 gv_s1 TEXT-002 gv_s2 TEXT-004 gv_co1 TEXT-005 INTO gv_msg SEPARATED BY space.
*    MESSAGE gv_msg TYPE 'I'.
*ENDIF.
*******************************************************************
*******************************************************************

*PARAMETERS : p_value1 TYPE i, "Büyük sayıya karşılık gelen değişken 100
*             p_value2 TYPE i. "Küçük sayıya karşılık gelen değişken 7
*
*DATA : gv_count TYPE i.
*
*IF p_value1 > p_value2.
*DO.
*  p_value2 = p_value2 + 1.
*  gv_count = gv_count + 1.
*
*  IF p_value1 = p_value2.
*    EXIT.
*  ENDIF.
*ENDDO.
*
*ELSE.
*  DO.
*    p_value1 = p_value1 + 1.
*    gv_count = gv_count + 1.
*
*    IF p_value1 = p_value2.
*      EXIT.
*    ENDIF.
*  ENDDO.
*
*ENDIF.
*WRITE : 'Girilen iki sayı arasında', gv_count, 'kadar fark bulunmaktadır.'.

**********************************************************************
*Sayfa 50- Alistirma 5
"Yeni bir program oluşturun. Program içinde 2 parametre oluşturun. (Type i veya n)
"Kullanıcıdan aldığınız küçük sayıya, büyük sayıya ulaşana kadar ve ulaştığında sona erecek şekilde,
"WHILE-ENDWHILE döngüsü içerisinde 1 ekleyin.
"İşlemin kaç döngü neticesinde başarılı olduğuna dair kullanıcıyı bilgilendirin.

*PARAMETERS : p_value1 TYPE i,
*             p_value2 TYPE i.
*
*DATA : gv_count TYPE i.
*
*WHILE p_value1 NE p_value2.
*  p_value2 = p_value2 + 1.
*  gv_count = gv_count + 1.
*ENDWHILE.
*
*WRITE : 'Girilen iki sayı arasında', gv_count, 'fark bulunmaktadır.'.
*********************************************************************
*Sayfa 50- Alistirma 5
*PARAMETERS: p_s1 TYPE i,
*            p_s2 TYPE i.
*DATA: gv_count1 TYPE i,
*      gv_count2 TYPE i,
*      gv_msg TYPE string,
*      gv_s1 TYPE c LENGTH 20,
*      gv_s2 TYPE c LENGTH 20,
*      gv_co1 TYPE c LENGTH 20,
*      gv_co2 TYPE c LENGTH 20.
*
*gv_s1  =  p_s1.
*gv_s2  =  p_s2.
*
*WHILE p_s1 = p_s2.
*  IF p_s1 < p_s2.
*    p_s1 = p_s1 + 1.
*    gv_count1 = gv_count1 + 1.
*    ELSE.
*      p_s2 = p_s2 + 1.
*      gv_count2 = gv_count2 + 1.
*  ENDIF.
*ENDWHILE.
*
*gv_co1  = gv_count1.
*gv_co2  = gv_count2.
*
*IF p_s1 < p_s2.
*    CONCATENATE TEXT-002 gv_s1 TEXT-003 gv_s2 TEXT-004 gv_co1 TEXT-005 INTO gv_msg SEPARATED BY space.
*    MESSAGE gv_msg TYPE 'I'.
*  ELSEIF p_s1 > p_s2 .
*    CONCATENATE TEXT-003 gv_s2 TEXT-002 gv_s1 TEXT-004 gv_co2 TEXT-005 INTO gv_msg SEPARATED BY space.
*    MESSAGE gv_msg TYPE 'I'.
*ENDIF.

**********************************************************************
"Alıştırma 6
"Yeni bir program oluşturun. Program içinde yeni bir parametre oluşturun. (Type c veya string)
"Parametrenin ismi ‘Renk:’ olsun. Kullanıcının girdiği rengin İngilizce karşılığını CASE-ENDCASE
"komutu kullanarak bulun ve kullanıcıya girilen kelimenin karşılığını bilgi mesajı olarak verin.

*PARAMETERS: p_renk TYPE string.
*DATA: gv_renk TYPE string,
*      gv_msg TYPE string.
*
*TRANSLATE p_renk TO UPPER CASE.
*
*CASE p_renk.
*  WHEN 'BEYAZ'.
*    gv_renk = 'WEIß'.
*  WHEN 'SİYAH'.
*    gv_renk = 'SCHWARZ'.
*  WHEN 'KIRMIZI'.
*    gv_renk = 'ROT'.
*  WHEN 'SARI'.
*    gv_renk = 'GELB'.
*  WHEN 'MAVİ'.
*    gv_renk = 'BLAU'.
*  WHEN OTHERS.
*    WRITE: 'Aradığınız renk bulunamadı.'.
*ENDCASE.
*
*MESSAGE gv_renk TYPE 'I'.
****************************************************************
*Alistirma 6
*PARAMETERS : p_color TYPE string.
*DATA : gv_color TYPE c LENGTH 10,
*       gv_msg   TYPE string.
*
*CASE p_color.
*  WHEN 'KIRMIZI'.
*    gv_color = 'RED'.
*  WHEN 'BEYAZ'.
*    gv_color = 'WHITE'.
*  WHEN 'SIYAH'.
*    gv_color = 'BLACK'.
*  WHEN 'SARI'.
*    gv_color = 'YELLOW'.
*  WHEN OTHERS.
*    MESSAGE 'Ekrandan girilen rengin karşılığı bulunamamıştır.' TYPE 'S' DISPLAY LIKE 'E'.
*ENDCASE.
*
*IF gv_color IS NOT INITIAL.
*
*  CONCATENATE TEXT-001 gv_color INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'I'.
*
*ENDIF.

**********************************************************************
"Alistirma-7: Yeni bir program oluşturun. Program içinde 3 parametre oluşturun. (Type n veya i,sonuncusu 1 karakter).
"Kullanıcıdan aldığınız 2 sayı ve 1 matematiksel işlem karakterini
"CASE_ENDCASE kullanarak ile sonucu hesaplayıp kullanıcıya information veya success mesajı verin.

*PARAMETERS: p_s1  TYPE i,
*            p_s2  TYPE i,
*            p_kar TYPE c LENGTH 1.
*DATA: gv_sonuc TYPE p DECIMALS 2,
*      gv_son TYPE string,
*      gv_msg TYPE string.
*CASE p_kar.
*  WHEN '+'.
*    gv_sonuc = p_s1 + p_s2.
*  WHEN '-'.
*    gv_sonuc = p_s1 - p_s2.
*  WHEN '/'.
*    gv_sonuc = p_s1 / p_s2.
*  WHEN '*'.
*    gv_sonuc = p_s1 * p_s2.
*  WHEN OTHERS.
*    MESSAGE 'Lütfen geçerli bir işlem karakteri giriniz.' TYPE 'I'.
*ENDCASE.
*
*IF gv_sonuc IS NOT INITIAL.
*gv_son = gv_sonuc.
*CONCATENATE TEXT-001 gv_son INTO gv_msg SEPARATED BY space.
*MESSAGE gv_msg TYPE 'S'.
*ENDIF.
****************************************************************
"Alıştırma 7
*
*PARAMETERS : p_dgr1  TYPE i,
*             p_dgr2  TYPE i,
*             p_islem TYPE c LENGTH 1.
*
*DATA : gv_sonuc        TYPE i,
*       gv_sonuc_string TYPE string,
*       gv_msg          TYPE string.
*
*CASE p_islem.
*  WHEN '*'.
*    gv_sonuc = p_dgr1 * p_dgr2.
*  WHEN '/'.
*    gv_sonuc = p_dgr1 / p_dgr2.
*  WHEN '+'.
*    gv_sonuc = p_dgr1 + p_dgr2.
*  WHEN '-'.
*    gv_sonuc = p_dgr1 - p_dgr2.
*  WHEN OTHERS.
*    MESSAGE 'Girilen islem tipi gecersizdir.' TYPE 'I'.
*ENDCASE.
*
*IF gv_sonuc IS NOT INITIAL.
*  gv_sonuc_string = gv_sonuc.
*  CONCATENATE TEXT-002 gv_sonuc_string INTO gv_msg SEPARATED BY space.
*  MESSAGE gv_msg TYPE 'S'.
*ENDIF.
