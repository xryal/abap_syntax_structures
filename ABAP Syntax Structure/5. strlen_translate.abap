*****************STRLEN***************

DATA lv_d1 TYPE STring VALUE 'Hello KUllanıcı'.

DATA lv_d2 TYPE i.

lv_d2 = strlen( lv_d1 ).

WRITE: / 'uzunluğu:', lv_d2.

*****************TRANSLATE****************

TRANSLATE lv_d1 TO LOWER CASE.

WRITE: / 'Küçük harf:', lv_d1.

TRANSLATE lv_d1 TO UPPER CASE.

WRITE: / 'büyük harf:', lv_d1.
