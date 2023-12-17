*&---------------------------------------------------------------------*
*& Report ZAB_P18
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

*Derste yazılan Kodlar
*17/12/2023
REPORT zab_p18.

PARAMETERS : p_text1 TYPE char50,
             p_text2 TYPE char50.


DATA : gv_len      TYPE i,
       gv_text     TYPE char100,
       gv_cond     TYPE char100,
       gv_ayrac    TYPE char10,
       gv_tarih_ay TYPE char2.



gv_tarih_ay  = sy-datum+4(2).
WRITE : gv_tarih_ay.

gv_len = strlen( p_text1 ).
WRITE : / gv_len.

CONCATENATE p_text1 p_text2 INTO gv_text.
WRITE : / gv_text.

CONCATENATE '' p_text1 p_text2 '' INTO gv_text SEPARATED BY '-'.
WRITE : / gv_text.

gv_len = strlen( gv_text ). "çalışmıyor nedenini araştır..
WRITE : / gv_text.

CONCATENATE p_text1 p_text2 INTO gv_text SEPARATED BY space.
WRITE : / gv_text.

gv_cond = condense( gv_text ). "çalışmıyor nedenini araştır..
WRITE : / gv_text.

gv_text = gv_text+0(7). "ilk karakterden başla ordan 7 karakteri say elde ettiğin ifadeyi ayraç değişkenine ata..
WRITE : / gv_text.

"variable debug yerine sy yazarsan parametreleri görebiliriz. eğer ki sy tcode zfi_001 ise git şu işlemi yap. o tcoduna  bakıp if konuşulunu yazabiliyoz
"sistem parametrelerini öğren.
"substring araştır.

SEARCH gv_text for 'Abdullah'. "sy-subrc herhangi atama if koşulu işlemleri yapılamadığı zamansıfırdan farklı döner.

IF sy-subrc eq 0.
 WRITE 'gv_text içerisinde Abdullah yazısı yoktur.'.
ENDIF.

SEARCH gv_text for 'Abdullah'.

IF sy-subrc eq 0.
 WRITE sy-fdpos.  "aradığımız kelime hangi basamakta olduğunu dönderir.
ENDIF.

REPLACE 'emur' in gv_text WITH 'abap'. "string ifadenin belirli bir kısmını başka bir string ile değiştirir.
