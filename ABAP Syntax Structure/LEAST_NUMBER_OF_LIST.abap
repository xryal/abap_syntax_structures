REPORT zab_p14_least_number.

DATA: lt_numbers    TYPE TABLE OF i,
      lv_min_number TYPE i.

" Test için bir tamsayı tablosu oluştur
APPEND '0' TO lt_numbers .
APPEND '4' TO lt_numbers .
APPEND '3' TO lt_numbers .
APPEND '2' TO lt_numbers .
APPEND '1' TO lt_numbers .

" En küçük sayıyı bulma
lv_min_number = lt_numbers[ 1 ].


LOOP AT lt_numbers INTO DATA(lv_result).

  WRITE: / 'Verilen Sayılar:',lv_result.

  if lv_min_number gt lv_result.
    lv_min_number = lv_result.
  ENDIF.

ENDLOOP.

WRITE: / 'En Küçük Sayı:',lv_min_number.
