*&---------------------------------------------------------------------*
*& Report ZDINTERNAL_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZDINTERNAL_TABLE.

TYPES : BEGIN OF TY_ST1,
     FIELD1 TYPE I,
     FIELD2 TYPE STRING,
     FIELD3(20) TYPE C,
  END OF TY_ST1.

  DATA : IT_ST1 TYPE TABLE OF TY_ST1 WITH HEADER LINE,   "" WITH HEADER.
         IT_ST2 TYPE TABLE OF TY_ST1,      " WITHOUT HEADER.
         WA_ST2 TYPE TY_ST1.

  IT_ST1-FIELD1 = 1000.
  IT_ST1-FIELD2 = 'HELLO USER'.
  IT_ST1-FIELD3 = 'BYE USER'.
  APPEND IT_ST1.

  IT_ST1-FIELD1 = 1001.
  IT_ST1-FIELD2 = 'HELLO USER ONE'.
  IT_ST1-FIELD3 = 'BYE USER ONE '.
  APPEND IT_ST1.

  IT_ST1-FIELD1 = 1002.
  IT_ST1-FIELD2 = 'HELLO USER TWO'.
  IT_ST1-FIELD3 = 'BYE USER TWO'.
  APPEND IT_ST1.

*  WRITE : / IT_ST1-FIELD1, IT_ST1-FIELD2, IT_ST1-FIELD3.

*  LOOP AT IT_ST1.
*   WRITE : / IT_ST1-FIELD1, IT_ST1-FIELD2, IT_ST1-FIELD3.
*
*  ENDLOOP.

*  IT_ST2-FIELD1 = 1000.
*  IT_ST2-FIELD2 = 'HELLO USER'.
*  IT_ST2-FIELD3 = 'BYE USER'.
*  APPEND IT_ST1.

  WA_ST2-FIELD1 = 1000.
  WA_ST2-FIELD2 = 'HELLO USER ONE'.
  WA_ST2-FIELD3 = 'BYE USER ONE'.
  APPEND WA_ST2 TO IT_ST2.

  WA_ST2-FIELD1 = 1001.
  WA_ST2-FIELD2 = 'HELLO USER TWO'.
  WA_ST2-FIELD3 = 'BYE USER TWO'.
  APPEND WA_ST2 TO IT_ST2.

  WA_ST2-FIELD1 = 1002.
  WA_ST2-FIELD2 = 'HELLO USER THREE'.
  WA_ST2-FIELD3 = 'BYE USER THREE'.
  APPEND WA_ST2 TO IT_ST2.

  LOOP AT IT_ST2 INTO WA_ST2.
    WRITE : / WA_ST2-FIELD1, WA_ST2-FIELD2, WA_ST2-FIELD3.
  ENDLOOP.

* HOW TO FIND THE NO OF RECORDS COUNT INOUR INTERNAL TABLE.

* FIRST WAAY OF GETTING NO OF RECORDS.
  ULINE.
  DESCRIBE TABLE IT_ST2.
  WRITE :/ 'NO OF RECORDS AVAILABLE IN IT_ST2', SY-TFILL.

* SECOND WAAY OF GETTING NO OF RECORDS.
  ULINE.
  DATA LV_COUNT TYPE I.

  LV_COUNT = LINES( IT_ST2 ).

   WRITE :/ '2ND WAY - NO OF RECORDS AVAILABLE IN IT_ST2', LV_COUNT.
   CLEAR LV_COUNT.
* THIRD WAAY OF GETTING NO OF RECORDS.
  ULINE.
    DESCRIBE TABLE IT_ST2 LINES LV_COUNT.
  WRITE :/ 'NO OF RECORDS AVAILABLE IN IT_ST2', LV_COUNT.
  ULINE.
************************************************

* ************************************ASSIGNING THE DATA BETWEEN INTERNAL TABLES ****************

  DATA : IT_ST3 TYPE TABLE OF TY_ST1.

      DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.
  ULINE.

*  IT_ST3 = IT_ST1.  " NOT COMPATIABLE.

   IT_ST3[] = IT_ST1[].       " SUCCESS. ASSIGN THE BODY OF THE INTERNAL TABLE.

  DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'AFTER ASSIGNING THE DATA ,NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.

* ***********************************

* SECOND WAY OF ASSIGNING THE DATA BETWEEN INTERNAL TABLES.
CLEAR IT_ST3.  " USING CLEAR STATEMENT, WE CAN CLEAR LOCAL VARIABLE, WORK AREA, INTERNAL TABLES.
  DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'AFTER ASSIGNING THE DATA ,NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.

  APPEND LINES OF IT_ST1 TO IT_ST3.

  ULINE.

    DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'AFTER ASSIGNING THE DATA ,NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.

  ULINE.
  REFRESH IT_ST3.  " FOR CLEARING THE INTERNAL TABLE ONLY..

  DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'AFTER ASSIGNING THE DATA ,NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.

  ULINE.

