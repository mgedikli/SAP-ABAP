*&---------------------------------------------------------------------*
*& Report ZMG_TEST_218
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_218.

*Sayfa297_Alıştırma – 4: Yeni bir rapor oluşturun ve kullanıcıdan tek bir hücre içerisinde bir şifre alın. Gelen verinin
*bir şifre olup olamayacağını kontrol edin. (Kurallar: içerisinde en az 1 sembol bulunacak. Boşluk
*olmayacak. En az 1 sayı, 1 büyük harf ve 1 de küçük harf bulunacak. En az 8 karakter olacak.)

PARAMETERS: p_sifre TYPE string LOWER CASE.

START-OF-SELECTION.

  SHIFT p_sifre RIGHT DELETING TRAILING space.
  SHIFT p_sifre LEFT DELETING LEADING space.

  IF p_sifre CA '!"§$%&/()=?€'.
    BREAK-POINT.
  ENDIF.

  IF p_sifre CA ' '.
    BREAK-POINT.
  ENDIF.

  IF p_sifre NA '1234567890'.
    BREAK-POINT.
  ENDIF.

  IF p_sifre NA 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
    BREAK-POINT.
  ENDIF.

  IF p_sifre NA 'abcdefghijklmnopqrstuvwxyz'.
    BREAK-POINT.
  ENDIF.

  IF strlen( p_sifre ) < 8.
    BREAK-POINT.
  ENDIF.
