REPORT ZAB_P43.

WRITE: sy-uzeit. "current time

write: sy-uname. "client

uline. "This statement creates n blank lines on the current selection screen below the lines already filled.
"The value n must be specified directly as a single-digit positive number. If n is not specified, a single blank line is created.

data : gv_v1(10) type i.

gv_v1 = 54.
WRITE : gv_v1 LEFT-JUSTIFIED.
skip 2.
WRITE : gv_v1 centered.
uline 1.
WRITE : gv_v1.

constants gv_2 type i value 1.
