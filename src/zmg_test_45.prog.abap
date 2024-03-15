*&---------------------------------------------------------------------*
*& Report ZMG_TEST_45
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_45.

*Alıştırma -2: Yeni bir program oluşturun. 1 adet parametre tanımlayın ve kullanıcıdan 1 ID alin.
*Program içerisinde bir satir tanımlayın. Satirin hücreleri sırasıyla “Öğrenci ID”, “Öğrenci Adi”, “Öğrenci
*Soyadı”, “Ders”, “Alınan Not” ve “Basari Durumu” olsun.
*Bu satir ile ayni yapıya sahip bir internal tablo tanımlayın.
*Satiri kendi üreteceğiniz veriyle 10 kere doldurun ve her doldurmadan sonra Append komutu ile internal tabloya kaydedin.
*Daha sonra secim ekranından (selection screen) gelecek bilgiye göre internal tabloyu Read Table komutu ile okuyun ve ekrana yazdırın.
*(Kullanıcı hangi ID’yi girdiyse tablodaki ilgili satir Read Table komutu ile okunup ekrana yazdırılacak)
*(Parametre için selection screen oluşturun ve başlığını tanımlayın).

*Alistirma 1de : SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
*PARAMETERS: p_num TYPE n LENGTH 2.
*SELECTION-SCREEN END OF BLOCK a1.
*Kullanicidan id yazmasini isteyecegiz. Bu nedenle PARAMETERS icerisinde 'p_num' yerine p_id yazacagiz
*ve Tablo icerisindeki id tipi 'TYPE n LENGTH 6' olduguna göre, PARAMETERS icerisinde de o sekilde yazacagiz.Yani (PARAMETERS: p_id TYPE n LENGTH 6 ).
*Bundan sonra pnum olarak tanimlanan yerler p_id seklinde yazilacaktir.
*OBLIGATORY Komutu: Kullanici zorunlu bir veri girmesi gerekiyorsa bu kod kullanilir; böylece SAP otomatik olarak bu veriyi sart kosar
*ve veri eksik olmasi durumunda ikaz mesaji gönderir.
*Ya da kendimiz mesaj metni belirlemek icin, daha önce yaptigimiz IF Condition komutunu kullanacagiz.
*Ayrica Text Elements linkinden Text metinleri de degistirilmelidir.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_id TYPE n LENGTH 6 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK a1.

TYPES: BEGIN OF gty_structure,
         id      TYPE n LENGTH 6,
         name    TYPE c LENGTH 30,
         surname TYPE c LENGTH 30,
         lesson  TYPE c LENGTH 20,
         mark    TYPE n LENGTH 3,
         success TYPE c LENGTH 12,
       END OF gty_structure.

DATA: gs_structure TYPE gty_structure,
      gt_table     TYPE TABLE OF gty_structure.

START-OF-SELECTION.

*  IF p_id IS INITIAL. "OBLIGATORY Komutu kullanildigi icin Commend yapildi.
*    MESSAGE TEXT-002 TYPE 'I'." DISPLAY LIKE 'E'.
*    EXIT.
*  ENDIF.

  gs_structure-id      = 200003.
  gs_structure-name    = 'ALI'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '70'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200001.
  gs_structure-name    = 'VELI'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '80'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200002.
  gs_structure-name    = 'MUSTAFA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '40'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200006.
  gs_structure-name    = 'MAHMUT'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '100'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200004.
  gs_structure-name    = 'SALIHA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '30'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200010.
  gs_structure-name    = 'GÜLCIN'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '90'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200008.
  gs_structure-name    = 'SÜREYYA'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '85'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200009.
  gs_structure-name    = 'MEHMET'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '50'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200005.
  gs_structure-name    = 'ERKIN'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '20'.
  gs_structure-success = 'Unsuccessful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

  gs_structure-id      = 200007.
  gs_structure-name    = 'SEFIK'.
  gs_structure-surname = 'CENGIZ'.
  gs_structure-lesson  = 'MATH'.
  gs_structure-mark    = '60'.
  gs_structure-success = 'Successful'.

  APPEND gs_structure TO gt_table.
  CLEAR: gs_structure.

*Alistirma 2'de 'INDEX p_num' seklinde olan kod 'WITH KEY id = p_id' olacak.
* ve Satirlardaki ID'ler degistirilmelidir.

  READ TABLE gt_table INTO gs_structure WITH KEY id = p_id.
  IF sy-subrc IS INITIAL.
    WRITE: gs_structure-id,  gs_structure-name, gs_structure-surname,
           gs_structure-lesson, gs_structure-mark, gs_structure-success.
  ENDIF.
