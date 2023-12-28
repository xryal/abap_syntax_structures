TABLES sflight.
TABLES scarr.

SELECT carrid,
      connid
  FROM sflight
  INTO TABLE @DATA(it_output).

cl_demo_output=>display( it_output ).

"--------------------------------------------

SELECT carrid,
       connid,
       carrname
FROM sflight AS f
  INNER JOIN scarr AS d
  ON f-carrid eq @d-carrid
INTO TABLE @DATA(it_output).

cl_demo_output=>display( it_output ).

SELECT f~carrid,               "çalışmıyor
       f~connid,
       f~fldate
FROM sflight AS f
  INNER JOIN scarr AS c
  ON f~carrid eq c~carrid
INTO TABLE @DATA(it_output).

  cl_demo_output=>display( it_output ).
