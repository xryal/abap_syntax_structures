
TYPES : BEGIN OF ty_deneme,
          kunnr TYPE kna1-kunnr,
          adi1 TYPE kna1-name1,
          yer1 TYPE kna1-land1,
          ort01 TYPE kna1-ort01,
        END OF ty_deneme.

DATA : it_kna1 TYPE TABLE OF ty_deneme,
       Wa_KNA1 TYPE ty_deneme.

DATA lv_kunnr TYPE kna1-kunnr.
SELECT-OPTIONS so_kunnr FOR lv_kunnr.

SELECT kunnr name1 land1 ort01 FROM kna1 INTO TABLE it_kna1 WHERE kunnr IN so_kunnr.


LOOP AT it_kna1 INTO wa_kna1 WHERE kunnr = '0010100002'.
  wa_kna1-adi1 = 'abdullah'.
  MODIFY it_kna1 FROM wa_kna1 TRANSPORTING adi1.
ENDLOOP.

cl_demo_output=>display( it_kna1 ).
