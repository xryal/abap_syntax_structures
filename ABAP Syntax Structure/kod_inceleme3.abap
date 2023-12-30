MODULE user_command_0600 INPUT.
  CASE sy-ucomm.
    WHEN '&YES'.
      IF gv_i EQ 1.
        PERFORM kullanici_guncelle.
      ELSEIF gv_i EQ 2.
        PERFORM kullanici_sil.
      ENDIF.
      LEAVE TO SCREEN 0.
    WHEN '&NO'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.
