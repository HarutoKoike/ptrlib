;===========================================================+
; ++ NAME ++
PRO ptr::save, _EXTRA=ex
;
; ++ PURPOSE ++
;  --> save !PTR system variable
;
; ++ POSITIONAL ARGUMENTS ++
;  -->
;
; ++ KEYWORDS ++
; -->
;
; ++ CALLING SEQUENCE ++
;  --> ptr::save, filename='myvariables.sav'
;
; ++ HISTORY ++
;   09/2022 H.Koike 
;===========================================================+
COMPILE_OPT IDL2, STATIC
;
; check
ptr->list, count=count
IF count EQ 0 THEN BEGIN
  PRINT, '% No data has been stored ! '
  RETURN
ENDIF
;
ptr = !PTR
SAVE, ptr, _EXTRA=ex
END