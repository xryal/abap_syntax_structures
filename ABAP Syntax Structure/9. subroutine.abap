REPORT zab_p16.

DATA : gv_num1 TYPE i, "global variable
       gv_num2 TYPE i, "global variable
       gv_sonuc TYPE i.

gv_num1 = 150. "global variableglobal
gv_num2 = 50 . "global variable

PERFORM sayi_topla USING gv_num1
                         gv_num2
                         CHANGING gv_sonuc.
write : / gv_sonuc,
        / gv_num1.
FORM sayi_topla USING pv_num1 TYPE i
                      pv_num2 TYPE i
                      CHANGING pv_sonuc.
  pv_sonuc = pv_num1 * pv_num2.
  "data : lv_sonuc TYPE i. "local variable

ENDFORM.
