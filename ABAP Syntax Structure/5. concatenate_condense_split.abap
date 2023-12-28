REPORT zab_p44.


DATA gv_d1 TYPE string VALUE '      hello,          kullanıcı nasılsın naber'.
WRITE: / 'before condensing',gv_d1.
CONDENSE gv_d1.
WRITE: / 'AFTER condensing',gv_d1.
DATA gv_d2 TYPE string VALUE ' 10000 0000'.
WRITE: / 'before condensing',gv_d2.
CONDENSE gv_d2.
WRITE: / 'after condensing',gv_d2.

**************CONCATENATE****************

DATA gv_d3 TYPE string VALUE 'HELLO KULLANICI'.
DATA gv_d4 TYPE string VALUE 'naber'.
DATA gv_d5 TYPE string VALUE 'nasılsın'.
DATA gv_d6 TYPE string.
CONCATENATE gv_d3 gv_d4 gv_d5 INTO gv_d6 SEPARATED BY '-'.
WRITE: / 'after COncatenate',gv_d6.

*****************SPLIT********************

DATA gV_D10 TYPE STRing VALUE ' naber / kullanıcı /  hoşgeldiniz'.
DATA gv_d7 TYPE string .
DATA gv_d8 TYPE string .
DATA gv_d9 TYPE string .
WRITE : / 'value for gv_d1 before split is', gv_d7,
        / 'value for gv_d1 before split is', gv_d8,
        / 'value for gv_d1 before split is', gv_d9,
        / 'value for gv_d1 before split is', gv_d10.
SPLIT gv_d10 AT '/' INTO gv_d7 gv_d8 gv_d9.
WRITE : / 'value for gv_d1 after split is', gv_d7,
        / 'value for gv_d1 after split is', gv_d8,
        / 'value for gv_d1 after split is', gv_d9,
        / 'value for gv_d1 after split is', gv_d10.

*******************************************
