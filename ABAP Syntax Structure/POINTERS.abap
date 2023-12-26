*&---------------------------------------------------------------------*
*& Report ZAB_P47
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p47.

*************ITAB KULLANIMI*************

TYPES: BEGIN OF itab_deneme,
         sutun1 TYPE i,
         sutun2 TYPE i,
         sutun3 TYPE i,
       END OF itab_deneme.

DATA: lt_deneme TYPE STANDARD TABLE OF itab_deneme.
DATA: ls_deneme TYPE itab_deneme,
      lv_deneme TYPE i.
DATA  gv_counter TYPE i VALUE IS INITIAL.


WHILE gv_counter LT 3.
  gv_counter = gv_counter + 1.
  ls_deneme-sutun1 = 100 + gv_counter.
  ls_deneme-sutun2 = '100'.
  ls_deneme-sutun3 = 100 + gv_counter.
  APPEND ls_deneme TO lt_deneme .
ENDWHILE.


*FIELD-SYMBOLS <itab_ITAB_type> Like LINE OF lt_deneme.
*FIELD-SYMBOLS <itab_WA_type> Like ls_deneme.
*FIELD-SYMBOLS <itab_generic_type> TYPE ANY.
*FIELD-SYMBOLS <itab_NUMERIC_type> TYPE NUMERIC.
*FIELD-SYMBOLS <itab_TABLE_type> TYPE ANY TABLE.
*FIELD-SYMBOLS <itab_I_type> TYPE I.
*FIELD-SYMBOLS <itab_CHAR_type> TYPE CLIKE.
FIELD-SYMBOLS <itab_ITAB_type> LIKE LINE OF lt_deneme .

LOOP AT lt_deneme ASSIGNING <itab_ITAB_type>.
  WRITE: / 'sutun1 değeri:'color 5,<itab_ITAB_type>-sutun1 color 6.
  WRITE: / 'sutun2 değeri:'color 5,<itab_ITAB_type>-sutun2 color 7.
  WRITE: / 'sutun3 değeri:'color 5,<itab_ITAB_type>-sutun3 color 1.
ENDLOOP.
skip 1.
uline 1.
*************WA KULLANIMI*************

FIELD-SYMBOLS <itab_WA_type> LIKE ls_deneme.
ASSIGN ls_deneme TO <itab_WA_type>.

WHILE gv_counter LT 10.
  gv_counter = gv_counter + 1.

  <itab_WA_type>-sutun1 = 100 + gv_counter.
  <itab_WA_type>-sutun2 = '100'.
  <itab_WA_type>-sutun3 = 100 + gv_counter.


  WRITE: / 'sutun1 değeri:'color 5,<itab_WA_type>-sutun1 color 6.
  WRITE: / 'sutun2 değeri:'color 5,<itab_WA_type>-sutun2 color 7.
  WRITE: / 'sutun3 değeri:'color 5,<itab_WA_type>-sutun3 color 1.
ENDWHILE.
skip 1.
uline 1.

*************VARIABLE KULLANIMI*************
FIELD-SYMBOLS <itab_I_type> LIKE lv_deneme.
ASSIGN lv_deneme TO <itab_I_type>.

lv_deneme = 11.

WRITE : / <itab_I_type> LEFT-JUSTIFIED color 5.
skip 1.
uline 1.
*************STATIC ASSIGNMENT*************

DATA lv_name(10) TYPE c VALUE 'naber veli'.
FIELD-SYMBOLS: <static_assign> TYPE c.

ASSIGN lv_name TO <static_assign>.

WRITE : / <static_assign> LEFT-JUSTIFIED color 5.
skip 1.
uline 1.
*************2X FIELD SEMBOL ATAMASI*************

DATA: lv_field TYPE i VALUE 50.

FIELD-SYMBOLS: <lfs_1> TYPE i,
               <lfs_2> type i.

ASSIGN lv_field TO <lfs_1>.
WRITE: 'Field Symbol #1:',<lfs_1> color 5.
skip 1.
uline 1.
ASSIGN <lfs_1> TO <lfs_2>.

WRITE: 'Field Symbol #2:',<lfs_2> color 5.
skip 1.
uline 1.
