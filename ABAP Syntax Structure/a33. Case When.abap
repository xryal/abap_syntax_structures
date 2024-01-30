*&---------------------------------------------------------------------*
*& Report ZAB_P61
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p61.

TYPES : BEGIN OF ty_kunnr,
          kunnr TYPE kna1-kunnr,
          land1 TYPE kna1-land1,
          name1 TYPE kna1-name1,

        END OF ty_kunnr.


*
*DATA : it_kunnr TYPE TABLE OF ty_kunnr,
*       wa_kunnr TYPE ty_kunnr.
*
*SELECT KUNNR LAND1 NAME1 FROM KNA1 INTO TABLE IT_KUNNR. "eski syntax
*SELECT KUNNR, LAND1, NAME1 FROM KNA1 INTO TABLE @data(IT_KUNNR). "yeni syntax



*  LOOP AT IT_KUNNR INTO WA_KUNNR.
*    WRITE :/ WA_KUNNR-KUNNR, WA_KUNNR-LAND1, WA_KUNNR-NAME1.
*  ENDLOOP.

SELECT  kunnr AS cust_no,  "yeni syntax " INTERNAL TABLE.
   land1 AS country,
   CASE
   WHEN land1 = 'DE'
   THEN 'DENEME' END AS full_name,
   name1 AS cust_name
   FROM kna1
   INTO TABLE @data(it_kunnr).

cl_demo_output=>display( it_kunnr ).

*DATA LV_D1 TYPE KNA1-KUNNR VALUE '0000001000'.

*SELECT SINGLE KUNNR, LAND1, NAME1 FROM KNA1 INTO @DATA(WA_KUNNR) WHERE KUNNR = @LV_D1.

*

*  CL_DEMO_OUTPUT=>DISPLAY( WA_KUNNR ).              " WORK AREA.
