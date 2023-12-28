*SE91 TRANSACTION KODUYLA MESAJ CLASSI OLUŞTURULUR.

REPORT ZAB_P32_MESAJLAR MESSAGE-ID ZAB_MESSAGE_CLASS. "ilgili mesaj classını belirttik.

*MESSAGE 'HELLO WORLD' TYPE 'S'.
*MESSAGE 'HELLO WORLD' TYPE 'I'.
*MESSAGE 'HELLO WORLD' TYPE 'W'.
*MESSAGE 'HELLO WORLD' TYPE 'A'.
*MESSAGE 'HELLO WORLD' TYPE 'X'.
*MESSAGE 'HELLO WORLD' TYPE 'S'.


*MESSAGE 'HELLO WORLD' TYPE 'S' DISPLAY LIKE 'X'.
*MESSAGE 'HELLO WORLD' TYPE 'S' DISPLAY LIKE 'S'.


*MESSAGE TEXT-000 TYPE 'S'.

*MESSAGE i000(ZAB_MESSAGE_CLASS). " report kısmında mesaj classını belirtmediysek bu şekilde kullanılır

*MESSAGE i000. "report kısmıında mesaj classı belirtildiyse direk bu şekilde kullanılabillir.

MESSAGE i003 with 'çarşamba'. "parametreli mesaj sınıf kullanımı

*MESSAGE i003 with 'çarşamba' 'perşembe'.  "parametreli çoklu mesaj sınıf kullanımı
