*&---------------------------------------------------------------------*
*& Report ZMG_TEST_285
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_285.
*Alıştırma – 4: Yeni bir rapor oluşturun. İçinde C, N, D, T, I, P ve String tipinde 7 farklı değişken
*tanımlayın. Daha sonra TYPE ANY komutu yardımıyla yeni bir field sembol tanımlayın. Değişkenleri
*sırayla field sembole assign edin ve ekrana yazdırın. Her yazdırma işleminden sonra unassign komutu
*ile field sembolü kendisine hiçbir değişken atanmamış hale getirin.
*FS:  Alistirma 4_S.329

DATA: gv_1 TYPE c LENGTH 10,
      gv_2 TYPE n  LENGTH 5,
      gv_3 TYPE datum,
      gv_4 TYPE uzeit,
      gv_5 TYPE i,
      gv_6 TYPE p DECIMALS 3,
      gv_7 TYPE string.

FIELD-SYMBOLS: <fs_1> TYPE any.

gv_1 = 'Örnek Text'.
gv_2 = '12345'.
gv_3 = '20240222'.
gv_4 = '185300'.
gv_5 = 100.
gv_6 = 5 / 7.
gv_7 = 'Örnek string tipinde text'.

ASSIGN gv_1 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_2 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_3 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_4 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_5 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_6 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

ASSIGN gv_7 TO <fs_1>.
IF <fs_1> IS ASSIGNED.
  WRITE: <fs_1>.
  UNASSIGN: <fs_1>.
ENDIF.

BREAK-POINT.
