*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_TABLE_PHONE.................................*
DATA:  BEGIN OF STATUS_ZMG_TABLE_PHONE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_TABLE_PHONE               .
CONTROLS: TCTRL_ZMG_TABLE_PHONE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_TABLE_PHONE               .
TABLES: ZMG_TABLE_PHONE                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
