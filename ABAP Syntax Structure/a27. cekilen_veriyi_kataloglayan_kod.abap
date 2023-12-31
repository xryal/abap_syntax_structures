REPORT ZAB_P60.

TABLES : zmm_t001.

data : lt_zmm_t001 TYPE STANDARD TABLE OF zmm_t001,
       gt_fcat     TYPE slis_t_fieldcat_alv,
       gs_fcat     TYPE slis_fieldcat_alv.

PARAMETERS : p_ogrno type zmm_t001-ogrencino.

select * into TABLE lt_zmm_t001 from zmm_t001 where ogrencino eq p_ogrno.



" manuel field catalog
PERFORM appalv USING 'BLDAT' 'GT_DOSYA' 'Belge Tarihi' '10'.

" structure to internal table field catalog
" structure ddic oluşturulması gerekl
CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
* EXPORTING
*   I_BUFFER_ACTIVE              =
*   I_STRUCTURE_NAME             =
*   I_CLIENT_NEVER_DISPLAY       = 'X'
*   I_BYPASSING_BUFFER           =
*   I_INTERNAL_TABNAME           =
  CHANGING
    ct_fieldcat                  = gt_fcat
* EXCEPTIONS
*   INCONSISTENT_INTERFACE       = 1
*   PROGRAM_ERROR                = 2
*   OTHERS                       = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

*&---------------------------------------------------------------------*
*&      Form  appalv
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_FN       text
*      -->P_TN       text
*      -->P_TXT      text
*      -->P_FIX      text
*      -->P_KEY      text
*      -->P_NO_ZERO  text
*----------------------------------------------------------------------*
FORM appalv USING
            p_fn
            p_tn
            p_txt
            p_out.

  CLEAR gs_fcat.
  gs_fcat-fieldname = p_fn .
  gs_fcat-tabname   = p_tn .
  gs_fcat-seltext_m = p_txt .
  gs_fcat-outputlen = p_out.

  APPEND gs_fcat TO gt_fcat.

ENDFORM.    