*********************** ASSIGNING A PARTICULAR RANGE VALUES.

APPEND LINES OF IT_ST1 FROM 2 TO 3 TO IT_ST3.

  DESCRIBE TABLE IT_ST3 LINES LV_COUNT.
  WRITE :/ 'AFTER ASSIGNING THE DATA ,NO OF RECORDS AVAILABLE IN IT_ST3', LV_COUNT.
  
  


*****************************************************************************
*****************************************************************************
*****************************************************************************
*****************************************************************************
*****************************************************************************
*****************************************************************************

*&---------------------------------------------------------------------*
*& Report ZDINTERNAL_TABLE2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdinternal_table2.

TYPES : BEGIN OF ty_india,
          pincode   TYPE i,
          cname(20) TYPE c,
          ctype     TYPE string,
        END OF ty_india.

DATA : it_india1 TYPE TABLE OF ty_india,
       wa_india1 TYPE ty_india.

wa_india1-pincode = 100001.
wa_india1-cname = 'NEW DELHI'.
wa_india1-ctype = 'METRO'.
APPEND wa_india1 TO it_india1.
CLEAR wa_india1.
wa_india1-pincode = 800001.
wa_india1-cname = 'MUMBAI'.
wa_india1-ctype = 'METRO'.
APPEND wa_india1 TO it_india1.

CLEAR wa_india1.
wa_india1-pincode = 700001.
wa_india1-cname = 'KOLKATA'.
wa_india1-ctype = 'SEMI-METRO'.
APPEND wa_india1 TO it_india1.
CLEAR wa_india1.
wa_india1-pincode = 600001.
wa_india1-cname = 'CHENNAI'.
wa_india1-ctype = 'METRO'.
APPEND wa_india1 TO it_india1.
CLEAR wa_india1.
wa_india1-pincode = 200001.
wa_india1-cname = 'NOIDA'.
wa_india1-ctype = 'NON-METRO'.
APPEND wa_india1 TO it_india1.
CLEAR wa_india1.
wa_india1-pincode = 500001.
wa_india1-cname = 'BANGLORE'.
wa_india1-ctype = 'SEMI-METRO'.
APPEND wa_india1 TO it_india1.

CLEAR wa_india1.
wa_india1-pincode = 500011.
wa_india1-cname = 'BANGLORE11'.
wa_india1-ctype = 'NON-METRO'.
APPEND wa_india1 TO it_india1.

DESCRIBE TABLE it_india1.
WRITE :' NO OF RECORDS IN IT_INDIA1 TABLE IS :- ', sy-tfill.

ULINE.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.

ULINE.

