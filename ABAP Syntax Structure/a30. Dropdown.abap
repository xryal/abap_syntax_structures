*&---------------------------------------------------------------------*
*& Report ZAB_P57
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p56.

TABLES zab_t01_employee.

PARAMETERS p_d1 AS LISTBOX VISIBLE LENGTH 10.

TYPES : BEGIN OF ty_t01_employee_first_name,
          first_name TYPE zab_first_name_de,
        END OF ty_t01_employee_first_name.

DATA : it_first_name TYPE STANDARD TABLE OF ty_t01_employee_first_name,
       wa_first_name TYPE ty_t01_employee_first_name,
       it_values     TYPE vrm_values,
       wa_values     TYPE vrm_value,
       lv_id         TYPE vrm_id.



AT SELECTION-SCREEN OUTPUT.
  SELECT first_name FROM zab_t01_employee INTO TABLE it_first_name UP TO 6 ROWS.

  IF it_first_name IS NOT INITIAL.
    LOOP AT it_first_name INTO wa_first_name.
      wa_values-key = wa_first_name-first_name.
      wa_values-text = wa_first_name-first_name.
      APPEND wa_values TO it_values.
      CLEAR wa_values.
    ENDLOOP.
  ENDIF.

  lv_id = 'P_D1'.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id     = lv_id
      values = it_values
*   EXCEPTIONS
*     ID_ILLEGAL_NAME       = 1
*     OTHERS = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
