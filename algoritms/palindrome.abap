REPORT zab_p09_palindrome.


PARAMETERS: p_girdi TYPE string.

DATA: uzunluk         TYPE i,

      son_imlec       TYPE i,

      sayici          TYPE i VALUE '0',

      baslangic_imlec TYPE i.

uzunluk  = strlen( p_girdi ).

son_imlec = uzunluk - 1.

DO uzunluk TIMES.

  IF p_girdi+baslangic_imlec(1) = p_girdi+son_imlec(1).


    sayici = sayici + 1.

  ELSE.

    sayici = 0.

  ENDIF.

  son_imlec = son_imlec - 1.

  baslangic_imlec = baslangic_imlec + 1.

ENDDO.

IF strlen( p_girdi ) EQ sayici.

  WRITE:/ 'Girilen veri palindrom'.

ELSE.

  WRITE:/ 'Girilen veri palindrom değil'.

ENDIF.
