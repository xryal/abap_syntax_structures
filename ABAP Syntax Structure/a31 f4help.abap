*&---------------------------------------------------------------------*
*& Report ZAB_P57_F4HELP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p57_f4help.

PARAMETERS p_d1 TYPE zab_first_name_de.

"STANDART bir field olan kunnr tipinde bir parametre alırken f4 search help açılıyor.
PARAMETERS p_d2 TYPE kunnr.

TYPES : BEGIN OF ty_first_name,
          first_name TYPE zab_first_name_de,
        END OF ty_first_name.

DATA : it_first_name TYPE TABLE OF ty_first_name,
       ls_first_name TYPE ty_first_name.

"search help kulakcığı ÜRETME


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_d1.
MESSAGE ' selam kullanıcı p_D1 kullanıldı' TYPE 'I'.



  SELECT first_name FROM zab_t01_employee INTO TABLE it_first_name UP TO 6 ROWS.

  "F4IF_INT_TABLE_VALUE_REQUEST
  IF it_first_name IS NOT INITIAL.
    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING
*       DDIC_STRUCTURE         = ' '
        retfield    = 'first_name'
*       PVALKEY     = ' '
        dynpprog    = sy-repid "Report Program Identification değeri
        dynpnr      = sy-dynnr "ekran numarası
        dynprofield = 'first_name'
*       STEPL       = 0
*       WINDOW_TITLE           =
*       VALUE       = ' '
        value_org   = 'S'
*       MULTIPLE_CHOICE        = ' '
*       DISPLAY     = ' '
*       CALLBACK_PROGRAM       = ' '
*       CALLBACK_FORM          = ' '
*       CALLBACK_METHOD        =
*       MARK_TAB    =
*        IMPORTING
*       USER_RESET  =
      TABLES
        value_tab   = it_first_name
*       FIELD_TAB   =
*       RETURN_TAB  =
*       DYNPFLD_MAPPING        =
*        EXCEPTIONS
*       PARAMETER_ERROR        = 1
*       NO_VALUES_FOUND        = 2
*       OTHERS      = 3
      .
    IF sy-subrc <> 0.

      WRITE : / 'işlem başarıyla gerçekleşti'.

    ENDIF.

  ENDIF.
