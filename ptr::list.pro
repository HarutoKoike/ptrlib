PRO ptr::list

COMPILE_OPT IDL2, STATIC


PRINT, ' '
PRINT, ' '
PRINT, '% -------+---------- Stored Variables (ptrlib) ----------------------+'
PRINT, '%        |           |                        |                      |'
PRINT, '%   Num  |  Heep ID  |      Variable Name     |      Description     |'
PRINT, '%        |           |                        |                      |'
PRINT, '% -------+-----------+------------------------+----------------------+' 
IF ~ISA(!PTR.VNAME) THEN GOTO, SKIP
;
vname_list  = *(!PTR.VNAME)
description = *(!PTR.DESCRIPTION)
id          = *(!PTR.ID)

maxlen_Varname = 20


FOR i = 0, N_ELEMENTS(vname_list) - 1 DO BEGIN
  voutlen = maxlen_Varname - STRLEN(vname_list[i]) 
  ;
  vout  = '     ' + STRING(i, FORMAT='(I3)') + ' |'
  vout += '  ' + STRING(id[i], FORMAT='(I6)') + '   |'
  vout += '  "' + vname_list[i] + '"' + STRJOIN( REPLICATE(' ', voutlen) ) + $
          '| '
  vout += description[i]
  ;
  PRINT, vout
ENDFOR

SKIP:
PRINT, '% -------+-----------+------------------------+----------------------+'
PRINT, ' '



END
