REPORT zab_p29_random_generator.

DATA: gv_range  TYPE i,
      gv_random TYPE i.


START-OF-SELECTION.

  gv_range = 150.

  CALL FUNCTION 'GENERAL_GET_RANDOM_INT'
    EXPORTING
      range  = gv_range
    IMPORTING
      random = gv_random.

  WRITE: 'Sayı: ', gv_random.

  IF gv_random >= 0 AND gv_random < 25.

    WRITE:/ '0 ile 25 arasındadır!'.

    ELSEIF gv_random >= 25 AND gv_random < 50.

    WRITE: / '25 ile 50 arasındadır!'.

  ELSEIF gv_random >= 50 AND gv_random < 75.

    WRITE: / '50 ile 75 arasındadır!'.

  ELSEIF gv_random >= 75 AND gv_random < 100.

    WRITE: / '75 ile 100 arasındadır!'.

  ELSE.

    WRITE: /'100 den büyüktür!'.

  ENDIF.
