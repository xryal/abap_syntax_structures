*&---------------------------------------------------------------------*
*& Report ZAB_C2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zab_c2.

PARAMETERS number TYPE i.

DATA result TYPE p DECIMALS 2.
DATA oref TYPE REF TO cx_root.
DATA text TYPE string.

START-OF-SELECTION.

  WRITE: / 'Bölme ve Karekökün test edilmesi', number.
  ULINE.

  TRY.
      IF abs( number ) > 100. "MUTLAK DEĞER
        RAISE EXCEPTION TYPE cx_demo_abs_too_large. "SAYI 100DEN FAZLAYSA
      ENDIF.
      TRY.
          result =  1 / number.
          WRITE: / 'Bölme sonucu:', result.
          result = sqrt( number ). "KAREKÖK
          WRITE: / 'Karekökün sonucu:', result.
        CATCH cx_sy_zerodivide INTO oref. "SIFIRA BÖLME HATASININ DEĞERİNİ AL OREF İÇERİSİNE KOY ONU DA GET_tEXT( ) İLE OREF'DEN ÇEKİP TEXT İÇERİSİNE ATA
          text = oref->get_text( ).
        CLEANUP.
          CLEAR result.
      ENDTRY.
    CATCH cx_sy_arithmetic_error INTO oref.
      text = oref->get_text( ).
    CATCH cx_root INTO oref.
      text = oref->get_text( ).
  ENDTRY.
  IF NOT text IS INITIAL.
    WRITE / text.
  ENDIF.
  WRITE: / 'Son sonuç:', result.
