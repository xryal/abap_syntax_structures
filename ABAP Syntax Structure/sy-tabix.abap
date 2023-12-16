REPORT ZSY_TABIX_DENEME_REPORT.

DATA: lt_data TYPE TABLE OF string,
      lv_value TYPE string.

APPEND 'One' TO lt_data.
APPEND 'Two' TO lt_data.
APPEND 'Three' TO lt_data.

*sy-tabix stands for Current location of index in loop...

LOOP AT lt_data INTO lv_value.
  WRITE: / 'Value:', lv_value,
         / 'Index:', sy-tabix.
ENDLOOP.
