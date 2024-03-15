*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMG_FATURA_H....................................*
DATA:  BEGIN OF STATUS_ZMG_FATURA_H                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMG_FATURA_H                  .
CONTROLS: TCTRL_ZMG_FATURA_H
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMG_FATURA_H                  .
TABLES: ZMG_FATURA_H                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
