FUNCTION ptr::get, vname, id=id, description=description 

COMPILE_OPT IDL2, STATIC


vname_list = *(!PTR.VNAME)
idx = WHERE( STRMATCH(vname_list, vname) EQ 1, count )

IF count EQ 0 THEN BEGIN
  PRINT, '% Variable "' + vname + '" does not exists'
  RETURN, !NULL
ENDIF


IF KEYWORD_SET(id) THEN $
  RETURN, (*(!PTR.ID))[idx]

IF KEYWORD_SET(description) THEN $
  RETURN, (*(!PTR.DESCRIPTION))[idx]


RETURN, *( (*(!PTR.DATA))[idx] )[0]

END
