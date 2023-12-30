
FORM admin_giris.
  SELECT * FROM zikk_admin_reg INTO gs_zikk_admin_reg
    WHERE admin EQ gv_admin.
    IF gs_zikk_admin_reg-admin EQ gv_admin AND gs_zikk_admin_reg-sifre EQ gv_adminpassword.
      CLEAR: gv_admin,
             gv_adminpassword.
      SET SCREEN 0500.
    ENDIF.
  ENDSELECT.
ENDFORM.


FORM tablo_birlestir.
  TYPES: BEGIN OF ty_output,
           user_id       TYPE int4,
           user_name     TYPE char10,
           user_password TYPE char10,
           name          TYPE char20,
           surname       TYPE char20,
           admin         TYPE zikk_admin_de,
         END OF ty_output.

  DATA: lt_output TYPE STANDARD TABLE OF ty_output.

  SELECT
    zikk_user_reg~user_id
    zikk_user_reg~user_name
    zikk_user_reg~user_password
    zikk_user_reg~name
    zikk_user_reg~surname
    zikk_admin_reg~admin
    FROM zikk_user_reg
    INNER JOIN zikk_admin_reg ON zikk_admin_reg~user_id EQ zikk_user_reg~user_id
  INTO CORRESPONDING FIELDS OF TABLE lt_output.


  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = go_salv                          " Basis Class Simple ALV Tables
    CHANGING
      t_table        = lt_output
  ).

  go_salv->display( ).

ENDFORM.


*---------- silme --------------*
FORM kullanici_sil.
  DELETE FROM zikk_user_reg WHERE user_id EQ gv_id_gir.

  IF sy-subrc = 0.
    COMMIT WORK.
  ENDIF.

  CLEAR: gv_id_gir,
         gv_id_listele,
         gv_name_listele,
         gv_password_listele,
         gv_surname_listele,
         gv_username_listele.
  LEAVE TO SCREEN 0.

  MESSAGE 'Silme işlemi başarıyla gerçekleşti' TYPE 'I'.

ENDFORM.



*--------- güncelleme ---------------*
FORM kullanici_guncelle.

  DATA: ls_user TYPE zikk_user_reg.

  ls_user-name = gv_name_listele.
  ls_user-surname = gv_surname_listele.
  ls_user-user_name = gv_username_listele.
  ls_user-user_password = gv_password_listele.

  IF ls_user-name IS INITIAL.
    SELECT SINGLE name FROM zikk_user_reg INTO ls_user-name WHERE user_id EQ gv_id_gir.

  ELSEIF ls_user-surname IS INITIAL.
    SELECT SINGLE surname FROM zikk_user_reg INTO ls_user-surname WHERE user_id EQ gv_id_gir.

  ELSEIF ls_user-user_name IS INITIAL.
    SELECT SINGLE user_name FROM zikk_user_reg INTO ls_user-user_name WHERE user_id EQ gv_id_gir.

  ELSEIF ls_user-user_password IS INITIAL.
    SELECT SINGLE user_password FROM zikk_user_reg INTO ls_user-user_password WHERE user_id EQ gv_id_gir.
  ENDIF.

  " Güncelleme işlemi
  UPDATE zikk_user_reg
   SET name = ls_user-name
       surname = ls_user-surname
       user_name = ls_user-user_name
       user_password = ls_user-user_password
   WHERE user_id EQ gv_id_gir.

  IF sy-subrc = 0.
    COMMIT WORK.
  ENDIF.

  MESSAGE 'Güncelleme işlemi başatıyla gerçekleşti' TYPE 'I'.

ENDFORM.
