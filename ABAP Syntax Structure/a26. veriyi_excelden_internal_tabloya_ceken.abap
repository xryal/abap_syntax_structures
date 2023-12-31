PARAMETERS : p_fname TYPE localfile OBLIGATORY.


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fname.
  PERFORM f4_fname.

START-OF-SELECTION.

  PERFORM upload_data.


*&---------------------------------------------------------------------*
*&      Form  f4_fname
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM f4_fname .
  DATA: file_table TYPE filetable,
        file_line TYPE file_table,
        rc TYPE i.

  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      default_extension       = ''
    CHANGING
      file_table              = file_table
      rc                      = rc
    EXCEPTIONS
      file_open_dialog_failed = 1
      cntl_error              = 2
      error_no_gui            = 3
      not_supported_by_gui    = 4
      OTHERS                  = 5.

  READ TABLE file_table INTO file_line INDEX 1.
  IF sy-subrc = 0.
    p_fname = file_line-filename.
  ENDIF.
ENDFORM.                                                    "f4_fname

*&---------------------------------------------------------------------*
*&      Form  upload_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM upload_data .
  DATA: lt_file LIKE alsmex_tabline OCCURS 0 WITH HEADER LINE.
  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = p_fname
      i_begin_col             = 1
      i_begin_row             = 2
      i_end_col               = 10
      i_end_row               = 1000
    TABLES
      intern                  = lt_file
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.

  IF sy-subrc NE 0 OR lt_file[] IS INITIAL.
    MESSAGE 'Dosya Okunamadı !' TYPE 'I'.
  ELSE.
*    REFRESH gt_dosya.
*    LOOP AT lt_file.
*      gt_dosya-bldat = p_bldat.
*      gt_dosya-budat = p_bldat.
*      gt_dosya-dzfbdt = p_dzfbdt.
*      CASE lt_file-col.
*        WHEN '0001'.
*          MOVE lt_file-value TO gt_dosya-blart.
*        WHEN '0002'.
*          MOVE lt_file-value TO gt_dosya-bukrs.
*        WHEN '0003'.
*          MOVE lt_file-value TO gt_dosya-waers.
*        WHEN '0004'.
*          MOVE lt_file-value TO gt_dosya-xblnr1.
*        WHEN '0005'.
*          MOVE lt_file-value TO gt_dosya-newko.
*        WHEN '0006'.
*          MOVE lt_file-value TO gt_dosya-dzumsk.
*        WHEN '0007'.
*          MOVE lt_file-value TO gt_dosya-wrbtr.
*        WHEN '0008'.
*          MOVE lt_file-value TO gt_dosya-schzw_bseg.
*        WHEN '0009'.
*          MOVE lt_file-value TO gt_dosya-dzuonr.
*        WHEN '0010'.
*          MOVE lt_file-value TO gt_dosya-sgtxt.
*      ENDCASE.
*
*      AT END OF row.
*        APPEND gt_dosya.
*        CLEAR gt_dosya.
*      ENDAT.
*    ENDLOOP.
*
*    IF gt_dosya[] IS INITIAL.
*      MESSAGE 'Dosyada Data Bulunamadı!' TYPE 'I'.
*    ENDIF.
  ENDIF.
ENDFORM.                    "upload_data
