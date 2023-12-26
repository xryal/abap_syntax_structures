REPORT zab_p42_hashed_table.

TABLES : mara.

SELECT-OPTIONS : so_matnr FOR mara-matnr.

TYPES : BEGIN OF st_mara,
          matnr TYPE mara-matnr,
          mtart TYPE mara-mtart,
          matkl TYPE mara-matkl,
        END OF st_mara.

data ls_mara type st_mara.

DATA lt_standard_tab TYPE TABLE OF st_mara WITH DEFAULT KEY. "kendi idsi         ***
                                                                                   "---->
DATA lt_standard_tab1 TYPE standard TABLE OF st_mara WITH DEFAULT KEY. "kendi idsi**

DATA lt_sorted_tab TYPE SORTED TABLE OF st_mara WITH UNIQUE KEY matnr. "matnrden unique key

DATA lt_sorted_tab1 TYPE SORTED TABLE OF st_mara WITH NON-UNIQUE KEY matnr. "matnrden unique OLMAYAN key

DATA lt_hash_tab TYPE HASHED TABLE OF st_mara  WITH UNIQUE KEY matnr. "matnrden unique key

" DATA lt_hash_tab TYPE HASHED TABLE OF st_mara  WITH NON-UNIQUE KEY matnr. "SYNTAX ERROR.

START-OF-SELECTION.

  select matnr mtart matkl from mara into table lt_standard_tab
   where matnr in so_matnr.

  select matnr mtart matkl from mara into table lt_sorted_tab
   where matnr in so_matnr.

  select matnr mtart matkl from mara into table lt_hash_tab
   where matnr in so_matnr.

*    READ TABLE lt_hash_tab into data(ls_mara) index 12. "index access yoktur
    READ TABLE lt_hash_tab into ls_mara with TABLE KEY matnr ='12'.
    READ TABLE lt_hash_tab into ls_mara  with TABLE KEY matnr ='EWMS4-11'.

BREAK-POINT.
    cl_demo_output=>display( ls_mara ).
