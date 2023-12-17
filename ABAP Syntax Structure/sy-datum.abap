REPORT ZAB_P12_SY_DATUM.

DATA: ld_current_date TYPE sy-datum.

" Sistem tarihini al
ld_current_date = sy-datum.

WRITE: / 'Current Date:', ld_current_date.
