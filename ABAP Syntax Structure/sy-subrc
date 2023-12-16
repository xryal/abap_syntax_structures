REPORT zsy_subrc_deneme_report.


DATA: gv_personelid         TYPE zbk_personelid_de,
      gv_personelad         TYPE zbk_personelad_de,
      gv_personel_cinsiyet  TYPE zbk_personelcinsiyet_de,
      gv_personel_soyadi    TYPE zbk_personelsoyadi_de,   "variable_tanımı"
      gs_personel_structure TYPE zbk_personel_t,  "Structure_tanımı"
      gt_personel_table     TYPE TABLE OF zbk_personel_t. "TABLO_tanımı"

SELECT * FROM zbk_personel_t  "Fetch table from formed table into internal table"
  INTO TABLE gt_personel_table.

SELECT * FROM zbk_personel_t  "Fetch spestable data from formed table into internal table data"
  INTO TABLE gt_personel_table
  WHERE pers_id EQ 1.


SELECT SINGLE * FROM zbk_personel_t      "Fetch structure from formed table into internal structure"
  INTO gs_personel_structure.

SELECT SINGLE pers_id FROM zbk_personel_t "Fetch variable from formed table into internal variable"
  INTO gv_personelid.

UPDATE zbk_personel_t SET pers_ad = 'hakan'
  WHERE pers_id = 1.

IF sy-subrc EQ 0.
  WRITE: / 'Employee ID:', gv_personelid,
         / 'Employee Name:', gv_personelad.
ELSE.
  WRITE: / 'Employee not found.'.
ENDIF.

WRITE: 'update komutu çalıştırıldı'.
