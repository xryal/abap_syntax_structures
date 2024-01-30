*&---------------------------------------------------------------------*
*& Report ZAB_P53
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZAB_P53.



"structure types(data keyword)
DATA : begin of  st1,
  first type i,
  second(10) type c,
  third type string,
  fourth type p decimals 2,
  END OF st1.

  WRITE : / 'first:', st1-first. "boş
  WRITE : / 'second:', st1-second.
  WRITE : / 'third:', st1-third.
  WRITE : / 'fourth:', st1-fourth.

  skip 2.
  uline 1.

  st1-first = 1.
  st1-second = 'naber'.
  st1-third = 'iyidir'.
  st1-fourth = 2.

  "st1 dan türedi.
  data st2 like st1.

  st2-first = 2.
  st2-second = 'asdfasfas'.
  st2-third = '3evwe'.
  st1-fourth = 3.

  WRITE : / 'first:', st2-first. "2
  WRITE : / 'second:', st2-second.
  WRITE : / 'third:', st2-third.
  WRITE : / 'fourth:', st2-fourth.

  skip 2.
  uline 1.

  MOVE st1 to st2.
  MOVE-CORRESPONDING st1 to st2. "structure yapısı farklı bile olsa error vermez.

  WRITE : / 'first:', st1-first. "1
  WRITE : / 'second:', st1-second.
  WRITE : / 'third:', st1-third.
  WRITE : / 'fourth:', st1-fourth.

   skip 2.
  uline 1.


  """"""""""""""""""NESTED STRUCTURE"""""""""""""""""""

  data : BEGIN OF st3,
    first type i,
    second(20) type c,
    BEGIN OF st4,
      4first type string,
      second type i,
      END OF st4,
      third type string,
      END OF st3.

    st3-first = 1000.
    st3-second = '1000'.
    st3-st4-4first = 'naber'.
