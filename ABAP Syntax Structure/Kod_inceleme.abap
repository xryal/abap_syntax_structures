*&---------------------------------------------------------------------*
*& Include          ZIKK_E14_FORMS
*&---------------------------------------------------------------------*

DATA: gv_index_min         TYPE i VALUE 1,
      gv_index_max         TYPE i VALUE 200,
      gv_id_degisken       TYPE i,
      gv_username_degisken TYPE char10.

*------------------------------------------------------------------------------------*
*kullanıcı yeni kayıt oluşturmak için kaydol tuşuna bastığında, yeni kaydı eklemeden önce yapılan kontrol ve id oluştuma işlemi
*------------------------------------------------------------------------------------*
FORM control.
  WHILE gv_index_min < gv_index_max.
    CLEAR gs_user_reg.

*    SELECT * FROM zikk_user_reg INTO gs_user_reg WHERE user_id EQ gv_index_min.
*      IF gs_user_reg-user_id IS INITIAL.
*        gv_id_degisken = gv_index_min.
*        gv_index_min = gv_index_max.
*      ELSE.
*        gv_index_min = gv_index_min + 1.
*      ENDIF.
*    ENDSELECT.
    SELECT SINGLE * FROM zikk_user_reg INTO gs_user_reg WHERE user_id EQ gv_index_min.
    gv_username_degisken = gs_user_reg-user_name.
    IF gv_username_degisken EQ ''.
      gv_id_degisken = gv_index_min.
      gv_index_min = gv_index_max.
    ELSE.
      gv_index_min = gv_index_min + 1.
    ENDIF.
  ENDWHILE.
ENDFORM.
*------------------------------------------------------------------------------------*


*------------------------------------------------------------------------------------*
*control formundan hemen sonra çalışır. yeni kayıt eklemeyi sağlar
*------------------------------------------------------------------------------------*
FORM insert.

  gs_user_reg-user_id = gv_id_degisken.
  gs_user_reg-name = gv_name_reg.
  gs_user_reg-surname = gv_surname.
  gs_user_reg-user_name = gv_username_reg.
  gs_user_reg-user_password = gv_password_reg.

  INSERT zikk_user_reg FROM gs_user_reg.
  IF sy-subrc EQ 0.
    COMMIT WORK.
    MESSAGE TEXT-000 TYPE 'I'.
  ELSE.
    ROLLBACK WORK.
    MESSAGE TEXT-003 TYPE 'I'.
  ENDIF.

ENDFORM.
*------------------------------------------------------------------------------------*


*------------------------------------------------------------------------------------*
*kullanıcının giriş yapmasını sağlar
*------------------------------------------------------------------------------------*
FORM giris.
  gv_index_min = 1.
  WHILE gv_index_min < gv_index_max.
    CLEAR gs_user_reg.
    SELECT SINGLE * FROM zikk_user_reg INTO gs_user_reg WHERE user_id EQ gv_index_min.
    IF gs_user_reg-user_name = gv_user_name AND gs_user_reg-user_password = gv_password.
      gv_index_min = gv_index_max.
      CLEAR: gv_user_name,
             gv_password.
      SET SCREEN 0300.
    ELSE.
      gv_index_min = gv_index_min + 1.
      CASE gv_index_min.
        WHEN gv_index_max.
          MESSAGE TEXT-001 TYPE 'I'.
          CLEAR: gv_user_name,
                 gv_password.
      ENDCASE.
    ENDIF.
  ENDWHILE.
ENDFORM.
*------------------------------------------------------------------------------------*


*------------------------------------------------------------------------------------*
*Kullanıcı ID'ye göre gerekli bilgileri listeler.
*------------------------------------------------------------------------------------*
FORM listele.
  CLEAR gs_user_reg.
  IF gv_id_gir IS INITIAL.
    MESSAGE TEXT-002 TYPE 'I'.
  ELSE.
    SELECT SINGLE * FROM zikk_user_reg INTO gs_user_reg WHERE user_id EQ gv_id_gir.
    gv_name_listele = gs_user_reg-name.
    gv_surname_listele = gs_user_reg-surname.
    gv_id_listele = gs_user_reg-user_id.
    gv_username_listele = gs_user_reg-user_name.
    gv_password_listele = gs_user_reg-user_password.
  ENDIF.
ENDFORM.
*------------------------------------------------------------------------------------*


*------------------------------------------------------------------------------------*
FORM clear.
  CLEAR: gv_password_reg,
         gv_username_reg,
         gv_name_reg,
         gv_surname.
ENDFORM.
