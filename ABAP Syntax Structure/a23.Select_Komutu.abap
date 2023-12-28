REPORT zab_p21_select_komutu.

DATA : gv_pers_id        TYPE zab_personelid_de,    "VARIABLE global değişkenleri
       gv_pers_ad        TYPE zab_personelad_de,
       gv_pers_soyad     TYPE zab_personelsoyad_de,
       gv_pers_cinsiyet  TYPE zab_personelcinsiyet_de,
       gv_sum            TYPE i,
       gs_pers_structure TYPE zab_personel_t .   "STRUCTURE global değişken isimlendirmeleri.

"DATA : gt_pers_table TYPE TABLE OF zab_personel_t. "TABLE global değişken isimlendirmeleri.

DATA : gt_pers_table TYPE STANDARD TABLE OF zab_personel_t WITH EMPTY KEY.   "UYUŞMAZLIĞI GİDEREN KEYWORDLER



*IF sy-subrc EQ 0.                                          "İŞLEMİN GERÇEKLEŞİP GERÇEKLEŞMEDİĞİNİ DÖNEN KOD BLOĞU
*  WRITE : 'işleminiz başarıyla gerçekleşti'.
*
*ELSE.
*  WRITE   'işleminiz gerçekleşmedi'.
*
*ENDIF.

*SELECT  * FROM zab_personel_t INTO TABLE  gt_pers_table .  "TÜM TABLONUN ÇEKİLDİĞİ KOD BLOĞU
*
*LOOP AT gt_pers_table INTO DATA(lv_data).
*  WRITE: / 'Mandt:', lv_data-mandt.
*  WRITE: / 'PERS_ad:', lv_data-PERS_AD.
*  WRITE: / 'PERS_soyad:', lv_data-PERS_SOYAD.
*  WRITE: / 'PERS_cins:', lv_data-PERS_CINS.
*
*ENDLOOP.
*
*SELECT  * FROM zab_personel_t INTO TABLE  gt_pers_table WHERE pers_id = '1' .  "ID'si 1 OLAN KULLANICININ ÇEKİLDİĞİ KOD BLOĞU
*
*LOOP AT gt_pers_table INTO DATA(lx_data).
*  WRITE: / 'Mandt:', lx_data-mandt.
*  WRITE: / 'PERS_ad:', lx_data-PERS_AD.
*  WRITE: / 'PERS_soyad:', lx_data-PERS_SOYAD.
*  WRITE: / 'PERS_cins:', lx_data-PERS_CINS.
*
*ENDLOOP.


*SELECT  mandt pers_id FROM zab_personel_t INTO TABLE  gt_pers_table .  ",İLGİLİ SÜTUNLARIN ÇEKİLDİĞİ KOD BLOĞU
*
*
*LOOP AT gt_pers_table INTO DATA(ly_data).
*  WRITE: / 'Mandt:', ly_data-mandt.
*  WRITE: / 'PERS_ID:', ly_data-pers_id.
*
*ENDLOOP.

SELECT  * FROM zab_personel_t  WHERE pers_id = '2' INTO TABLE @gt_pers_table UP TO 10 ROWS     .  "id'si 2 olan İLK 10 KULLANICININ ÇEKİLDİĞİ KOD BLOĞU

LOOP AT gt_pers_table INTO DATA(lZ_data).
  WRITE: / 'Mandt:', lZ_data-mandt.
  WRITE: / 'PERS_ad:', lZ_data-pers_ad.
  WRITE: / 'PERS_soyad:', lZ_data-pers_soyad.
  WRITE: / 'PERS_cins:', lZ_data-pers_cins.

ENDLOOP.

SELECT  SUM( pers_id + pers_id ) AS pers_id INTO CORRESPONDING FIELDS OF TABLE @gt_pers_table FROM zab_personel_t.  "bütün id leri 2 YE ÇARPAN KOD BLOĞU

LOOP AT gt_pers_table INTO DATA(lk_data).
  WRITE: / 'id toplamı:', lk_data-pers_id.
  WRITE: / 'PERS_ad:', lk_data-pers_ad.
  WRITE: / 'PERS_soyad:', lk_data-pers_soyad.
  WRITE: / 'PERS_cins:', lk_data-pers_cins.

ENDLOOP.

SELECT  SUM( pers_id - pers_id ) AS pers_id INTO CORRESPONDING FIELDS OF TABLE @gt_pers_table FROM zab_personel_t UP TO 10 ROWS ORDER BY pers_id ASCENDING.  "ilk 10 id leri  order by ascending yapıp 2 YE ÇARPAN KOD BLOĞU

LOOP AT gt_pers_table INTO DATA(ln_data).
  WRITE: / 'id toplamı:', ln_data-pers_id.
  WRITE: / 'PERS_ad:', ln_data-pers_ad.
  WRITE: / 'PERS_soyad:', ln_data-pers_soyad.
  WRITE: / 'PERS_cins:', ln_data-pers_cins.

ENDLOOP.
