REPORT zab_p56.


SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE T2.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN POSITION 05.

  PARAMETERS p_cb1 AS CHECKBOX.
  SELECTION-SCREEN COMMENT 07(08) TEXT-001.
  SELECTION-SCREEN POSITION 20.

  PARAMETERS p_cb2 AS CHECKBOX.
  SELECTION-SCREEN COMMENT 22(08) TEXT-002.
  SELECTION-SCREEN POSITION 35.

  PARAMETERS p_cb3 AS CHECKBOX.
  SELECTION-SCREEN COMMENT 37(08) TEXT-003.
  SELECTION-SCREEN POSITION 50.

  PARAMETERS p_cb4 AS CHECKBOX DEFAULT 'X'..
  SELECTION-SCREEN COMMENT 52(08) TEXT-004.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK

PARAMETERS : p_d1 TYPE string,
             p_d2 TYPE string,
             p_d3 TYPE string.

SELECTION-SCREEN skip 3.
PARAMETERS : p_d4 TYPE STRING.

DATA lv_v1 TYPE string.


SELECTION-SCREEN SKIP 2.
SELECTION-SCREEN PUSHBUTTON 6(10) pb1 USER-COMMAND FULL.
SELECTION-SCREEN PUSHBUTTON 30(10) pb2 USER-COMMAND CLEAR.
SELECTION-SCREEN PUSHBUTTON 54(10) pb3 USER-COMMAND EXIT.

INITIALIZATION.

  pb1 = 'tam isim'.
  pb2 = 'X'.
  pb3 = 'Exit'.
  T1 = 'İŞLEM TÜRÜNÜ SEÇİN'.

AT SELECTION-SCREEN.

  CASE sy-ucomm.
    WHEN 'FULL'.
*     CONCATENATE p_d1 p_d2 p_d3 INTO lv_v1 SEPARATED BY space.
      CONCATENATE p_d1 p_d2 p_d3 INTO p_d4 SEPARATED BY space.

      WRITE : / 'tam isim:', lv_v1.
    WHEN 'CLEAR'.
      CLEAR: p_d1, p_d2, p_d3.
    WHEN 'EXIT'.
      leave PROGRAM.
  ENDCASE.
