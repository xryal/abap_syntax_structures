REPORT ZAB_P40.

*TABLES : ZAB_T01_DBVIEW.
*
*data gs_fetchview type ZAB_T01_DBVIEW.
*
*data gt_fetchview TYPE table of ZAB_T01_DBVIEW.
*
*select * from ZAB_T01_DBVIEW  into gs_fetchview .
*
*  append gs_fetchview to gt_fetchview.
*
*  ENDSELECT.
*
*
*
*  LOOP AT gt_fetchview INto gs_fetchview .
*
*    WRITE : gs_fetchview-seatsocc.
*    WRITE : gs_fetchview-seatsmax.
*    WRITE : gs_fetchview-carrname.
*    WRITE : gs_fetchview-currcodeview.
*
*  ENDLOOP.


  "***************************************************************

data gs_fetchview1 type ZAB_T02_DBVWEMP.

 data gt_fetchview1 TYPE table of ZAB_T02_DBVWEMP.

select * from ZAB_T02_DBVWEMP  into gs_fetchview1 .

  append gs_fetchview1 to gt_fetchview1.

  ENDSELECT.



  LOOP AT gt_fetchview1 INto gs_fetchview1  .

    WRITE : /'ÇALIŞAN ID:',gs_fetchview1-employee_id_vw.
    WRITE : /'DEPARTMAN ID:',gs_fetchview1-DEPARTMAN_ID_VW.
    WRITE : /'ZAB_POSITION_ID:',gs_fetchview1-position_id_vw.
    WRITE : / 'POSITION_NAME:',gs_fetchview1-position_name_vw.
    WRITE : /'ÇALIŞAN ID:',gs_fetchview1-departman_name_vw.
    WRITE : /'DEPARTMAN ADI:',gs_fetchview1-first_name_vw.
    WRITE : / 'SOYADI:',gs_fetchview1-last_name_vw.
    WRITE : /'Client:',gs_fetchview1-mandt.
    WRITE : / .
    WRITE : / .
    WRITE : / .


  ENDLOOP.
