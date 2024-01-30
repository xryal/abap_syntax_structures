*&---------------------------------------------------------------------*
*& Report ZAB_P68
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZAB_P68.


DATA : lv_username TYPE bapibname-bapibname,
       ls_logon    TYPE bapilogond,
       ls_address  TYPE bapiaddr3,
       ls_company  TYPE bapiuscomp,
       lt_return   TYPE bapiret2 OCCURS 0 WITH HEADER LINE,
       lt_usr02    TYPE STANDARD TABLE OF usr02,
       ls_usr02    TYPE usr02,
       gt_usr02    TYPE TABLE  OF zbk_user_structer,
       gs_usr02    TYPE zbk_user_structer,
       gt_fcat     TYPE lvc_t_fcat,
       gs_layout   TYPE lvc_s_layo.

TYPES : BEGIN OF ty_sirket_calisan,
          company     TYPE uscomp,
          kisi_sayisi TYPE i,
        END OF ty_sirket_calisan.

DATA : ls_sirket TYPE ty_sirket_calisan,
       lt_sirket TYPE TABLE OF ty_sirket_calisan WITH HEADER LINE.


SELECT * INTO TABLE lt_usr02 FROM usr02.

LOOP AT lt_usr02 INTO ls_usr02.
  CLEAR : ls_address, ls_company, ls_logon, lt_return.
  REFRESH : lt_return.
  CALL FUNCTION 'BAPI_USER_GET_DETAIL'
    EXPORTING
      username  = ls_usr02-bname
*     CACHE_RESULTS           = 'X'
*     EXTUID_GET              =
    IMPORTING
      logondata = ls_logon
*     DEFAULTS  =
      address   = ls_address
      company   = ls_company
*     SNC       =
*     REF_USER  =
*     ALIAS     =
*     UCLASS    =
*     LASTMODIFIED            =
*     ISLOCKED  =
*     IDENTITY  =
*     ADMINDATA =
*     DESCRIPTION             =
*     TECH_USER =
*     SAPUSER_UUID            =
    TABLES
      return    = lt_return.
  gs_usr02-bname = ls_usr02-bname.
  gs_usr02-company = ls_company-company.


  APPEND gs_usr02 TO gt_usr02.

ENDLOOP.

CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
  EXPORTING
    i_structure_name       = 'ZBK_USER_STRUCTER'
    i_client_never_display = 'X'
  CHANGING
    ct_fieldcat            = gt_fcat
*                                EXCEPTIONS
*   INCONSISTENT_INTERFACE = 1
*   PROGRAM_ERROR          = 2
*   OTHERS                 = 3
  .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
  EXPORTING
    i_callback_program       = sy-repid
    i_callback_pf_status_set = 'PF_STATUS_SET'
    i_callback_user_command  = 'USER_COMMAND'
    is_layout_lvc            = gs_layout
    it_fieldcat_lvc          = gt_fcat
    i_default                = 'X'
    i_save                   = ' '
*   IS_VARIANT               =
  TABLES
    t_outtab                 = gt_usr02
* EXCEPTIONS
*   PROGRAM_ERROR            = 1
*     OTHER
  .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

FORM pf_status_set USING p_extab TYPE slis_t_extab.
  SET PF-STATUS 'ZSTANDARD_FULLSCREEN'.
ENDFORM.





FORM user_command USING r_ucomm     LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.

  CASE r_ucomm.
    WHEN '&SUMTOTAL'.

      LOOP AT gt_usr02 INTO gs_usr02.

        MOVE-CORRESPONDING gs_usr02 TO ls_sirket.
        APPEND ls_sirket TO lt_sirket.
      ENDLOOP.

      SORT lt_sirket BY company.

      DELETE ADJACENT DUPLICATES FROM lt_sirket COMPARING company.

      LOOP AT lt_sirket.
        LOOP AT gt_usr02 INTO gs_usr02 WHERE company = lt_sirket-company.

          lt_sirket-kisi_sayisi = lt_sirket-kisi_sayisi + 1.


        ENDLOOP.
        MODIFY lt_sirket TRANSPORTING kisi_sayisi.
      ENDLOOP.



    WHEN OTHERS.
  ENDCASE.


ENDFORM.
