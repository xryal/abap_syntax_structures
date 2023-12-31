REPORT zab_p58_internal_table.

TYPES : BEGIN OF ty_st1,
          field1     TYPE i,
          field2     TYPE string,
          field3(20) TYPE c,
        END OF ty_st1.

DATA : it_st1 TYPE TABLE OF ty_st1 WITH HEADER LINE, "tablo ismi structure gibi kullanılabilir.
       wa_st2 TYPE  ty_st1, "without header.
       it_st3 TYPE TABLE OF  ty_st1.

"---------------------------------------------------------------------------------------------

"header line kullanarak structure gibi tablomuza değer koyduk
it_st1-field1 = 1000.
it_st1-field2 = 'merhaba kullanıcı'.
it_st1-field3 = 'naber'.
APPEND it_st1.
"---------------------------------------------------------------------------------------------

"kendimi structure yazarak kullandık.
wa_st2-field1 = 1000.
wa_st2-field2 = 'merhaba kullanıcı'.
wa_st2-field3 = 'naber'.
APPEND wa_st2 TO it_st1 .

"---------------------------------------------------------------------------------------------

"Header line kullanarak loopa soktuk
LOOP AT it_st1 .
  WRITE : / it_st1-field1,it_st1-field2,it_st1-field3.
ENDLOOP.

"---------------------------------------------------------------------------------------------

"Kendi structureımızı kullanarak loopa soktuk
LOOP AT it_st1 INTO wa_st2 .
  WRITE : / it_st1-field1,it_st1-field2,it_st1-field3.
ENDLOOP.
ULINE 1.
"---------------------------------------------------------------------------------------------

"get the number of columns
DESCRIBE TABLE it_st3.
WRITE :/ 'RECORD BULUNAMADI', sy-tfill LEFT-JUSTIFIED.
SKIP .
ULINE 1.


DATA lv_count TYPE i.
lv_count = lines( it_st1 ).
WRITE : / 'RECORD BULUNdu', lv_count LEFT-JUSTIFIED.
SKIP .
ULINE 1.

"---------------------------------------------------------------------------------------------

DATA : it_st4 TYPE TABLE OF ty_st1.

DESCRIBE TABLE it_st3 LINES lv_count.
WRITE :/ 'RECORD BULUNAMADI', lv_count LEFT-JUSTIFIED.
SKIP .
ULINE 1.

"it_st1[]=header linelı tablonun body kısmına karşılık gelir
"it_st3 = it_st1. "not compatible ERROR
it_st3 = it_st1[]. "not compatible atama yaptık hata vermez.

"---------------------------------------------------------------------------------------------

APPEND LINES OF it_st1 TO it_st3. "st1 in header lineını yokmuş gibi st3 tablosuna iliştir.

CLEAR it_st3."work area da temizleyebiliriz internal tablo da.
refresh it_st3. "Clearing internal table.

append it_st1 to it_st3. "append ile iki iç tabloyu birbirine ekleyebiliriz.

"---------------------------------------------------------------------------------------------

append lines of it_st1 from 2 to 3 to it_st3. "belirli sütunları appendler.

