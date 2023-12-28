TABLES : zmm_t001.

CONSTANTS : lc_bukrs TYPE bkpf-bukrs VALUE '5000'. "bu şekilde değil parametre şeklinde kullanıcıdan almalıyız.

TYPES : BEGIN OF Ty_cinsiyet,
        cinsiyet TYPE zmm_t001-cinsiyet,
        END OF ty_cinsiyet.
        
data lt_cinsiyet type STANDARD TABLE OF ty_cinsiyet.
DATA ls_cinsiyet type ty_cinsiyet.     


"with header line tabloya structure yapısı ekler yani tablo tipini structure tipi gibi de kullanabilirsiniz.
DATA : ls_zmm_t001 TYPE zmm_t001,
       lt_zmm_t001 TYPE STANDARD TABLE OF zmm_t001 WITH HEADER LINE.


PARAMETERS : p_ogrno TYPE zmm_t001-ogrencino OBLIGATORY,
             p_cnsyt TYPE zmm_t001-cinsiyet.

SELECT-OPTIONS : s_ogrno FOR zmm_t001-ogrencino,
                 s_cnyst FOR zmm_t001-cinsiyet.


************SELECT TABLE***********
SELECT * INTO TABLE lt_zmm_t001
  FROM zmm_t001
  WHERE ogrencino EQ p_ogrno
  AND cinsiyet EQ p_cnsyt.

SELECT * FROM zmm_t001
  INTO TABLE lt_zmm_t001
  WHERE ogrencino EQ p_ogrno
  AND cinsiyet EQ p_cnsyt.
***********************************
*
*
**********SELECT WITH SO***********
SELECT * FROM zmm_t001        " değer aralığı parametre yoksa boş sayar ve bütün alanları çeker.
  INTO TABLE lt_zmm_t001
  WHERE ogrencino IN s_ogrno
  AND cinsiyet EQ p_cnsyt.

*LOOP AT lt_zmm_t001.  "with header line ile oluşturulan header'a basar
*
*  write lt_zmm_t001-ad.
*
*ENDLOOP.

"internal tabloda satır satır kontrol edip öğrenci no 1 olan değeri bulur sonrasında soyadunu modify ile mehmet olarak değiştirir.
*LOOP AT lt_zmm_t001 into ls_zmm_t001.  "structure üzerinde ulaşılabilir.
*
*  IF ls_zmm_t001-ogrencino = 1.
*
*    ls_zmm_t001-soyad = 'Mehmet'.
*
*   "modify tüm satırları değiştirir transporting dersek ilgili alanı değiştirmiş olacaktır.
*   MODIFY lt_zmm_t001 from ls_zmm_t001 TRANSPORTING soyad.
*
*
*  ENDIF.
*  write ls_zmm_t001-ad.
*
*ENDLOOP.

LOOP AT lt_zmm_t001 INTO ls_zmm_t001 WHERE ogrencino EQ '1'.  "ogrencino 1 değerine eşitse loopla.

  IF ls_zmm_t001-ogrencino = 1.

    ls_zmm_t001-soyad = 'Mehmet'.

    "modify tüm satırları değiştirir transporting dersek ilgili alanı değiştirmiş olacaktır.
    MODIFY lt_zmm_t001 FROM ls_zmm_t001 TRANSPORTING soyad.


  ENDIF.
  WRITE ls_zmm_t001-ad.

ENDLOOP.
