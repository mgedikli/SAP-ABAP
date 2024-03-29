*&---------------------------------------------------------------------*
*& Report ZABAP_MG_019
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabap_mg_019.
*Dialog Screen Olusturma s. 260


DATA: gt_table   TYPE TABLE OF zcm_table_001,
      gv_id      TYPE zcm_de_id,
      gv_name    TYPE zcm_de_name,
      gv_surname TYPE zcm_de_surname,
      gv_job     TYPE zcm_de_job,
      gv_salary  TYPE zcm_de_salary,
      gv_curr    TYPE zcm_de_curr,
      gv_gsm     TYPE zcm_de_gsm,
      gv_e_mail  TYPE zcm_de_e_mail.

DATA: go_alvgrid   TYPE REF TO cl_gui_alv_grid,
      go_container TYPE REF TO cl_gui_custom_container,
      gt_fieldcat  TYPE lvc_t_fcat,
      gs_fieldcat  TYPE lvc_s_fcat,
      gs_layout    TYPE lvc_s_layo.

CONSTANTS: gs_structure_name TYPE dd02l-tabname VALUE 'ZCM_TABLE_001'. "Formcat icinde i.structure name = 'ZCM_TABLE_001' yerine gs_structure_name
"FORM fcat.CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'/import/i-structure name DD02L-TABNAME
DATA: gs_table   TYPE zcm_table_001.

START-OF-SELECTION.

  CALL SCREEN 0100.

MODULE status_0100 OUTPUT.
  SET PF-STATUS 'PF_STATUS_019'.
  SET TITLEBAR 'TITLE_019'.
ENDMODULE.

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'GERI' OR 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.

    WHEN 'READ'.
      IF gv_id IS NOT INITIAL.
        CLEAR: gs_table.

        SELECT SINGLE * FROM zcm_table_001
                        INTO gs_table
                        WHERE id = gv_id.

        IF  gs_table IS NOT INITIAL.

          gv_name    = gs_table-name    .
          gv_surname = gs_table-surname .
          gv_job     = gs_table-job     .
          gv_salary  = gs_table-salary  .
          gv_curr    = gs_table-curr    .
          gv_gsm     = gs_table-gsm     .
          gv_e_mail  = gs_table-e_mail  .

        ELSE.
          CLEAR: gv_name, gv_surname, gv_job, gv_salary, gv_curr, gv_gsm, gv_e_mail.
          MESSAGE 'Girilen ID ile ilgili kayit bulunamadi.' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'ID alanu bos birakilamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'DELETE'.
      IF gv_id IS NOT INITIAL.
        DELETE FROM zcm_table_001 WHERE id = gv_id.
        IF sy-subrc IS INITIAL.
          MESSAGE 'Satir silme islemi basariyla gerceklestirildi.' TYPE 'S'.
        ELSE.
          MESSAGE 'Girilen ID ile ilgili kayit bulunamadi.' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'ID alani bos birakilamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'UPDATE'.
      IF gv_id IS NOT INITIAL.
        UPDATE zcm_table_001 SET  name    = gv_name
                                  surname = gv_surname
                                  job     = gv_job
                                  salary  = gv_salary
                                  curr    = gv_curr
                                  gsm     = gv_gsm
                                  e_mail  = gv_e_mail
                            WHERE id      = gv_id.
        IF sy-subrc IS INITIAL.
          MESSAGE 'Satir silme islemi basariyla gerceklestirildi.' TYPE 'S'.
        ELSE.
          MESSAGE 'Girilen ID ile ilgili kayit bulunamadi.' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.
      ELSE.
        MESSAGE 'ID alani bos birakilamaz.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'CREATE'.
      gs_table-id       = gv_id          .
      gs_table-name     = gv_name     .
      gs_table-surname  = gv_surname  .
      gs_table-job      = gv_job      .
      gs_table-salary   = gv_salary   .
      gs_table-curr     = gv_curr     .
      gs_table-gsm      = gv_gsm      .
      gs_table-e_mail   = gv_e_mail   .

      INSERT zcm_table_001 FROM gs_table.

      IF sy-subrc IS INITIAL.
        MESSAGE 'Yeni kayit basariyla eklendi.' TYPE 'S'.
      ELSE.
        MESSAGE 'Yeni kayit ekleme islemi basarisiz oldu.' TYPE 'S' DISPLAY LIKE 'E'.
      ENDIF.

    WHEN 'ALV'.
      PERFORM select_data.
      PERFORM fcat.
      PERFORM layout.
      PERFORM show_alv.

*  WHEN OTHERS.
  ENDCASE.
ENDMODULE.

FORM select_data.
*  IF gv_id IS NOT INITIAL.
  SELECT * FROM zcm_table_001 INTO TABLE gt_table.
*  ENDIF.
*ELSE.
*  SELECT * FROM zcm_table_001 INTO TABLE gt_table.
*  ENDIF.
ENDFORM.

FORM fcat .
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = gs_structure_name " 'ZCM_TABLE_001' yerine gs_structure_name
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

FORM layout .
  gs_layout-zebra       = abap_true.
  gs_layout-cwidth_opt  = abap_true.
  gs_layout-sel_mode    = 'A'.
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
    go_alvgrid->check_changed_data( ).

    go_alvgrid->refresh_table_display(
      EXCEPTIONS
        finished       = 1
        OTHERS         = 2 ).

    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.
  ENDIF.
ENDFORM.
