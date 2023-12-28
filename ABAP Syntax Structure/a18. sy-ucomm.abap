
DATA: gv_counter TYPE I.

START-OF-SELECTION.

  PERFORM display_screen.

AT USER-COMMAND.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'EXIT'.
      PERFORM exit_program.
    WHEN 'SAVE'.
      PERFORM save_data.
    WHEN 'DISPLAY'.
      PERFORM display_data.
    WHEN 'EDIT'.
      PERFORM edit_data.
    WHEN 'RESET'.
      PERFORM reset_data.
    WHEN OTHERS.
      PERFORM unknown_command.
  ENDCASE.

*&---------------------------------------------------------------------*
*&      Form  DISPLAY_SCREEN
*&---------------------------------------------------------------------*
FORM display_screen.
  CLEAR gv_counter.
  LOOP AT lt_data.
    ADD 1 TO gv_counter.
    WRITE: / gv_counter, lt_data-field1, lt_data-field2.
  ENDLOOP.

  SKIP 2.
  WRITE: 'F1: BACK',
         'F2: SAVE',
         'F3: DISPLAY',
         'F4: EDIT',
         'F5: RESET',
         'F12: EXIT'.

  SKIP 2.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  EXIT_PROGRAM
*&---------------------------------------------------------------------*
FORM exit_program.
  LEAVE TO SCREEN 0.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  SAVE_DATA
*&---------------------------------------------------------------------*
FORM save_data.
  " Implement save logic here
  WRITE: 'Data saved successfully.'.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  DISPLAY_DATA
*&---------------------------------------------------------------------*
FORM display_data.
  " Implement display logic here
  WRITE: 'Data displayed successfully.'.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  EDIT_DATA
*&---------------------------------------------------------------------*
FORM edit_data.
  " Implement edit logic here
  WRITE: 'Data edited successfully.'.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  RESET_DATA
*&---------------------------------------------------------------------*
FORM reset_data.
  " Implement reset logic here
  WRITE: 'Data reset successfully.'.
ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  UNKNOWN_COMMAND
*&---------------------------------------------------------------------*
FORM unknown_command.
  WRITE: 'Unknown command. Please try again.'.
ENDFORM.
