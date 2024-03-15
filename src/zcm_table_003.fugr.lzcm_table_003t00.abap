*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_TABLE_003...................................*
DATA:  BEGIN OF STATUS_ZMG_TABLE_003                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_TABLE_003                 .
CONTROLS: TCTRL_ZMG_TABLE_003
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_TABLE_003                 .
TABLES: ZMG_TABLE_003                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