*SORT it_india1.
*
*LOOP AT it_india1 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*ULINE.
**************************
*
*DATA : IT_INDIA2 TYPE TABLE OF TY_INDIA WITH KEY PINCODE.
*
*DESCRIBE TABLE it_india2.
*WRITE :' NO OF RECORDS IN IT_INDIA2 TABLE IS :- ', sy-tfill.
*ULINE.
*IT_INDIA2 = IT_INDIA1.
*
*DESCRIBE TABLE it_india2.
*WRITE :' NO OF RECORDS IN IT_INDIA2 TABLE IS :- ', sy-tfill.
*
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*ULINE.
*
*SORT IT_INDIA2.
*
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*
*ULINE.
*
*SORT IT_INDIA2 BY CTYPE DESCENDING.
*
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*ULINE.
*
*DESCRIBE TABLE it_india2.
*WRITE :' NO OF RECORDS IN IT_INDIA2 TABLE IS :- ', sy-tfill.
*
**FREE IT_INDIA2.
**
**DESCRIBE TABLE it_india2.
**WRITE :' NO OF RECORDS IN IT_INDIA2 TABLE IS :- ', sy-tfill.
*
********************************** INSERT ***********************
*ULINE.
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*ULINE.
*CLEAR wa_india1.
*wa_india1-pincode = 300001.
*wa_india1-cname = 'INDORE'.
*wa_india1-ctype = 'SEMI-METRO'.
*INSERT WA_INDIA1 INTO TABLE IT_INDIA2.
*
*DESCRIBE TABLE it_india2.
*WRITE :' NO OF RECORDS IN IT_INDIA2 TABLE IS :- ', sy-tfill.
*
*ULINE.
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*
*ULINE.
*
*CLEAR wa_india1.
*wa_india1-pincode = 300011.
*wa_india1-cname = 'INDORE11'.
*wa_india1-ctype = 'SEMI-METRO11'.
*INSERT WA_INDIA1 INTO IT_INDIA2 INDEX 3.
*
*ULINE.
*LOOP AT it_india2 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
*
*
******************* END OF INSERT STATEMENT ************
*
******************* READ STATEMENT ************
* CLEAR WA_INDIA1.
* READ TABLE IT_INDIA1 INTO WA_INDIA1 INDEX 7.
*
* IF SY-SUBRC = 0.
*   WRITE :/ ' READ STATEMENT IS SUCCESSFULL',
*          / WA_INDIA1-PINCODE,  WA_INDIA1-CNAME,  WA_INDIA1-CTYPE.
*  ELSE.
*    WRITE :/ ' READ STATEMENT IS NOT SUCCESSFULL'.
* ENDIF.                 " INDEX 7 IS NOT AVAILABLE, SO READ STATEMENT IS UNSUCCESSFULLY.
*
* ULINE.
*
*  CLEAR WA_INDIA1.
* READ TABLE IT_INDIA2 INTO WA_INDIA1 INDEX 7.
*
* IF SY-SUBRC = 0.
*   WRITE :/ ' READ STATEMENT IS SUCCESSFULL',
*          / WA_INDIA1-PINCODE,  WA_INDIA1-CNAME,  WA_INDIA1-CTYPE.
*  ELSE.
*    WRITE :/ ' READ STATEMENT IS NOT SUCCESSFULL'.
* ENDIF.
*
* ULINE.
*
*   CLEAR WA_INDIA1.
* READ TABLE IT_INDIA2 INTO WA_INDIA1 INDEX 7 TRANSPORTING CNAME CTYPE.
*
* IF SY-SUBRC = 0.
*   WRITE :/ ' READ STATEMENT IS SUCCESSFULL',
*          / WA_INDIA1-PINCODE,  WA_INDIA1-CNAME,  WA_INDIA1-CTYPE.
*  ELSE.
*    WRITE :/ ' READ STATEMENT IS NOT SUCCESSFULL'.
* ENDIF.
*
* ULINE..
*   CLEAR WA_INDIA1.
* READ TABLE IT_INDIA2 INTO WA_INDIA1 WITH KEY PINCODE = 600001.
*
* IF SY-SUBRC = 0.
*   WRITE :/ ' READ STATEMENT IS SUCCESSFULL',
*          / WA_INDIA1-PINCODE,  WA_INDIA1-CNAME,  WA_INDIA1-CTYPE.
*  ELSE.
*    WRITE :/ ' READ STATEMENT IS NOT SUCCESSFULL'.
* ENDIF.

****************** END OF READ STATEMENT ************

******************PROCESS INTERNAL TABLE DATA - MODIFY - DELETE ************

* FIRST WAY OF DATA MODIFICATION IN INTERNAL TABLE.

LOOP AT IT_INDIA1 INTO WA_INDIA1 WHERE CTYPE = 'SEMI-METRO'.
  WA_INDIA1-CTYPE = 'SEMI-INDIA11'.
  MODIFY IT_INDIA1 FROM WA_INDIA1.
ENDLOOP.

ULINE.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.

* 2ND WAY OF DATA MODIFICATION IN INTERNAL TABLE FOR BETTER PERFROMANCE.

LOOP AT IT_INDIA1 INTO WA_INDIA1 WHERE CTYPE = 'SEMI-INDIA11'.
  WA_INDIA1-CTYPE = 'SEMI-METRO'.
  MODIFY IT_INDIA1 FROM WA_INDIA1 TRANSPORTING CTYPE..
ENDLOOP.

ULINE.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.

* 3RD WAY OF DATA MODIFICATION IN INTERNAL TABLE FOR BETTER PERFROMANCE.

WA_INDIA1-CTYPE = 'SEMI-INDIA11'.

MODIFY IT_INDIA1 FROM WA_INDIA1 TRANSPORTING CTYPE WHERE CTYPE = 'SEMI-METRO'.

ULINE.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.


******************************** END OF MODIFY STATEMENT*********
******************************** DELETE STATEMENT.*****************

DELETE IT_INDIA1 WHERE CTYPE = 'NON-METRO'.

ULINE.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.
* ULINE.
*DELETE ADJACENT DUPLICATES FROM IT_INDIA1 COMPARING CTYPE.   " TO DELETE THE DUPLICATE DATA KEEPING THE FIRST RECORD.
*
*LOOP AT it_india1 INTO wa_india1.
*  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
*ENDLOOP.
ULINE.
SORT IT_INDIA1 BY CTYPE.

 ULINE.
DELETE ADJACENT DUPLICATES FROM IT_INDIA1 COMPARING CTYPE.   " TO DELETE THE DUPLICATE DATA KEEPING THE FIRST RECORD.

LOOP AT it_india1 INTO wa_india1.
  WRITE :/ wa_india1-pincode, wa_india1-cname, wa_india1-ctype.
ENDLOOP.
