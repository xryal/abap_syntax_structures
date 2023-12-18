*&---------------------------------------------------------------------*
*& Report ZAB_P26_EVENT_BLOCKS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p26_event_blocks.

DATA: gv_num1 TYPE int4 value 10.
DATA: gv_num2 TYPE int4 VALUE IS INITIAL. "sıfır olduğu için çarpım işlemleri sıfır döner.
DATA: gv_num3 TYPE int4 VALUE 5.


START-OF-SELECTION.

PERFORM f_ekle.
PERFORM f_ekle.
PERFORM f_ekle.
PERFORM f_ekle.

WRITE gv_num1.

PERFORM f_carp USING 10
                     5.
PERFORM f_carp USING gv_num2
                     gv_num3.
WRITE : gv_num2.

AT SELECTION-SCREEN.
  IF sy-datum IS INITIAL.
    MESSAGE 'Tarih bilgisi eksik!' TYPE 'E'.
  ENDIF.

END-OF-SELECTION.

FORM f_ekle.
  gv_num1 = gv_num1 + 1.
ENDFORM.
FORM f_carp USING p_num1
                  p_num2.
  data : lv_sonuc TYPE i.
  lv_sonuc = p_num1 * p_num2.
  WRITE : 'Sonuç', lv_sonuc.
ENDFORM.


AT USER-COMMAND. "kullanıcının hangi tuşa bastığı verisini tutar.
CASE sy-ucomm.
  WHEN 'SAVE'.
    WRITE: / 'Kullanıcı kaydet komutunu girdi.'.
  WHEN 'CANCEL'.
    WRITE: / 'Kullanıcı iptal komutunu girdi.'.
ENDCASE.
