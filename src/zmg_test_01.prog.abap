*&---------------------------------------------------------------------*
*& Report ZMG_TEST_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmg_test_01.

WRITE: 'Merhaba.'.

ULINE.

SKIP 3.

WRITE: 'Kursumuza hosgeldiniz.'.

ULINE.

SKIP 3.

WRITE: 'EurotechStudy basarilar diler.'.

ULINE.

SKIP 3.

WRITE: 'Deneme son text.'.

ULINE.

write: 'Merhaba Arkadasim.'.
uline.
skip.
write: 'Calisirsan basarirsin.'.
uline.
skip 2.
write: 'Hayatta basarilar dilerim.'.
uline.


DATA : gv_text_01 TYPE c LENGTH 50 VALUE '11112222333344445555'.

WRITE: gv_text_01.

REPLACE ALL OCCURRENCES OF '3' IN gv_text_01 WITH 'W'.
skip 2.
WRITE: / gv_text_01.

REPLACE ALL OCCURRENCES OF 'WW' IN gv_text_01 WITH 'ZZ'.
skip 2.
WRITE: / gv_text_01.

REPLACE ALL OCCURRENCES OF 'w' IN gv_text_01 WITH 'R' RESPECTING CASE.
skip 2.
WRITE: / gv_text_01.

REPLACE ALL OCCURRENCES OF 'w' IN gv_text_01 WITH 'R' IGNORING CASE.
skip 2.
WRITE: / gv_text_01.
