*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_FATURA_I....................................*
DATA:  BEGIN OF STATUS_ZMG_FATURA_I                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_FATURA_I                  .
CONTROLS: TCTRL_ZMG_FATURA_I
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_FATURA_I                  .
TABLES: ZMG_FATURA_I                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
