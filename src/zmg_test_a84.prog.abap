*&---------------------------------------------------------------------*
*& Report ZCMA_TEST_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_a84.
*Alıştırma – 12: Sayfa 104’te yer alan database CRUD işlemleri ile ilgili örneği tekrar yazın ve işlemleri
*ayrı ayrı performlar içerisinde gerçekleştirin.
*Sayfa 167 Alistirma 12- s.104'deki örnek üzerinde perform ve include olusturma.
*ZCMA_Test_13   ( zcm_test_84 )

INCLUDE zmg_test_a84_top.

INCLUDE zmg_test_a84_f01.

START-OF-SELECTION.

  IF p_create = abap_true.
    PERFORM check_id.
    PERFORM create.
  ELSEIF p_read = abap_true.
    PERFORM read.
  ELSEIF p_update = abap_true.
    PERFORM check_upd.
    PERFORM update.
  ELSEIF p_delete = abap_true.
    PERFORM check_del.
    PERFORM delete.
  ENDIF.
