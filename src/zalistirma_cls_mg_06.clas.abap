class ZALISTIRMA_CLS_MG_06 definition
  public
  final
  create public .

public section.

  class-methods INFO
    importing
      !IV_DATE type DATUM
    exporting
      !EV_INFO type STRING .
protected section.

  class-methods GET_DAY_NAME
    importing
      !IV_DATE type DATUM
    exporting
      !EV_DAY_NAME type LANGT .
  class-methods GET_NO_DAYS
    importing
      !IV_DATE type DATUM
    exporting
      !EV_NO_DAYS type INT4 .
private section.
ENDCLASS.



CLASS ZALISTIRMA_CLS_MG_06 IMPLEMENTATION.


  METHOD get_day_name.

    CALL FUNCTION 'GET_WEEKDAY_NAME'
      EXPORTING
        date        = iv_date
        language    = sy-langu
      IMPORTING
        longtext    = ev_day_name
      EXCEPTIONS
        calendar_id = 1
        date_error  = 2
        not_found   = 3
        wrong_input = 4
        OTHERS      = 5.
    IF sy-subrc IS NOT INITIAL.
      LEAVE PROGRAM.
    ENDIF.

  ENDMETHOD.


  METHOD get_no_days.

    ev_no_days = sy-datum - iv_date.

  ENDMETHOD.


  METHOD info.

    DATA: lv_day_name     TYPE langt,
          lv_no_days      TYPE int4,
          lv_no_days_text TYPE n LENGTH 6.

    get_day_name(
      EXPORTING
        iv_date     = iv_date
      IMPORTING
        ev_day_name = lv_day_name ).

    get_no_days(
      EXPORTING
        iv_date     = iv_date
      IMPORTING
        ev_no_days  = lv_no_days ).
    lv_no_days_text = lv_no_days.

    CONCATENATE TEXT-001 iv_date lv_day_name TEXT-002 lv_no_days_text TEXT-003 INTO ev_info.

  ENDMETHOD.
ENDCLASS.
