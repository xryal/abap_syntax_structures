**************find****************

DATA gV_d1 TYPE string VALUE 'hello kullanıcı, hoşgeldin naber kullanıcı sap nasılsın.'.

DATA gv_d2 TYPE i.

FIND 'sap' IN gv_d1 MATCH OFFSET gv_d2. "index değerini dönderir.

WRITE: / 'index value of sap is :-', gv_d2.

FIND 'sap' IN gv_d1.

IF sy-subrc = 0.
  WRITE :/ 'sap bulunmaktadır.' COLOR 5.
ENDIF.

**************REPLACE****************

* REPLACE 'kullanıcı' in gv_d1 with 'erciyes'. "ilk denk geleni çevirir
*REPLACE ALL OCCURRENCES OF 'kullanıcı' IN gv_d1 WITH 'erciyes'.

REPLACE FIRST OCCURRENCE OF 'kullanıcı' IN gv_d1 WITH 'erciyes'.

WRITE: /  gv_d1.

"""""""""""""""SHIFT"""""""""""""""""

DATA lv_d3(20) TYPE c VALUE '123456789'.

WRITE: /'shift öncesi',lv_d3.

SHIFT lv_d3 LEFT BY 3 PLACES.

WRITE: /'shift sonrası',lv_d3.

SHIFT lv_d3 RIGHT by 3 PLACES.

WRITE: /'shift sonrası',lv_d3.

SHIFT lv_d3 circular by 3 PLACES.

WRITE: /'shift sonrası',lv_d3.

DATA text TYPE string VALUE `I know you know `.

SHIFT text UP TO 'you' LEFT CIRCULAR.

WRITE: /'shift sonrası',text.
