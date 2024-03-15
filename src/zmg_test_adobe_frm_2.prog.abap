*&---------------------------------------------------------------------*
*& Report ZMG_TEST_ADOBE_FRM_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMG_TEST_ADOBE_FRM_2.
*Sanal Yazıcı LP01 ve Print Overview s.367
DATA: gs_data     TYPE zmg_s_adobeform_fdm,
      gs_outparam TYPE sfpoutputparams,
      gv_funcname TYPE funcname.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 NO INTERVALS.
  PARAMETERS: p_carrid TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK a1.

START-OF-SELECTION.

  "Database'den veriyi oku ve gerekli yerlere kaydet.
  SELECT SINGLE * FROM scarr INTO gs_data-scarr         WHERE carrid = p_carrid.
  SELECT * FROM spfli        INTO TABLE gs_data-spfli   WHERE carrid = p_carrid.
  SELECT * FROM sflight      INTO TABLE gs_data-sflight WHERE carrid = p_carrid.

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

  "Adobe Formun Function'unu cagir!
  CALL FUNCTION gv_funcname
    EXPORTING
      is_input       = gs_data
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3
      OTHERS         = 4.

   IF sy-subrc IS INITIAL.
    BREAK-POINT.
  ENDIF.

   "PDF olusturma islemi tamamlandi. JOB kapat.
  CALL FUNCTION 'FP_JOB_CLOSE'
   EXCEPTIONS
     USAGE_ERROR          = 1
     SYSTEM_ERROR         = 2
     INTERNAL_ERROR       = 3
     OTHERS               = 4.
