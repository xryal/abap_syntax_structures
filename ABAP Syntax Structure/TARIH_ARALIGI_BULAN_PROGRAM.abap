*&---------------------------------------------------------------------*
*& Report ZAB_P13_SY_DATUM_EXAMPLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p13_sy_datum_tarih_araligi.


DATA: lt_dates TYPE RANGE OF sy-datum WITH HEADER LINE.

" Belirli bir tarih aralığını belirtelim
DATA ld_start_date TYPE sy-datum VALUE '20230101'.
DATA ld_end_date  TYPE sy-datum VALUE '20231231'.

" Tarih aralığını dolduralım
"belirtilen sınır içerisindeki değerleri alır..    " 'I' (included) veya 'E' (excluded) değerlerini alabilir
lt_dates-sign = 'I'.
"bu değer type range of adlı struct yapısının bir değişkenidir, bu değer kontrol edilecek değerin
*o aralıkta mı o aralıkta ve sınırları dahil mi bunu belirtir  " 'BT' (between) veya 'EQ' (equal) değerlerini alabilir
lt_dates-option = 'BT'.
lt_dates-low = ld_start_date.
lt_dates-high = ld_end_date.

" Tarih aralığını ekrana yazdıralım
WRITE: / 'Başlangıç Tarihi:', ld_start_date,
       / 'Bitiş Tarihi:', ld_end_date.

" Tarih aralığındaki değerleri kontrol edelim
IF sy-datum IN lt_dates.
  WRITE: / sy-datum, 'tarih aralığı içinde.'.
ELSE.
  WRITE: / sy-datum, 'tarih aralığı dışında.'.
ENDIF.
