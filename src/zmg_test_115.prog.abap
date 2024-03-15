*&---------------------------------------------------------------------*
*& Report ZMG_TEST_115
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_115.

DATA: gv_id        TYPE zcm_de_yeni_id,
      gv_number    TYPE s_agncynum,
      gs_stravelag TYPE zcm_stravelag.

START-OF-SELECTION.

  SELECT MAX( id ) FROM zcm_stravelag
                  INTO gv_id.
  SELECT MAX( agencynum ) FROM zcm_stravelag INTO gv_number.

 gs_stravelag-id = gv_id + 1.
 gs_stravelag-agencynum = gv_number + 1.
 gs_stravelag-name = 'Aydin Seyahat'.
 gs_stravelag-street = 'Bahar Caddesi'.
 gs_stravelag-postbox = '123456'.
 gs_stravelag-postcode = '54321'.
 gs_stravelag-city = 'Zürih'.
 gs_stravelag-country = 'Sch'.
 gs_stravelag-region = 'ZRH'.
 gs_stravelag-telephone = '+1445356262728'.
 gs_stravelag-url = 'http://www.-aydinseyahat'.
 gs_stravelag-langu = 'E'.
 gs_stravelag-currency = 'EUR'.

  BREAK-POINT.



*DATA: gv_number TYPE i,
*      gv_id TYPE
*
*SELECT COUNT(*) FROM zmg_stravelag
*                INTO gv_number
*                WHERE city = 'Frankfurt'.
*BREAK-POINT.
*
*clear: gv_number.
*
*SELECT max( id ) FROM zmg_stravelag
*
**  into gv_number(zmg_stravelag-id).
