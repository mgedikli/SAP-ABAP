*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_DATE_INFO1..................................*
DATA:  BEGIN OF STATUS_ZMG_DATE_INFO1                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_DATE_INFO1                .
CONTROLS: TCTRL_ZMG_DATE_INFO1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_DATE_INFO1                .
TABLES: ZMG_DATE_INFO1                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
