MODULE user_command_0500 INPUT.
  CASE sy-ucomm.
    WHEN '&BACK'.
      SET SCREEN 0400.
    WHEN '&GORUNTULE'.
      PERFORM listele.
    WHEN '&LISTELE'.
      PERFORM tablo_birlestir.
    WHEN '&SIL'.
      gv_i = 2.
      IF gv_id_gir IS INITIAL.
        MESSAGE TEXT-002 TYPE 'I'.
      ELSE.
        CALL SCREEN 0600 STARTING AT 20 20
                     ENDING AT 15 15.
      ENDIF.
    WHEN '&GUNCELLE'.
      gv_i = 1.
      IF gv_name_listele IS INITIAL
        AND gv_surname_listele IS INITIAL
        AND gv_password_listele IS INITIAL
        AND gv_username_listele IS INITIAL.

        MESSAGE text-004 TYPE 'I'.
      ELSE.
        CALL SCREEN 0600 STARTING AT 20 20
                     ENDING AT 15 15.
      ENDIF.
  ENDCASE.

ENDMODULE.
