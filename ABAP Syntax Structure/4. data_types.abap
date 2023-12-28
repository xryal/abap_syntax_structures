REPORT zab_p43.

WRITE: sy-uzeit. "current time
WRITE: sy-uname. "client

ULINE. "This statement creates n blank lines on the current selection screen below the lines already filled.
"The value n must be specified directly as a single-digit positive number. If n is not specified, a single blank line is created.

DATA : gv_v1(10) TYPE i.
gv_v1 = 54.
WRITE : gv_v1 LEFT-JUSTIFIED.
SKIP 2.
WRITE : gv_v1 CENTERED.
ULINE 1.
WRITE : gv_v1.
SKIP 2.

CONSTANTS gv_2 TYPE i VALUE 1.


DATA gv_integer TYPE i.
DATA gv_numeric(7) TYPE n. "numeric "-sign not supported
gv_numeric = -11.
gv_integer = -12.
WRITE : gv_numeric .
SKIP 2.
WRITE : gv_integer .


DATA gv_float1 TYPE p.
gv_float1 = '111.23'.
WRITE : / gv_float1.
DATA gv_float2 TYPE p DECIMALS 4.
gv_float2 = '111.233'.
WRITE : / gv_float2.
