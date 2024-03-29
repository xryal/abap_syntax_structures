SELECTION-SCREEN BEGIN OF TABBED BLOCK tb1  FOR 13 LINES.

  SELECTION-SCREEN TAB (20) t1 USER-COMMAND tab1.
  SELECTION-SCREEN TAB (23) t2 USER-COMMAND tab2.

SELECTION-SCREEN END OF BLOCK tb1.

SELECTION-SCREEN BEGIN OF SCREEN 1001 AS SUBSCREEN NESTING LEVEL 4.

  SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE frame4 .
    SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN POSITION 05.
      PARAMETERS p_rb1 RADIOBUTTON GROUP gp1 USER-COMMAND fc1.
      SELECTION-SCREEN COMMENT 07(15) TEXT-001.

    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN POSITION 1.
      SELECT-OPTIONS so_d1 FOR zab_faturat_head-ab_fatura_id MODIF ID a1.

    SELECTION-SCREEN END OF LINE.

     SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN POSITION 5.
      PARAMETERS p_rb2 RADIOBUTTON GROUP gp1 DEFAULT 'X'.
      SELECTION-SCREEN COMMENT 07(15) TEXT-002.

    SELECTION-SCREEN END OF LINE.

     SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN POSITION 01.
      SELECT-OPTIONS so_d4 FOR zab_faturat_item-ab_fatura_id MODIF ID b1.

    SELECTION-SCREEN END OF LINE.

     SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN POSITION 1.
      SELECT-OPTIONS so_d6 FOR zab_faturat_item-ab_faturalanan_urun MODIF ID b1.

    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 2.

    SELECTION-SCREEN PUSHBUTTON 6(25) pushbut3 USER-COMMAND ittoalv.
    SELECTION-SCREEN PUSHBUTTON 34(23) pushbut4 USER-COMMAND exit.

    SELECTION-SCREEN SKIP 1.

  SELECTION-SCREEN END OF BLOCK b4.

SELECTION-SCREEN END OF SCREEN 1001.


SELECTION-SCREEN BEGIN OF SCREEN 1002 AS SUBSCREEN  NESTING LEVEL 4.

  SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE frame1.

    PARAMETERS : p_fname TYPE localfile .
    SELECTION-SCREEN SKIP 1.

  SELECTION-SCREEN END OF BLOCK b2.
  SELECTION-SCREEN SKIP 1.

  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE frame2.
    SELECTION-SCREEN SKIP 1.

    SELECTION-SCREEN BEGIN OF LINE.

      SELECTION-SCREEN PUSHBUTTON 1(50) pushbut1 USER-COMMAND headerexcel.
      SELECTION-SCREEN PUSHBUTTON 55(45) pushbut2 USER-COMMAND itemexcel.

    SELECTION-SCREEN END OF LINE.
    SELECTION-SCREEN SKIP 1.

  SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN END OF SCREEN 1002.


INITIALIZATION.
  tb1-activetab = 'ONE'.
  tb1-dynnr  = 1001.
  tb1-prog   = sy-repid.

START-OF-SELECTION.
  IF p_rb1 = 'X'.
    SELECT kunnr vbeln erdat ernam FROM vbak INTO TABLE it_vbak WHERE kunnr = p_d1.
  ELSEIF p_rb2 = 'X'.
    SELECT kunnr vbeln erdat ernam FROM vbak INTO TABLE it_vbak WHERE vbeln = p_d2.
  ENDIF.

  IF it_vbak IS NOT INITIAL.
    LOOP AT it_vbak INTO wa_vbak.
      WRITE :/ wa_vbak-kunnr, wa_vbak-vbeln, wa_vbak-erdat, wa_vbak-ernam.
    ENDLOOP.
  ENDIF.

AT SELECTION-SCREEN.
  CASE sy-dynnr. "SELECTION SCREEN NUMBER
    WHEN 1000.
      CASE sy-ucomm. "FUNCTUON CODE BUTON
        WHEN 'TAB1'.
          tb1-dynnr = 1001. "TAB SUBSCREENİ 1001 YAP.
      ENDCASE.
  ENDCASE.
