*&---------------------------------------------------------------------*
*& Report ZAB_P63
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p63.

"sbook tablosundan fldate alanının count değerini averaj bagaj ağırlığı değerini
"maksimum bagaj değerlerini havayolu firması LH olan ve conn id değeri 0400 olan
"değerler için satır satır okur ve yeni bir structure kümülatif olarak ile ekrana basar
DATA: fldate LIKE sbook-fldate,
      count  TYPE i,
      avg    TYPE p DECIMALS 2,
      max    TYPE p DECIMALS 2.

SELECT fldate COUNT( * ) AVG( luggweight ) MAX( luggweight )
       FROM sbook
       INTO (fldate, count, avg, max)
       WHERE carrid = 'LH' AND
             connid = '0400'
       GROUP BY fldate.
  WRITE: / fldate, count, avg, max.
ENDSELECT.

*---------------------------yeni syntax------------------------------

*SELECT posnr, MAX( netwr ) AS max_netwr,
*              MIN( netwr ) AS min_netwr,
*              COUNT( netwr ) AS count_netwr,
*              SUM( netwr ) AS sum_netwr FROM vbap
*   WHERE vbeln IN @so_vbeln GROUP BY posnr INTO TABLE @DATA(it_abc2).
*
*cl_demo_output=>display( it_abc2 ).

*---------------------------------------------------------------------
