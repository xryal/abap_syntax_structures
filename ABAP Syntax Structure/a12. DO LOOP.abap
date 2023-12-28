*Çift ve tek sayıları alt alta yazan abap programı
*****
*örnek çıktı
*Çift sayı:0
*Tek sayı:1
*Çift sayı:2
*Tek sayı:3

REPORT zab_if_mod_example.

DATA : lv_sayi1     TYPE i,
       lv_mod_alici TYPE i.

DO 100 TIMES.
  lv_sayi1 = sy-index.
  lv_mod_alici = lv_sayi1 MOD 2.

  IF lv_mod_alici EQ 1.
    WRITE: / lv_sayi1, 'tek sayıdır'.
  ELSE.
    WRITE: / lv_sayi1, 'çift sayıdır'.
  ENDIF.

ENDDO.
