*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_TABLO_1.....................................*
DATA:  BEGIN OF STATUS_ZMG_TABLO_1                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_TABLO_1                   .
CONTROLS: TCTRL_ZMG_TABLO_1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_TABLO_1                   .
TABLES: ZMG_TABLO_1                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
