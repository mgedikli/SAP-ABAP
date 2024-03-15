*&---------------------------------------------------------------------*
*& Report ZMG_TEST_303
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_303.
*Loop at Group

DATA: gv_name_sname TYPE string,
      gv_text TYPE string,
      gv_izin TYPE n LENGTH 4.

START-OF-SELECTION.

  SELECT * FROM zcm_tablo_1 INTO TABLE @DATA(gt_1).
  SELECT * FROM zcm_tablo_2 INTO TABLE @DATA(gt_2).

  LOOP AT gt_2 INTO DATA(gs_2) GROUP BY ( id = gs_2-id ) ASCENDING ASSIGNING FIELD-SYMBOL(<fs_group>).

    LOOP AT GROUP <fs_group> ASSIGNING FIELD-SYMBOL(<fs_str>).
      IF gv_name_sname IS INITIAL.
        READ TABLE gt_1 INTO DATA(gs_1) WITH KEY id = <fs_str>-id.
        IF  sy-subrc IS INITIAL.
          CONCATENATE gs_1-ad gs_1-soyad 'calisanininbugüne kadar kullandigi toplam izin:' INTO gv_name_sname.
        ENDIF.
      ENDIF.
      gv_izin = gv_izin + <fs_str>-kul_izin.
    ENDLOOP.

    CONCATENATE gv_name_sname gv_izin INTO gv_text.
    WRITE: gv_text.
    SKIP.
    CLEAR: gv_name_sname, gv_izin.

  ENDLOOP.
