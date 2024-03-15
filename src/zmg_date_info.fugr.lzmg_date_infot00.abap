*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_DATE_INFO...................................*
DATA:  BEGIN OF STATUS_ZMG_DATE_INFO                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_DATE_INFO                 .
CONTROLS: TCTRL_ZMG_DATE_INFO
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_DATE_INFO                 .
TABLES: ZMG_DATE_INFO                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
