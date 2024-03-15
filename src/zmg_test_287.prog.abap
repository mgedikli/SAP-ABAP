*&---------------------------------------------------------------------*
*& Report ZMG_TEST_287
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_287.
*Alıştırma – 6: Yeni bir rapor oluşturun ve SFLIGHT tablosunun bütün satırlarını okuyup internal tablo
*içine kaydedin. TYPE ANY TABLE komutu yardımıyla yeni bir field sembol oluşturun ve field sembolü
*kullanarak loop edin. İstediğiniz herhangi 3 kolonu ekrana yazdırın.
*FS Tüm satırları oku IT'ya kaydet Loop 3 Kolonu ekrana yazdir.

DATA: gt_sflight TYPE TABLE OF sflight,
      gs_sflight TYPE sflight.

FIELD-SYMBOLS: <fs_sflight> TYPE ANY TABLE,
               <fs_str>     TYPE any,
               <fs_hucre> TYPE ANY.

START-OF-SELECTION.

  SELECT * FROM sflight INTO TABLE gt_sflight.

  ASSIGN gt_sflight TO <fs_sflight>.

  LOOP AT <fs_sflight> ASSIGNING <fs_str>.

    ASSIGN COMPONENT 'CARRID' OF STRUCTURE <fs_str> to <fs_hucre>.
    IF <fs_hucre> IS ASSIGNED.
      WRITE: <fs_hucre>.
      UNASSIGN: <fs_hucre>.
    ENDIF.

    ASSIGN COMPONENT 'CONNID' OF STRUCTURE <fs_str> to <fs_hucre>.
    IF <fs_hucre> IS ASSIGNED.
      WRITE: <fs_hucre>.
      UNASSIGN: <fs_hucre>.
    ENDIF.

    ASSIGN COMPONENT 'FLDATE' OF STRUCTURE <fs_str> to <fs_hucre>.
    IF <fs_hucre> IS ASSIGNED.
      WRITE: <fs_hucre>.
      UNASSIGN: <fs_hucre>.
    ENDIF.

    SKIP.
  ENDLOOP.











*  LOOP AT <fs_sflight> INTO gs_sflight.
*
*    WRITE: gs_sflight-carrid, gs_sflight-connid, gs_sflight-fldate.
*    SKIP.
*  ENDLOOP.
*
*  LOOP AT <fs_sflight> ASSIGNING <fs_str>.
*
*    WRITE: <fs_str>-carrid, <fs_str>-connid, <fs_str>-fldate.
*    SKIP.
*  ENDLOOP.
