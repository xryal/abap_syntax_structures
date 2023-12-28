REPORT zab_p17.

DATA : gv_num1  TYPE i,
       gv_sonuc TYPE i,
       gv_num2  TYPE i.

gv_num1 = 150.
gv_num2 = 50.

PARAMETERS : p_num1 TYPE i.
PARAMETERS : p_num2 TYPE i.
PARAMETERS : r_topla AS CHECKBOX .
PARAMETERS : r_carp AS CHECKBOX .
PARAMETERS : r_bol AS CHECKBOX .
PARAMETERS : r_cikar AS CHECKBOX .

IF r_topla EQ 'X' .

  PERFORM sayi_topla USING p_num1
                           p_num2
                           CHANGING gv_sonuc.

  WRITE: gv_sonuc.
  WRITE: '.......'.
ENDIF.
  if r_cikar eq 'X'.
    PERFORM sayi_cikar USING p_num1
                             p_num2
                             CHANGING gv_sonuc.

    WRITE: gv_sonuc.
    WRITE: '.......'.
  ENDIF.
  if r_carp eq 'X'.
    PERFORM sayi_carp USING p_num1
                             p_num2
                             CHANGING gv_sonuc.

    WRITE: gv_sonuc.
    WRITE: '.......'.
  ENDIF.
  if r_bol eq 'X'.
    PERFORM sayi_bol USING p_num1
                             p_num2
                             CHANGING gv_sonuc.

    WRITE: gv_sonuc.
    WRITE: '.......'.
  ENDIF.

  WRITE: 'HİÇBİR SEÇİM YAPILMADI.'.

  INCLUDE zab_p17_001.
---------------------------------------------------------------
"include tarafı..
FORM sayi_topla USING pv_num1 TYPE i
                      pv_num2 TYPE i
                      CHANGING pv_sonuc.
  pv_sonuc = pv_num1 + pv_num2.
  "data : lv_sonuc TYPE i. "local variable

ENDFORM.

FORM sayi_carp USING pv_num1 TYPE i
                      pv_num2 TYPE i
                      CHANGING pv_sonuc.
  pv_sonuc = pv_num1 * pv_num2.
  "data : lv_sonuc TYPE i. "local variable

ENDFORM.

FORM sayi_cikar USING pv_num1 TYPE i
                      pv_num2 TYPE i
                      CHANGING pv_sonuc.
  pv_sonuc = pv_num1 - pv_num2.
  "data : lv_sonuc TYPE i. "local variable

ENDFORM.

FORM sayi_bol USING   pv_num1 TYPE i
                      pv_num2 TYPE i
                      CHANGING pv_sonuc.
  pv_sonuc = pv_num1 / pv_num2.
  "data : lv_sonuc TYPE i. "local variable

ENDFORM.
