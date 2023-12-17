REPORT ZAB_P08_SY_INDEX.

DATA : lv_string TYPE string VALUE ' SELAM'.

DO 5 TIMES.
  WRITE: / sy-index, lv_string+sy-index(1).
ENDDO.
