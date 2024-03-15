*&---------------------------------------------------------------------*
*& Report ZMG_TEST_154
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_154.
*Deep Structure Example Sayfa-224

DATA: gs_structure TYPE zmg_s_deepstr_01.

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
