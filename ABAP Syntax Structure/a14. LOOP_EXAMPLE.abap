REPORT ZAB_P10_LOOP_EXAMPLE.

DATA: counter TYPE I,
      max_count TYPE I VALUE 5.

*START-OF-SELECTION bloğu, bir ABAP programının başlangıcını işaretler ve bu blok içindeki
*kodlar yalnızca program çalıştırıldığında çalışır. Başka bir deyişle, programın ana işlevselliği bu blok içinde bulunur.
*Atama işlemleriyle fonksiyonelliği ayırmada kullanılır.
START-OF-SELECTION.

  " basit loop döngüsü
  DO max_count TIMES.
    counter = counter + 1.
    WRITE: / 'Iteration:', counter.
  ENDDO.

  " şartlı döngü
  counter = 0.
   WHILE counter lt max_count.
    counter = counter + 1.
    WRITE: / 'WHILE Döngüsü:', counter.
  ENDWHILE.

  " EXIT çıkışlı loop döngüsü
  DATA lt_data TYPE TABLE OF STRING.
  APPEND 'Değer1' TO lt_data.
  APPEND 'Değer2' TO lt_data.
  APPEND 'Değer3' TO lt_data.

  counter = 0.
  LOOP AT lt_data INTO DATA(lv_value).
    counter = counter + 1.
    WRITE: / 'Tablo İterasyonu:', counter, 'Değer:', lv_value.
    IF counter >= max_count.
      EXIT.
    ENDIF.
  ENDLOOP.
