*&---------------------------------------------------------------------*
*& Report ZMG_TEST_286
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_286.
*FS-IntTable-Tablo Satir Oku-Kolonu Ekrana Yazdir
*s.329_Alıştırma – 5: Yeni bir rapor oluşturun ve SFLIGHT tablosunun bütün satırlarını okuyup internal tablo
*içine kaydedin. SFLIGHT tablosu ile ayni satır yapısına sahip yeni bir field sembol oluşturun ve field
*sembolü kullanarak loop edin. İstediğiniz herhangi 3 kolonu ekrana yazdırın.

DATA: gt_sflight TYPE TABLE OF sflight,
      gs_sflight TYPE sflight.

FIELD-SYMBOLS: <fs_sflight> TYPE zmg_tt_sflight2, "1:TT olusturma/2:Basta->Type: Sflight tipinde tanimla ve onunla bir TT olustur
               <fs_str>     TYPE sflight.         "Alternatif: gs_sflight veya <fs_str>

START-OF-SELECTION.

  SELECT * FROM sflight INTO TABLE gt_sflight. "Tüm veriyi gt_sflight icine attik.

  ASSIGN gt_sflight TO <fs_sflight>.

  LOOP AT <fs_sflight> INTO gs_sflight.

    WRITE: gs_sflight-carrid, gs_sflight-connid, gs_sflight-fldate.
    SKIP.
  ENDLOOP.

  LOOP AT <fs_sflight> ASSIGNING <fs_str>.

    WRITE: <fs_str>-carrid, <fs_str>-connid, <fs_str>-fldate.
    SKIP.
  ENDLOOP.
