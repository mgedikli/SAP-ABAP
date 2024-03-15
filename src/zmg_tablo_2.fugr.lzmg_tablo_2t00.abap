*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_TABLO_2.....................................*
DATA:  BEGIN OF STATUS_ZMG_TABLO_2                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_TABLO_2                   .
CONTROLS: TCTRL_ZMG_TABLO_2
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_TABLO_2                   .
TABLES: ZMG_TABLO_2                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
