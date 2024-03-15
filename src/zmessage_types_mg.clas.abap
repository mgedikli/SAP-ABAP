class ZMESSAGE_TYPES_MG definition
  public
  final
  create public .

public section.

  methods SHOW_MESSAGE
    importing
      !IV_SUCCESS type CHAR1
      !IV_ERROR type CHAR1
      !IV_INFORMATION type CHAR1
      !IV_WARNING type CHAR1 .
protected section.
private section.
ENDCLASS.



CLASS ZMESSAGE_TYPES_MG IMPLEMENTATION.


  METHOD show_message.

    IF iv_success         = abap_true.
*      MESSAGE s000(zmg_msg_class).
      MESSAGE s000.
    ELSEIF iv_error       = abap_true.
*      MESSAGE e000(zmg_msg_class).
      MESSAGE e000.
    ELSEIF iv_warning     = abap_true.
*      MESSAGE w000(zmg_msg_class).
      MESSAGE w000.
    ELSEIF iv_information = abap_true.
*      MESSAGE i000(zmg_msg_class).
      MESSAGE i000. "Properties/Message Class-> se91=> "ZMG_MSG_CLASS" adi girilir.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
