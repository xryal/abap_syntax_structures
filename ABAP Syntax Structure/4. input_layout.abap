REPORT zab_p22_kullanici_input.

TABLES : zab_personel_t. "TABLO İŞLEMLERİ BU KEYWORD KULLANARAK ÇOK DAHA RAHAT YAPILABİLİYOR EKSTRA READ İNSERT KULLANMANA GEREK KALMAZ.

DATA : gv_personelsoyad TYPE zab_personelsoyad_de.

PARAMETERS : p_num1  TYPE int4,
             p_persd TYPE zab_personelad_de.

SELECT-OPTIONS : s_persd FOR gv_personelsoyad,
                 s_percs FOR zab_personel_t-pers_cins.

PARAMETERS p_cbox1 AS CHECKBOX.

SELECTION-SCREEN BEGIN OF BLOCK Block1  WITH FRAME TITLE TEXT-001.
PARAMETERS : p_radi1 RADIOBUTTON GROUP gr1,
             p_radi2 RADIOBUTTON GROUP gr1,
             p_radi3 RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK Block1.

SELECTION-SCREEN BEGIN OF BLOCK Block2  WITH FRAME TITLE TEXT-002.
PARAMETERS : p_radi4 RADIOBUTTON GROUP gr2,
             p_radi5 RADIOBUTTON GROUP gr2.
SELECTION-SCREEN END OF BLOCK Block2.
