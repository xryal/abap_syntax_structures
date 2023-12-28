TABLES : zmm_t001.

TYPES : BEGIN OF Ty_cinsiyet,
          cinsiyet TYPE zmm_t001-cinsiyet,
        END OF ty_cinsiyet.

DATA lt_cinsiyet TYPE STANDARD TABLE OF ty_cinsiyet.
DATA ls_cinsiyet TYPE ty_cinsiyet.

"include type diyerek tablo tiplerini de dahil etmiş olduk.
TYPES : BEGIN OF ty_output.
          .INCLUDE TYPE zmm_t001.
TYPES :   cnsyt TYPE char50,
        END OF ty_output.

DATA: lt_output TYPE STANDARD TABLE OF ty_output,
      ls_output TYPE ty_output.

DATA : ls_zmm_t001 TYPE zmm_t001,
       lt_zmm_t001 TYPE STANDARD TABLE OF zmm_t001 WITH HEADER LINE,
       lv_cnsyt    TYPE char50.

" çekmez çünkü lt cinsiyet 1 alan tablo 5 alan.
"SELECT * from zmm_t001  into table lt_cinsiyet.


"ikisi de aynı yapı performans olarak üstteki iyi
SELECT cinsiyet FROM zmm_t001  INTO TABLE lt_cinsiyet.
*SELECT *  from zmm_t001 into CORRESPONDING FIELDS OF table lt_cinsiyet  .

select * into table lt_zmm_t001 from zmm_t001.
"duplicate alan varsa alt alta onları siler bütün alanlarda bakar.
*SORT lt_cinsiyet BY cinsiyet.
*DELETE ADJACENT DUPLICATES FROM lt_cinsiyet.

"duplicate alan varsa alt alta onları siler sadece ilgili alana bakar.
SORT lt_cinsiyet BY cinsiyet.
DELETE ADJACENT DUPLICATES FROM lt_cinsiyet COMPARING cinsiyet.


LOOP AT lt_cinsiyet INTO ls_cinsiyet.

  WRITE : / ls_cinsiyet-cinsiyet.

ENDLOOP.

LOOP AT lt_cinsiyet INTO ls_cinsiyet.

  CASE ls_cinsiyet-cinsiyet.
    WHEN '1'.
      lv_cnsyt = 'bay'.
    WHEN '2'.
      lv_cnsyt = 'bayan'.
    WHEN OTHERS.
      lv_cnsyt = 'Cinsiyet Tanımlı değildir.'.
  ENDCASE.

  LOOP AT lt_zmm_t001 INTO ls_zmm_t001 WHERE cinsiyet EQ ls_cinsiyet-cinsiyet.

    "teker teker yazmamak için move corresponding kullanılır.
    "ls_output-ad = ls_zmm_t001-ad.

    MOVE-CORRESPONDING ls_zmm_t001 TO ls_output.
    ls_output-cnsyt = lv_cnsyt.
    append ls_output to lt_output.

  ENDLOOP.



ENDLOOP.

"buradaki amaç cinsiyeti belirleyip var olan zmm_t001
"tipindeki bir internal tabloya char tipinde kişinin cinsiyetini de appendleyen algoritma yazmak
