*&---------------------------------------------------------------------*
*& Report ZABAP_MG_009
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_009.

TYPES : BEGIN OF ty_user,
          adi    TYPE char20,
          soyadi TYPE char20,
          sinif  TYPE i,
        END OF ty_user.

DATA : lt_user  TYPE TABLE OF ty_user,
       ls_user  TYPE ty_user,
       lv_deger TYPE i.

*******************************************************

CLEAR: ls_user.
ls_user-adi     = 'Eren'.
ls_user-soyadi  = 'Karayel'.
ls_user-sinif   = 1.
APPEND ls_user TO lt_user.

CLEAR: ls_user.
ls_user-adi     = 'Derya'.
ls_user-soyadi  = 'Özkan'.
ls_user-sinif   = 3.
APPEND ls_user TO lt_user.

CLEAR: ls_user.
ls_user-adi     = 'Süleyman'.
ls_user-soyadi  = 'Koc'.
ls_user-sinif   = 0.
APPEND ls_user TO lt_user.

CLEAR: ls_user.
ls_user-adi     = 'Medine'.
ls_user-soyadi  = 'Er'.
ls_user-sinif   = 2.
APPEND ls_user TO lt_user.

***************************************************

LOOP AT lt_user INTO ls_user.

  IF ls_user-sinif EQ 1. "1 sınıf mı diye kontrol et
    WRITE:/ ls_user-adi, ls_user-soyadi, '1.Sınıf'.

  ELSEIF ls_user-sinif EQ 2. "2 sınıf mı diye kontrol et
    WRITE:/ ls_user-adi, ls_user-soyadi, '2.Sınıf'.

  ELSEIF ls_user-sinif EQ 3. "3 sınıf mı diye kontrol et
    WRITE:/ ls_user-adi, ls_user-soyadi, '3.Sınıf'.

  ELSE. "eğer sınıfı yok ise yani diğer koşullara uymuyor ise else durumundaki işlemi yap
    WRITE:/ ls_user-adi, ls_user-soyadi,
    'Öğrenci için sınıf bulunamadı!!!'.
  ENDIF.

  "sadece tek alan kontrol ediliği için case kullanmak daha mantıklı
  CASE ls_user-sinif.
    WHEN '1'.
      WRITE:/ ls_user-adi, ls_user-soyadi, '1.Sınıf', 'CASE'.

    WHEN '2'.
      WRITE:/ ls_user-adi, ls_user-soyadi, '2.Sınıf' , 'CASE'.

    WHEN '3'.
      WRITE:/ ls_user-adi, ls_user-soyadi, '3.Sınıf' , 'CASE'.

    WHEN OTHERS.
      WRITE:/ ls_user-adi, ls_user-soyadi,
      'Öğrenci için sınıf bulunamadı!!!' , 'CASE'.
  ENDCASE.
ENDLOOP.
ULINE.
*************************************************************************************************

lv_deger = 25.

IF lv_deger LT 25.
  WRITE: / 'Değer 25 den küçük'.

ELSEIF lv_deger EQ 25.
  WRITE: / 'Değer 25'.

ELSEIF lv_deger GT 25.
  WRITE: / 'Değer 25 den büyük'.

ENDIF.
ULINE.
******************************************************************************************

LOOP AT lt_user INTO ls_user.

  IF ls_user-sinif EQ 1 OR ls_user-sinif EQ 2.
    WRITE:/ ls_user-adi, ls_user-soyadi, '1. veya 2. sınıf.'.

  ELSEIF ls_user-sinif EQ 3 AND ls_user-adi EQ 'Derya'.
    WRITE:/ ls_user-adi, ls_user-soyadi, '3. sınıf'.

  ENDIF.

  "birden fazla farklı anları ayrı senaryolarda kullanıldığı için if kullanmak mantıklı

  CASE ls_user-sinif.
    WHEN '1' OR '2'.
      WRITE:/ ls_user-adi, ls_user-soyadi, '1. veya 2. sınıf.' , 'CASE'.

    WHEN '3'.

      CASE ls_user-adi.
        WHEN 'Derya'.
          WRITE:/ ls_user-adi, ls_user-soyadi, '3. sınıf' , 'CASE'.
      ENDCASE.

  ENDCASE.

ENDLOOP.

BREAK-POINT.
