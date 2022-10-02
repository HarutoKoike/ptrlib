

@ptr::store.pro
@ptr::list.pro
@ptr::get.pro
@ptr::help.pro
@ptr::delete.pro


FUNCTION ptr::init
COMPILE_OPT IDL2
RETURN, 1
END

FUNCTION ptr::index, vname
COMPILE_OPT IDL2, STATIC
IF ~ISA( *(!PTR.VNAME) ) THEN RETURN, !NULL
RETURN, WHERE( STRMATCH( *(!PTR.VNAME), vname ) EQ 1, /NULL) 
END
 

PRO ptr__define

DEFSYSV, '!PTR', EXISTS=exists


ptr = {                                  $
       vname:PTR_NEW(/ALLOCATE)        , $
       data:PTR_NEW(/ALLOCATE)         , $
       description:PTR_NEW(/ALLOCATE)  , $
       id:PTR_NEW(/ALLOCATE)             $
      }

IF ~exists THEN DEFSYSV, '!PTR', ptr

void = {           $
         ptr,      $
         vname:'', $
         data :'', $
         id   :''  $
       }

END
