PARAMETERS: p_input TYPE string OBLIGATORY.

DATA: lv_length TYPE i,
      lv_half_length TYPE i,
      lv_is_palindrome TYPE abap_bool,
      lv_message TYPE string.

lv_length = STRLEN( p_input ).
lv_half_length = lv_length / 2.

DO lv_half_length TIMES.
  IF p_input( sy-index ) NE p_input( lv_length - sy-index + 1 ).
    lv_is_palindrome = abap_false.
    EXIT.
  ENDIF.
ENDDO.

IF lv_is_palindrome IS INITIAL.
  lv_message = 'Girilen kelime bir palindrom değildir.'.
ELSE.
  lv_message = 'Girilen kelime bir palindromdur.'.
ENDIF.

WRITE: / lv_message.

