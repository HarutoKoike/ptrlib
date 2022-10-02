PRO ptr::store, vname, data, description=description, _EXTRA=ex, $
                overwrite=overwrite

COMPILE_OPT IDL2, STATIC

IF ~KEYWORD_SET(description) THEN $
  description = ' '



IF ~ISA( *(!PTR.VNAME) ) THEN GOTO, SKIP


;
;*---------- restore data ----------*
;
IF KEYWORD_SET(overwrite) THEN BEGIN
  idx = ptr->index(vname)
  ;
  IF ~ISA(idx) THEN BEGIN
    PRINT, '% Variable "' + vname + '" is not stored' 
    RETURN
  ENDIF
  ;
  IF KEYWORD_SET(description) THEN $
    (*(!PTR.DESCRIPTION))[idx] = description
  IF ISA(data) THEN $
    *((*(!PTR.DATA))[idx])[0] = data
  ;
  RETURN
ENDIF


;
;*---------- check variable existing  ----------*
;
dum = WHERE( STRMATCH(*(!PTR.VNAME), vname) EQ 1, count )
IF count NE 0 THEN BEGIN
  PRINT, '% variable "' + vname + '" is already defined'
  RETURN
ENDIF



SKIP:
;
;*---------- store data  ----------*
;
*(!PTR.VNAME)        = [*(!PTR.VNAME), vname]
*(!PTR.DATA)         = [*(!PTR.DATA), PTR_NEW(data, /ALLOCATE)]
*(!PTR.DESCRIPTION)  = [*(!PTR.DESCRIPTION), description]
;
id = ( PTR_VALID( PTR_VALID(), /GET_HEAP_IDENTIFIER ) )[-1]
*(!PTR.ID) = [*(!PTR.ID), id]


END


