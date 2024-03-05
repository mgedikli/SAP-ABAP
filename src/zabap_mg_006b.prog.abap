*&---------------------------------------------------------------------*
*& Report ZABAP_MG_006B
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_MG_006B.

data: gv_answer TYPE c.

CALL FUNCTION 'POPUP_TO_CONFIRM'
  EXPORTING
   TITLEBAR                    = 'Lütfen Onaylayiniz. '
    text_question               = 'Islem yapmak istediginizden emin misiniz?'
   TEXT_BUTTON_1               = 'Eminim!'
   ICON_BUTTON_1               = 'ICON_GRAPHICS'
   TEXT_BUTTON_2               = 'Emin Degilim!'
   ICON_BUTTON_2               = 'ICON_CANCEL'
   DEFAULT_BUTTON              = '2'
   DISPLAY_CANCEL_BUTTON       = ' '
*   USERDEFINED_F1_HELP         = ' '
   START_COLUMN                = 45
   START_ROW                   = 10
*   POPUP_TYPE                  =
*   IV_QUICKINFO_BUTTON_1       = ' '
*   IV_QUICKINFO_BUTTON_2       = ' '
 IMPORTING
   ANSWER                      = gv_answer
 EXCEPTIONS
   TEXT_NOT_FOUND              = 1
   OTHERS                      = 2
          .
IF gv_answer = '1'.
  write: 'Eminim!'.

  ELSEIF gv_answer = '2'.
   write: 'Emin Degilim!'.

ENDIF.
