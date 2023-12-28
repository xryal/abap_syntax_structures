REPORT zab_p19.

PARAMETERS : p_num1 TYPE i.

DATA : gv_sayac TYPE i,
       gv_div   TYPE i.

DO p_num1 TIMES.

  gv_sayac = gv_sayac + 2.
  WRITE : gv_sayac.

ENDDO.

WHILE gv_sayac LT 100.

  gv_sayac = gv_sayac + 1.
  gv_div = gv_sayac DIV 2.

  IF gv_div EQ 1.

    WRITE: gv_sayac COLOR 3.

  ELSE.

    WRITE: gv_sayac COLOR 3.

  ENDIF.

  WRITE: gv_sayac COLOR 6.

ENDWHILE.
