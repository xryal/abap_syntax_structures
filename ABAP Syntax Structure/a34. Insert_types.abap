*&---------------------------------------------------------------------*
*& Report ZAB_P64
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_p64.


*****************************************
DATA it_emp TYPE STANDARD TABLE OF zmm_t001.
DATA wa_emp TYPE zmm_t001.
*
*wa_emp-ad = 'ABDULLAH'.
*wa_emp-cinsiyet = '1'.
*wa_emp-ogrencino = '123'.
*wa_emp-soyad = 'BOZLAGAN'.
*
SELECT * FROM zmm_t001 INTO TABLE it_emp.

INSERT INTO zmm_t001 VALUES wa_emp .

READ TABLE it_emp INTO wa_emp INDEX 1.
*
WRITE  : 'ad', wa_emp-ad.
skip .
WRITE  : 'cinsiyet', wa_emp-cinsiyet.
skip .
WRITE : 'ogrencino', wa_emp-ogrencino LEFT-JUSTIFIED.
skip .
WRITE  : 'soyad', wa_emp-soyad.



*****************************************

*WA_EMP = VALUE #( ad = 'aaa'
*                  cinsiyet = '1'
*                  ogrencino = 14
*                  soyad = 'deneme' ).
*
*SELECT * FROM zmm_t001 INTO TABLE it_emp.
*
*INSERT INTO zmm_t001 VALUES wa_emp .
*
*READ TABLE it_emp INTO wa_emp INDEX 8.
*
*WRITE  : 'ad', wa_emp-ad LEFT-JUSTIFIED.
*skip .
*WRITE  : 'cinsiyet', wa_emp-cinsiyet LEFT-JUSTIFIED.
*skip .
*WRITE : 'ogrencino', wa_emp-ogrencino LEFT-JUSTIFIED.
*skip .
*WRITE  : 'soyad', wa_emp-soyad LEFT-JUSTIFIED.

*****************************************  ABAP 7.5

*INSERT INTO zmm_t001 VALUES @( VALUE #( ad = 'ALİ'
*                  cinsiyet = '1'
*                  ogrencino = 342252
*                  soyad = 'VELİ' ) ).
*
*SELECT * FROM zmm_t001 INTO TABLE it_emp.
*

*
*READ TABLE it_emp INTO wa_emp INDEX 10.
*
*WRITE  : 'ad', wa_emp-ad LEFT-JUSTIFIED.
*skip .
*WRITE  : 'cinsiyet', wa_emp-cinsiyet LEFT-JUSTIFIED.
*skip .
*WRITE : 'ogrencino', wa_emp-ogrencino LEFT-JUSTIFIED.
*skip .
*WRITE  : 'soyad', wa_emp-soyad LEFT-JUSTIFIED.
**
******************************************



*it_emp = VALUE #(
*                  ( ad = '111'
*                    cinsiyet = '23'
*                    ogrencino = 5125312
*                    soyad = 'ahmet' )
*                   ( ad = 'mehmet'
*                     cinsiyet = '1'
*                     ogrencino = 144564
*                     soyad = 'yılmaz' )
*                     ( ad = 'baki'
*                       cinsiyet = '1'
*                       ogrencino = 1125344
*                       soyad = 'şimşek' ) ).

*INSERT zmm_t001 FROM TABLE it_emp.
*
*SELECT * FROM zmm_t001 INTO TABLE it_emp.
*
*LOOP AT  it_emp into wa_emp STEP 12 .
*WRITE / : 'ad', wa_emp-ad LEFT-JUSTIFIED.
*skip .
*WRITE / : 'cinsiyet', wa_emp-cinsiyet LEFT-JUSTIFIED.
*skip .
*WRITE / : 'ogrencino', wa_emp-ogrencino LEFT-JUSTIFIED.
*skip .
*WRITE / : 'soyad', wa_emp-soyad LEFT-JUSTIFIED.
*ENDLOOP.


*
*****************************************

*INSERT zmm_t001 FROM TABLE @( VALUE #(
*                  ( ad = '111'
*                    cinsiyet = '23'
*                    ogrencino = 5125312
*                    soyad = 'ahmet' )
*                   ( ad = 'mehmet'
*                     cinsiyet = '1'
*                     ogrencino = 144564
*                     soyad = 'yılmaz' )
*                     ( ad = 'baki'
*                       cinsiyet = '1'
*                       ogrencino = 1125344
*                       soyad = 'şimşek' ) ) ).
