*&---------------------------------------------------------------------*
*& Report ZMG_TEST_336
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_336x.
*s.361)Alıştırma – 2: Yeni bir rapor oluşturun ve ZMG_TABLO_1 ile ZMG_TABLO_2 database tablolarından
*bütün verileri çekin.
*Ikinci tablodan gelen veri ile loop ederek izinlerin bitiş tarihlerini 1’ergün arttırın.
*Bunu yaparken birinci tablodaki izin hakkini da kontrol edin, gecmesin.
*Bu işlemi sadece yeni değerin birinci tablodaki izin hakkini geçmediği durumlarda gerçekleştirin.
*Raporda inline declaration ile tanımlanmış değişkenler kullanın.

TYPES: BEGIN OF gty_table,
         id          TYPE zcm_de_id,
         jahr        TYPE c LENGTH 4,
         urlaub_alte TYPE int1,
       END OF gty_table.

DATA: gt_urlaub    TYPE TABLE OF gty_table,
      gv_werk_tage TYPE i,
      gv_date      TYPE datum.

START-OF-SELECTION.

  SELECT * FROM zmg_tablo_1 INTO TABLE @DATA(gt_tablo_1).   "Alistirma 1. kisim
  SELECT * FROM zmg_tablo_2 INTO TABLE @DATA(gt_tablo_2).

  LOOP AT gt_tablo_2 INTO DATA(gs_tablo_2).

    READ TABLE gt_urlaub ASSIGNING FIELD-SYMBOL(<fs_urlaub>) WITH KEY id = gs_tablo_2-id jahr = gs_tablo_2-jahr.

    IF sy-subrc IS NOT INITIAL.
      APPEND INITIAL LINE TO gt_urlaub ASSIGNING <fs_urlaub>. "gt_urlaub tablosunda aradigim satiri bulamadiginda gecerli
      <fs_urlaub>-id            = gs_tablo_2-id.
      <fs_urlaub>-jahr          = gs_tablo_2-jahr.
      <fs_urlaub>-urlaub_alte   = gs_tablo_2-urlaub_alte.
    ELSE.                                                     "satiri buldugunda:satirdaki kullanilan izin hücresini yeni gelenin üzerine ekle.
      <fs_urlaub>-urlaub_alte = <fs_urlaub>-urlaub_alte + gs_tablo_2-urlaub_alte.

    ENDIF.

  ENDLOOP.

  SORT gt_urlaub BY id.

  LOOP AT gt_tablo_2 ASSIGNING FIELD-SYMBOL(<fs_2>).
    READ TABLE gt_tablo_1 INTO DATA(gs_tablo_1) WITH KEY id = <fs_2>-id.
    IF sy-subrc IS INITIAL.

      READ TABLE gt_urlaub ASSIGNING <fs_urlaub> WITH KEY id = <fs_2>-id jahr = <fs_2>-jahr.

      IF sy-subrc IS INITIAL.

        IF <fs_urlaub>-urlaub_alte < gs_tablo_1-urlaub.

          gv_date = <fs_2>-urlaub_ende + 1.

          CALL FUNCTION 'HR_RO_WORKDAYS_IN_INTERVAL'
            EXPORTING
              begda   = gv_date
              endda   = gv_date
              mofid   = '08'
            CHANGING
              wrkdays = gv_werk_tage.

          IF gv_werk_tage           = 1.
            <fs_2>-urlaub_ende      = gv_date.
            <fs_2>-urlaub_alte      = <fs_2>-urlaub_alte + 1.
            <fs_urlaub>-urlaub_alte = <fs_urlaub>-urlaub_alte + 1.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDLOOP.

  BREAK-POINT.
