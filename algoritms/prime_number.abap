REPORT zab_p15_prime_number.

PARAMETERS: p_sayi TYPE i OBLIGATORY.

DATA: lv_asal         TYPE abap_bool,
      lv_sy_tabix_tutucu TYPE i,
      lv_yuvarlayici TYPE i,
      lv_manuel_debugger TYPE i.

lv_asal = abap_true.
lv_yuvarlayici = FLOOR(  p_sayi / 2  ).

IF p_sayi LE 1.
  lv_asal = abap_false.
ELSEIF p_sayi EQ 2.
  lv_asal = abap_true.
ELSE.
  DO  lv_yuvarlayici TIMES.
    "sy-tabix hem aritmetik olarak işleme tabii hem de lojik olarak kullanılamadığı için
    "öncelikle aritmetik işlemi yapıp sonrasında sy_tabix_tutucu'yu lojik işleme sokabiliriz.
    lv_manuel_debugger = sy-index + 1.
    WRITE : /'bölünen sayılar', lv_manuel_debugger.

    lv_sy_tabix_tutucu = sy-index + 1.
    IF p_sayi MOD lv_sy_tabix_tutucu EQ 0.
      lv_asal = abap_false.
      EXIT.
    ENDIF.
  ENDDO.
ENDIF.

IF lv_asal = abap_true.
  WRITE: / p_sayi, 'asal bir sayıdır.'.
ELSE.
  WRITE: / p_sayi, 'asal bir sayı değildir.'.
ENDIF.
