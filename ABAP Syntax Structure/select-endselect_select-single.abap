"anladığım kadarıyla select endselect yapısı structure'a veri çekerken kullanılan bir yapı.

REPORT zab_50_select.

TABLES : zmm_t001.

DATA : ls_zmm_t001 TYPE zmm_t001.

PARAMETERS : p_ogrno TYPE zmm_t001-ogrencino,
             p_cnsyt TYPE zmm_t001-cinsiyet.


*SELECT * From  ls_zmm_t001 WHERE ogrencino EQ p_ogrno. "çekilen tablo aynı zamanda structure olarak kullanılır(into yoksa).
*ENDSELECT.
*
*IF sy-subrc EQ 0.
*  WRITE : 'Veri çekimi başarılı'.
*ELSE.
*  WRITE : 'Veri çekimi başarılı'.
*ENDIF.

*SELECT * INTO  ls_zmm_t001 FROM zmm_t001 WHERE cinsiyet EQ p_cnsyt. "2 kere döner çünkü cinsiyeti 1 olan 2 kişi var
*
*  CASE ls_zmm_t001-cinsiyet.
*    WHEN '1'.
*      WRITE : / ls_zmm_t001-ad.
*    WHEN '2'.
*      WRITE : / ls_zmm_t001-ad.
*    WHEN OTHERS.
*
*  ENDCASE.
*
*ENDSELECT.

SELECT SINGLE * INTO  ls_zmm_t001 FROM zmm_t001 WHERE cinsiyet EQ p_cnsyt. "where'e uygun ilk kaydı çeker.

WRITE :/ ls_zmm_t001-ad.


