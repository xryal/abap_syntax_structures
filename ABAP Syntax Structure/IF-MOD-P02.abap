REPORT ZAB_P07_IF_MOD_EXAMPLE.

DATA : lv_sayi1 type p LENGTH 3 DECIMALS 0,
       lv_mod_sayici type p LENGTH 3 DECIMALS 0.

WRITE : /.
WRITE : '2 ye bölünebilen   sayılar'.

DO 100 TIMES.
  lv_sayi1 = sy-index.
  lv_mod_sayici = lv_sayi1 MOD 2.
  IF lv_mod_sayici eq 0.
     WRITE:  lv_sayi1.
  ENDIF.
ENDDO.

WRITE : /.
WRITE : / '3 ye bölünebilen   sayılar'.

DO 100 TIMES.
  lv_sayi1 = sy-index.
  lv_mod_sayici = lv_sayi1 MOD 3.
  IF lv_mod_sayici eq 0.
     WRITE:  lv_sayi1.
  ENDIF.
ENDDO.

WRITE : /.
WRITE : / '4 ye bölünebilen  sayılar'.

DO 100 TIMES.
  lv_sayi1 = sy-index.
  lv_mod_sayici = lv_sayi1 MOD 4.
  IF lv_mod_sayici eq 0.
     WRITE:  lv_sayi1.
  ENDIF.
ENDDO.
