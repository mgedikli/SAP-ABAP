*&---------------------------------------------------------------------*
*& Report ZMG_TEST_AF_DOWNLOAD_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_AF_DOWNLOAD_2.
*S.370)PDF dokümanını öngörünüm olmadan bilgisayara kaydetme
DATA: gs_data     TYPE zmg_s_adobeform_fdm,
      gs_outparam TYPE sfpoutputparams,
      gv_funcname TYPE funcname,
      gs_pdf      TYPE fpformoutput,
      gv_filename TYPE string,
      gv_path     TYPE string,
      gv_fullpath TYPE string,
      gt_data_tab TYPE STANDARD TABLE OF x255.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_carrid TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  "Database'den veriyi oku ve gerekli yerlere kaydet.
  SELECT SINGLE * FROM scarr INTO gs_data-scarr         WHERE carrid = p_carrid.
  SELECT * FROM spfli        INTO TABLE gs_data-spfli   WHERE carrid = p_carrid.
  SELECT * FROM sflight      INTO TABLE gs_data-sflight WHERE carrid = p_carrid.

  "PDF'in acilmamasini, ancak veri halinda saklanmasini sagla.
  gs_outparam-getpdf = abap_true.

  "PDF olusturmak icin JOB ac.
  CALL FUNCTION 'FP_JOB_OPEN'
    CHANGING
      ie_outputparams = gs_outparam "kullanilmasa dahi acilmasi gerekiyor!
    EXCEPTIONS
      cancel          = 1
      usage_error     = 2
      system_error    = 3
      internal_error  = 4
      OTHERS          = 5.

  IF sy-subrc IS NOT INITIAL.
    BREAK-POINT.
  ENDIF.

  "Adobe Formun Function ismini al!
  CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
    EXPORTING
      i_name     = 'ZMG_ADOBE_FORM_FDM'
    IMPORTING
      e_funcname = gv_funcname.

  "Adobe Formun Function'unu cagir ve PDF'i veri olarak al!
  CALL FUNCTION gv_funcname
    EXPORTING
      is_input           = gs_data
    IMPORTING
      /1bcdwb/formoutput = gs_pdf
    EXCEPTIONS
      usage_error        = 1
      system_error       = 2
      internal_error     = 3
      OTHERS             = 4.

  IF sy-subrc IS INITIAL.
    BREAK-POINT.
  ENDIF.

  "PDF olusturma islemi tamamlandi. JOB kapat.
  CALL FUNCTION 'FP_JOB_CLOSE'
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3
      OTHERS         = 4.

  "Gelen PDF dosyasini BINARY formatina cevir.
  "BINARY formati tamamen sayilardan olusan bir veri tipidir.
  CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
    EXPORTING
      buffer     = gs_pdf-pdf
    TABLES
      binary_tab = gt_data_tab.

  "Kullaniciya, nereye ve hangi isimle kaydetmek istedigini sor!
  cl_gui_frontend_services=>file_save_dialog(
    EXPORTING
      window_title              = 'Dosyayi nereye kaydetmek istersiniz?'  " Window Title
    CHANGING
      filename                  = gv_filename      " File Name to Save
      path                      = gv_path          " Path to File
      fullpath                  = gv_fullpath      " Path + File Name
    EXCEPTIONS
      cntl_error                = 1                " Control error
      error_no_gui              = 2                " No GUI available
      not_supported_by_gui      = 3                " GUI does not support this
      invalid_default_file_name = 4                " Invalid default file name
      OTHERS                    = 5 ).

  IF sy-subrc <> 0.
    BREAK-POINT.
  ENDIF.

  "Kaydet.
  cl_gui_frontend_services=>gui_download(
    EXPORTING
      filename                  = gv_filename           " Name of file
      filetype                  = 'BIN'                 " File type (ASCII, binary ...)'ASC'
    CHANGING
      data_tab                  = gt_data_tab           " Transfer table
    EXCEPTIONS
      file_write_error          = 1                    " Cannot write to file
      no_batch                  = 2                    " Cannot execute front-end function in background
      gui_refuse_filetransfer   = 3                    " Incorrect Front End
      invalid_type              = 4                    " Invalid value for parameter FILETYPE
      no_authority              = 5                    " No Download Authorization
      unknown_error             = 6                    " Unknown error
      header_not_allowed        = 7                    " Invalid header
      separator_not_allowed     = 8                    " Invalid separator
      filesize_not_allowed      = 9                    " Invalid file size
      header_too_long           = 10                   " Header information currently restricted to 1023 bytes
      dp_error_create           = 11                   " Cannot create DataProvider
      dp_error_send             = 12                   " Error Sending Data with DataProvider
      dp_error_write            = 13                   " Error Writing Data with DataProvider
      unknown_dp_error          = 14                   " Error when calling data provider
      access_denied             = 15                   " Access to file denied.
      dp_out_of_memory          = 16                   " Not enough memory in data provider
      disk_full                 = 17                   " Storage medium is full.
      dp_timeout                = 18                   " Data provider timeout
      file_not_found            = 19                   " Could not find file
      dataprovider_exception    = 20                   " General Exception Error in DataProvider
      control_flush_error       = 21                   " Error in Control Framework
      not_supported_by_gui      = 22                   " GUI does not support this
      error_no_gui              = 23                   " GUI not available
      OTHERS                    = 24 ).
  IF sy-subrc <> 0.
    BREAK-POINT.
  ENDIF.
