*&---------------------------------------------------------------------*
*& Report ZMG_TEST_40
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_40.

*KONU; READ TABLE Komutu:

TYPES: BEGIN OF gty_structure,
         plaka_no    TYPE c LENGTH 10,
         marka       TYPE c LENGTH 20,
         model       TYPE string,
         renk        TYPE c LENGTH 12,
         motor_cc    TYPE n LENGTH 4,
         uretim_yili TYPE c LENGTH 4,
         fiyat       TYPE i,
         kilometre   TYPE i,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE TABLE OF gty_structure.

START-OF-SELECTION.

  gs_structure-plaka_no    = '34 AB 2025'.
  gs_structure-marka       = 'Citroen'.
  gs_structure-model       = 'Picasso'.
  gs_structure-renk        = 'Lacivert'.
  gs_structure-motor_cc    = 1600.
  gs_structure-uretim_yili = '2015'.
  gs_structure-fiyat       = 15000.
  gs_structure-kilometre   = 80000.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-plaka_no    = '23 DE 3476'.
  gs_structure-marka       = 'volvo'.
  gs_structure-model       = 'S40'.
  gs_structure-renk        = 'Beyaz'.
  gs_structure-motor_cc    = 2000.
  gs_structure-uretim_yili = '2020'.
  gs_structure-fiyat       = 14000.
  gs_structure-kilometre   = 50000.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-plaka_no    = '56 TR 2837'.
  gs_structure-marka       = 'Renault'.
  gs_structure-model       = 'Broadway'.
  gs_structure-renk        = 'Gri'.
  gs_structure-motor_cc    = 1400.
  gs_structure-uretim_yili = '1995'.
  gs_structure-fiyat       = 1000.
  gs_structure-kilometre   = 300000.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-plaka_no    = '47 KH 2894'.
  gs_structure-marka       = 'Mercedes'.
  gs_structure-model       = 'C180'.
  gs_structure-renk        = 'Krem'.
  gs_structure-motor_cc    = 1800.
  gs_structure-uretim_yili = '2018'.
  gs_structure-fiyat       = 20000.
  gs_structure-kilometre   = 70000.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-plaka_no    = '16 ZR 9687'.
  gs_structure-marka       = 'Audi'.
  gs_structure-model       = 'A3'.
  gs_structure-renk        = 'Siyah'.
  gs_structure-motor_cc    = 2000.
  gs_structure-uretim_yili = '2014'.
  gs_structure-fiyat       = 4000.
  gs_structure-kilometre   = 120000.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

"Hangisi oldugu bilinmeyen, Kayitli bir satirin bazi bilgilerini güncelleme

  gs_structure-plaka_no    = '16 ZR 9687'.
  gs_structure-marka       = 'Audi'.
  gs_structure-model       = 'A3'.
  gs_structure-renk        = 'Kirmizi'.
  gs_structure-motor_cc    = 3000.
  gs_structure-uretim_yili = '2014'.
  gs_structure-fiyat       = 4000.
  gs_structure-kilometre   = 120000.

  MODIFY gt_table FROM gs_structure TRANSPORTING renk motor_cc WHERE plaka_no = gs_structure-plaka_no.
*  MODIFY gt_table FROM gs_structure TRANSPORTING renk motor_cc WHERE plaka_no = '34 RR 456'. "Mesaj olustur (MESSAGE text-001 TYPE 's' DISPLAY LIKE 'E'.)
* 001 üzerine cift tiklayarak - Create Program Text- tablosuna girerek TYPE text olustur.

  IF sy-subrc IS INITIAL.
    READ TABLE gt_table INTO gs_structure WITH KEY plaka_no = gs_structure-plaka_no.
    IF sy-subrc IS INITIAL.
      WRITE: gs_structure-plaka_no,  gs_structure-marka,  gs_structure-model, gs_structure-renk,
         gs_structure-motor_cc, gs_structure-uretim_yili, gs_structure-fiyat, gs_structure-kilometre.
    ENDIF.

    CLEAR: gs_structure.
  ELSE.
    MESSAGE text-001 TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.
