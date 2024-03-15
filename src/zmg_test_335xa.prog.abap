*&---------------------------------------------------------------------*
*& Report ZMG_TEST_335X
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_335xa.
*S.361)Übung – 1: Erstellen Sie einen neuen Bericht und erhalten Sie 1 Mitarbeiter-ID vom Benutzer.
*Erstellen Sie eine neue Klasse. Die erste Methode besteht darin, die allgemeinen Informationen des
*Mitarbeiters (aus der Tabelle ZMG_TABLO_1) als einzelne Zeile vorzubereiten und zu exportieren.
*Alıştırma – 1: Yeni bir rapor oluşturun ve kullanıcıdan 1 adet çalışan ID bilgisi alin. Yeni bir class
*oluşturun. Birinci metot çalışanın genel bilgilerini (ZMG_TABLO_1 tablosundan) tek bir satir olarak
*hazırlayıp export etsin.

*Die zweite Methode exportiert eine Tabelle, die 2 Spalten hat. (JAHR und URLAUB_VERWENDET).Erstellen Sie eine
*aussagekräftige Nachricht mit der Zeile aus der ersten Methode und der Tabelle aus der zweiten Methode und geben Sie
*sie an den Benutzer weiter. (Ahmet CAN, der eine ID von 1001 hat, hat 27 Urlaubstage im Jahr 2024 und 13 Tage im Jahr 2025 geplant.)
*Verwenden Sie Variablen, die durch Inlinedeklaration im Bericht definiert sind.

*İkinci metot bir tablo export etsin ve bu tablonun 2 adet kolonu olsun. (YIL ve KULLANILAN_IZIN).
*İlk metottan gelen satır ve ikinci metottan gelen tabloyu kullanarak anlamlı bir mesaj oluşturup kullanıcıya verin.
*(1001 ID’sine sahip Ahmet CAN 2024 yılında 27 gün ve 2025 yılında 13 gün izin planlamasi yapmıştır.)
*Raporda inline declaration ile tanımlanmış değişkenler kullanın.

PARAMETERS: p_id TYPE zcm_de_id.
*Class olustur
DATA: go_mitarbeiter  TYPE REF TO zmgmitarbeiter_info,      "gs_mitarbeiter_info TYPE  zmg_tablo_1.
      gv_total_urlaub TYPE n LENGTH 3.  "Concatenate (data typr C,N,D,T, or STRING)integer kabul etmiyor.

START-OF-SELECTION.

  CREATE OBJECT go_mitarbeiter.

  "Calisan bilgilerini al.
  go_mitarbeiter->mitarbeiter_info_holen(
    EXPORTING
      iv_id               = p_id
    IMPORTING
      es_mitarbeiter_info = DATA(gs_zmgmitarbeiter) ).      "inline Decl. für gs_mitarbeiter_info ).
  "ZMGMITARBEITER_INFO class/Parameter für 'et_urlaub_info' Str.->'zmg_s_urlaub' ve 'zmg_tt_urlaub'erstellen. TT ist TYPE für 'et_urlaub_info' .

  "Calisan izin bilgilerini al.
  go_mitarbeiter->urlaub_info_holen(
    EXPORTING
      iv_id          = p_id                       " Data Element for column ID
    IMPORTING
      et_urlaub_info = DATA(gt_urlaub_info)  ).   " TT für URLAUB

  "ID hücresinde bastaki sifirlari at.
  SHIFT gs_zmgmitarbeiter-id LEFT DELETING LEADING '0'.

  "Mesajin ilk bölümünü olustur.
  CONCATENATE gs_zmgmitarbeiter-id 'ID''sine sahip' gs_zmgmitarbeiter-vorname gs_zmgmitarbeiter-nachname INTO DATA(gv_string_1) SEPARATED BY space.


*"izin bilgileri tablosunu gruplayarak loop at.
*"yil bazinda gruplanmis her bir grup icin toplam kullanilmis izin günü sayisini bul.
*"yil ve izin günü sayisini kullanarak mesajin orta kismini olustur ve ilk kismiyla birlestir.
  LOOP AT gt_urlaub_info INTO DATA(gs_urlaub) GROUP BY ( jahr = gs_urlaub-jahr )
                                              INTO DATA(gt_group).

    LOOP AT GROUP gt_group INTO DATA(gs_group).
      DATA(gv_jahr) = gs_group-jahr.

      gv_total_urlaub = gv_total_urlaub + gs_group-urlaub_alte.

    ENDLOOP.
"izin günü sayisini type N tanimlamak zorunda kaldik,
"bu nedenle olusmus gereksiz sifirlardan kurtul.
    SHIFT gv_total_urlaub LEFT DELETING LEADING '0'.

    CONCATENATE gv_jahr 'yilinda' gv_total_urlaub 'gün,' INTO DATA(gv_string_2) SEPARATED BY space.

    CONCATENATE gv_string_1 gv_string_2 INTO gv_string_1 SEPARATED BY space.

  CLEAR: gv_total_urlaub.

  ENDLOOP.
*
*"Buraya kadar hazirlanan mesaj teksti sonundaki virgülden kurtul.
  DATA(gv_anzahl_zeichen) = strlen( gv_string_1 ) - 1.

  gv_string_1 = gv_string_1(gv_anzahl_zeichen).

*"Mesajin son kismini ekle.
  CONCATENATE gv_string_1 'izin planlamasi yapmıştır.' INTO gv_string_1 SEPARATED BY space.
*"mesaji kullaniciya göster.
  MESSAGE gv_string_1 TYPE 'I'.
