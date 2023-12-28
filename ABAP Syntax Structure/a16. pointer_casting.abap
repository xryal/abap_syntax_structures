TYPES: BEGIN OF itab_timestamp,
         yil(4)    TYPE c,
         ay(2)     TYPE c,
         gun(2)    TYPE c,
         saat(2)   TYPE c,
         dakika(2) TYPE c,
         saniye(2) TYPE c,
       END OF itab_timestamp.

DATA: lv_tstamp_raw     TYPE timestamp,
      lv_tstamp_txt(14) TYPE c,
      lv_time           TYPE string.

FIELD-SYMBOLS: <lfs_timestamp> TYPE itab_timestamp,
               <lfs_generic>   TYPE any.

GET TIME STAMP FIELD lv_tstamp_raw.

lv_tstamp_txt = lv_tstamp_raw.
ASSIGN lv_tstamp_txt TO <lfs_timestamp> CASTING. "cast yaparken dikkat et yoksa patlayabilir düzgün ayarlamadıysan uzunlukları.

CONCATENATE <lfs_timestamp>-ay '/'
            <lfs_timestamp>-gun '/'
            <lfs_timestamp>-yil'-'

            <lfs_timestamp>-saat'/'
            <lfs_timestamp>-dakika '/'
            <lfs_timestamp>-saniye
            INTO lv_time.

WRITE: lv_time.

ASSIGN lv_tstamp_txt TO <lfs_generic> CASTING TYPE itab_timestamp. "güzel bir casting örneği.
