REPORT zab_p56.

TABLES SSCRFIELDS.

PARAMETERS p_d1 type i DEFAULT 1.

SELECTION-SCREEN FUNCTION KEY 1.
SELECTION-SCREEN FUNCTION KEY 2.


"Üst menüye buton ekleme.
INITIALIZATION.
SSCRFIELDS-FUNCTXT_01 = 'ABAP EDITOR'.
SSCRFIELDS-FUNCTXT_02 = 'ABAP DICTIONARY'.

at SELECTION-SCREEN.
  CASE sscrfields-ucomm.
    WHEN 'FC01'.
      CALL TRANSACTION 'SE38'.
    WHEN 'FC02' .
      CALL TRANSACTION 'SE11'.
    WHEN OTHERS.
  ENDCASE.
