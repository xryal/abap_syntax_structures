REPORT zab_p20_tablo_islemleri.

DATA: gv_personelid         TYPE zab_personelid_de,
      gv_personelad         TYPE zab_personelad_de,
      gv_personel_cinsiyet  TYPE zab_personelcinsiyet_de,
      gv_personel_soyadi    TYPE zab_personelsoyad_de,    "variable_tanımı"
      gs_personel_structure TYPE  zab_personel_t,         "Structure_tanımı"
      gt_personel_table     TYPE TABLE OF  zbk_personel_t, "TABLO_tanımı"
      ls_first_record       TYPE  zab_personel_t,
      ls_besinci_record     TYPE  zab_personel_t.

*-------------------------------------------- PERSONEL OKUYAN MODÜL İNSERTLEYEN

SELECT * FROM zab_personel_t        "Fetch table from formed table into internal table"
  INTO TABLE gt_personel_table.

READ TABLE gt_personel_table INTO ls_first_record INDEX 1. "internal tablodaki ilk satırı oku.

INSERT  zab_personel_t FROM ls_first_record . "okunan ilk satırı ANA tablomuza kaydet

LOOP AT gt_personel_table INTO DATA(lv_data).   "YAPILAN BU 3 İŞLEMİN SONUCUNU DÖNDER
  WRITE: / 'Mandt:', lv_data-mandt.
  WRITE: / 'PERS_ad:', lv_data-pers_ad.
  WRITE: / 'PERS_soyad:', lv_data-pers_soyad.
  WRITE: / 'PERS_cins:', lv_data-pers_cins.

ENDLOOP.
*--------------------------------------------- EKLEME MODULU
ls_besinci_record-pers_id = 5.                  "zab_personel_t türünde ls_besinci_record
ls_besinci_record-pers_ad = 'inci'.             "isminde bir structure yapısına yeni eleman ekleme
ls_besinci_record-pers_soyad = 'öztürk'.
ls_besinci_record-pers_cins = 'K'.

INSERT zab_personel_t from ls_besinci_record  . "eklenen yeni elemanı ANA tablomuza taşıdık

SELECT * FROM zab_personel_t        "güncellenmiş tablomuzu internal tablomuza çektik
  INTO TABLE gt_personel_table.

READ TABLE gt_personel_table INTO ls_besinci_record  INDEX 5. "internal tablomuzdaki 5. recordu ls_besinci_recorda attık.

WRITE : / ls_besinci_record-pers_ad.     "inci değeri dönecektir.

IF sy-subrc = 0.
  WRITE: / '5. eleman:', ls_besinci_record-pers_id,
         / 'ismi:', ls_besinci_record-pers_ad.
ELSE.
  WRITE: / 'gt_personel_table içerisinde böyle bir kayıt bulunamadı.'.
ENDIF.

*--------------------------------------------- SILME MODULU

DELETE FROM zab_personel_t WHERE pers_id = 5. "5 numaralı çalışanı sildik

SELECT * FROM zab_personel_t        "güncellenmiş tablomuzu internal tablomuza çektik
  INTO TABLE gt_personel_table.

READ TABLE gt_personel_table INTO ls_besinci_record  INDEX 5. "internal tablomuzdaki 5. recordu ls_besinci_recorda attık.
WRITE : / ls_besinci_record-pers_ad.

IF sy-subrc = 0.
  WRITE: / '5. eleman:', ls_besinci_record-pers_id,
         / 'ismi:', ls_besinci_record-pers_ad.
ELSE.
  WRITE: / 'gt_personel_table içerisinde böyle bir kayıt bulunamadı.'.
ENDIF.
*--------------------------------------------- MODIFY MODULU (id'si bulunamayan çalışan olursa yeni record ekler varsa update eder.)

ls_besinci_record-pers_id = 5.
ls_besinci_record-pers_ad = 'merve'.
ls_besinci_record-pers_soyad = 'yılmaz'.
ls_besinci_record-pers_cins = 'K'.

MODIFY zab_personel_t FROM ls_besinci_record .



*SELECT * FROM zab_personel_t             "Fetch spesific data from formed table into internal table data"
*  INTO TABLE gt_personel_table           "pers_id" değeri 1 olan personel kaydı eklenmiş olacaktır.
*  WHERE pers_id EQ 1 AND pers_ad = 'abdullah'.
*
*
*SELECT SINGLE * FROM zab_personel_t      "Fetch structure from formed table into internal structure"
*  INTO gs_personel_structure.            "İlk uygun kaydı getirecektir(en üstteki kayıt)
*
*SELECT * FROM zab_personel_t             "id'si 1 olan kayıtlı kullanıcıyı getirir
*  INTO TABLE gt_personel_table
*  ORDER BY pers_id ASCENDING.
*
*SELECT SINGLE pers_id FROM zab_personel_t   "Fetch variable from formed table into internal variable"
*  INTO gv_personelid.
*
*UPDATE zab_personel_t SET pers_ad = 'ahmet' "pers_id = 1 olan kişinin adını ahmet olarak güncelle.
*  WHERE pers_id = 1.
*
*IF sy-subrc EQ 0.
*  WRITE: / 'çalışan ıd:', gv_personelid,
*         / 'çalışan adı:', gv_personelad.
*ELSE.
*  WRITE: / 'çalışan.'.
*ENDIF.
