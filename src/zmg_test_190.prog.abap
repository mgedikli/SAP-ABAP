*&---------------------------------------------------------------------*
*& Report ZMK_WIEDERHOLUNG_90
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_190.

*Alıştırma – 10 Sayfa 271:
*Kendinize ait olan ve SCARR ile ayni satir yapısına sahip olan database tablosunun
*(Ör: ZCM_SCARR) bütün hücrelerinin gösterildiği bir Dialog Screen hazırlayın.
*Tablo üzerinde CRUD işlemlerinin yapılabilmesi için 4 adet yeni buton tanımlayın.
*Yapılan değişiklikleri görebilmek ekranın hemen sağ tarafında ayni tablonun ALV’sini gösterin.

DATA: gt_table    TYPE TABLE OF zmg_scarr,
      gs_table    TYPE zmg_scarr,
      gv_carrid   TYPE s_carr_id, "text3,
      gv_carrname TYPE s_carrname,
      gv_currcode TYPE s_currcode,
      gv_url      TYPE s_carrurl.

DATA: go_alvgrid   TYPE REF TO cl_gui_alv_grid,
      go_container TYPE REF TO cl_gui_custom_container,
      gt_fieldcat  TYPE lvc_t_fcat,
      gs_fieldcat  TYPE lvc_s_fcat,
      gs_layout    TYPE lvc_s_layo.

START-OF-SELECTION.
  CALL  SCREEN 0900.

MODULE status_0900 OUTPUT.
 SET PF-STATUS 'PF_STATUS_SCARR'.
 SET TITLEBAR 'TITLE_SCARR'.
ENDMODULE.

MODULE user_command_0900 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
    WHEN 'READ'.
      IF gv_carrid IS NOT INITIAL.
        CLEAR: gs_table.

        SELECT SINGLE * FROM zmg_scarr
          INTO gs_table WHERE carrid = gv_carrid.

        IF gs_table IS NOT INITIAL.
          gv_carrname = gs_table-carrname.
          gv_currcode = gs_table-currcode .
          gv_url      = gs_table-url.
        ELSE.
          CLEAR: gv_carrid, gv_carrname, gv_currcode, gv_url.
          MESSAGE 'Girilen CARRID ile ilgili kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'CARRID alanını boş birakmayiniz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
    WHEN 'DELETE'.
      IF gv_carrid IS NOT INITIAL.
        DELETE FROM zmg_scarr WHERE carrid = gv_carrid.

        IF sy-subrc IS INITIAL.
          MESSAGE 'Satır silme işlemi başarılı.' TYPE 'S'.
        ELSE.
          MESSAGE 'Girilen CARRID ile ilgili kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'CARRID alanını boş birakilamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
    WHEN 'UPDATE'.
      IF gv_carrid IS NOT INITIAL.
        UPDATE zmg_scarr SET carrname = gv_carrname
                             currcode = gv_currcode
                             url = gv_url
                             WHERE carrid = gv_carrid.
        IF sy-subrc IS INITIAL.
          MESSAGE 'Satır güncelleme işlemi başarılı.' TYPE 'S'.
        ELSE.
          MESSAGE 'Girilen CARRID ile ilgili kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'CARRID alanını boş birakilamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
    WHEN 'CREATE'.
      gs_table-carrid   = gv_carrid.
      gs_table-carrname = gv_carrname.
      gs_table-currcode = gv_currcode.
      gs_table-url      = gv_url.

      INSERT zmg_scarr FROM gs_table.

      IF sy-subrc IS INITIAL.
        MESSAGE 'Yeni kayıt ekleme işlemi başarılı.' TYPE 'S'.
      ELSE.
        MESSAGE 'Yeni kayıt ekleme işlemi başarısız.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.
    WHEN 'ALV'.
      PERFORM select_data.
      PERFORM fcat.
      PERFORM layout.
      PERFORM show_alv.
  ENDCASE.
ENDMODULE.

FORM select_data.
  SELECT * FROM zmg_scarr INTO TABLE gt_table.
ENDFORM.

FORM fcat.
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZMG_SCARR'
      i_bypassing_buffer     = abap_true
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.
  IF sy-subrc IS NOT INITIAL.
    LEAVE PROGRAM.
  ENDIF.
ENDFORM.

FORM layout.
  gs_layout-zebra      = abap_true.
  gs_layout-cwidth_opt = abap_true.
  gs_layout-sel_mode   = 'A'.
ENDFORM.

FORM show_alv .
  IF go_alvgrid IS INITIAL.
    CREATE OBJECT go_container
      EXPORTING
        container_name              = 'CC_ALV'
      EXCEPTIONS
        cntl_error                  = 1
        cntl_system_error           = 2
        create_error                = 3
        lifetime_error              = 4
        lifetime_dynpro_dynpro_link = 5
        OTHERS                      = 6.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    CREATE OBJECT go_alvgrid
      EXPORTING
        i_parent          = go_container
      EXCEPTIONS
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        OTHERS            = 5.

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

    go_alvgrid->set_table_for_first_display(
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_table
        it_fieldcatalog               = gt_fieldcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ELSE.
*    go_alvgrid->check_changed_data( ).

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).
    IF sy-subrc <> 0.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.
