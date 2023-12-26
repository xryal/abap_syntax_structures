REPORT ZAB_P23_INTERNAL_TABLO.


DATA: BEGIN OF it_calisan OCCURS 0,
  calisan_adi TYPE string,
  calisan_id TYPE int4,
 END OF it_calisan.

APPEND INITIAL LINE TO it_calisan.

APPEND VALUE #( calisan_id = 1
               calisan_adi = 'Abdullah') TO it_calisan.

APPEND VALUE #( calisan_id = 2
               calisan_adi = 'Ali') TO it_calisan.

WRITE: / 'field1:', it_calisan[ 2 ]-calisan_id. "çıktının 1 olma sebebi başlangıç satırı eklemem.
