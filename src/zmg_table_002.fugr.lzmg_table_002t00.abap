*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_TABLE_002...................................*
DATA:  BEGIN OF STATUS_ZMG_TABLE_002                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_TABLE_002                 .
CONTROLS: TCTRL_ZMG_TABLE_002
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_TABLE_002                 .
TABLES: ZMG_TABLE_002                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
