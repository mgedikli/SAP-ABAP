*&---------------------------------------------------------------------*
*& Report ZMG_TEST_154_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_154_1.
*Deep Structure Example V2
TYPES: BEGIN OF gty_address,
         street   TYPE char20,
         house_no TYPE int2,
         pbx_no   TYPE char5,
         city     TYPE char30,
       END OF gty_address.

TYPES: BEGIN OF gty_deep_str,
         id      TYPE zcm_de_id,
         name    TYPE zcm_de_name,
         surname TYPE zcm_de_surname,
         address TYPE gty_address,
         gsm     TYPE zcm_de_gsm,
         e_mail  TYPE zcm_de_e_mail,
       END   OF gty_deep_str.

DATA: gs_structure TYPE gty_deep_str.

START-OF-SELECTION.

START-OF-SELECTION.
  gs_structure-id                 = 20240001.
  gs_structure-name               = 'Mustafa'.
  gs_structure-surname            = 'Gedikli'.
  gs_structure-address-street     = 'Bahar Caddesi'.
  gs_structure-address-house_no   = 25.
  gs_structure-address-pbx_no     = '44020'.
  gs_structure-address-city       = 'Malatya'.
  gs_structure-gsm                = '+9050555353422'.
  gs_structure-e_mail             = 'mustafa.gedikli@gmail.com'.

  BREAK-POINT.
