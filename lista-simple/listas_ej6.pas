program listas_ej6;

uses
  SysUtils,
  uListaEnlazadaSimpleMod, 
    DateUtils;

function showOkWrong(ok: boolean): string;
begin
  if ok then
    showOkWrong := 'OK'
  else
    showOkWrong := 'ERROR';
end;

var
  lista: tListaSimpleMod;
  listaCopiada: tListaSimpleMod;
  valorEnRango, valorFueraRango: Integer;
  contenido, contenidoFrecuencias: string;
  insercionCorrecta, busquedaCorrecta, copiaCorrecta: Boolean;
  numElementos, expectedNumElementos: Integer;
  frecuenciaValor, expectedFrecuencia: Integer;
  i : Integer;
    startTime, endTime: TDateTime;
    elapsedTime: Double;


begin
  // Valores de prueba
  valorEnRango := 42;            // Un valor dentro del rango
  valorFueraRango := MAX_RANGE + 10; // Un valor fuera del rango

  // Prueba 1: Inicialización y comprobación de lista vacía
  WriteLn('Prueba 1: Inicialización y comprobación de lista vacía');
  initialize(lista);
  WriteLn('- Es vacía: ', is_empty(lista), ' = true', #9, showOkWrong(is_empty(lista) = true));
  
  // Prueba 2: Inserción al final y comprobación de contenido
  WriteLn(#10'Prueba 2: Inserción al final y comprobación de contenido');
  insert_at_end(lista, valorEnRango);
  insercionCorrecta := (not is_empty(lista)) and (last(lista) = valorEnRango);
  WriteLn('- Inserción al final: ', not is_empty(lista), ' y último = ', last(lista), ' = ', valorEnRango, #9, showOkWrong(insercionCorrecta));
  
  // Prueba 3: Intento de inserción de valor fuera de rango
  WriteLn(#10'Prueba 3: Intento de inserción de valor fuera de rango');
  WriteLn('- Intentando insertar valor fuera de rango: ', valorFueraRango);
  insert_at_end(lista, valorFueraRango);
  // No podemos verificar directamente que no se insertó, pero comprobamos que el último sigue siendo el mismo
  insercionCorrecta := last(lista) = valorEnRango;
  WriteLn('- Último elemento sigue siendo: ', last(lista), ' = ', valorEnRango, #9, showOkWrong(insercionCorrecta));
  
  // Prueba 4: Inserción al inicio y comprobación
  WriteLn(#10'Prueba 4: Inserción al inicio y comprobación');
  insert_at_begin(lista, 10);
  insercionCorrecta := first(lista) = 10;
  WriteLn('- Inserción al inicio: ', first(lista), ' = 10', #9, showOkWrong(insercionCorrecta));
  
  // Prueba 5: Verificación de existencia de elementos con in_list
  WriteLn(#10'Prueba 5: Verificación de existencia de elementos con in_list');
  busquedaCorrecta := in_list(lista, valorEnRango) and not in_list(lista, 999);
  WriteLn('- Buscar ', valorEnRango, ': ', in_list(lista, valorEnRango), ' = true', #9, showOkWrong(in_list(lista, valorEnRango)));
  WriteLn('- Buscar 999: ', in_list(lista, 999), ' = false', #9, showOkWrong(not in_list(lista, 999)));
  
  // Prueba 6: Añadir elementos repetidos y comprobar frecuencias
  WriteLn(#10'Prueba 6: Añadir elementos repetidos y comprobar frecuencias');
  insert_at_end(lista, valorEnRango);  // Añadir 42 otra vez
  insert_at_end(lista, valorEnRango);  // Añadir 42 una tercera vez
  expectedFrecuencia := 3;
  frecuenciaValor := get_frequency(lista, valorEnRango);
  WriteLn('- Frecuencia de ', valorEnRango, ': ', frecuenciaValor, ' = ', expectedFrecuencia, #9, showOkWrong(frecuenciaValor = expectedFrecuencia));
  
  // Prueba 7: Eliminar un elemento y comprobar frecuencia actualizada
  WriteLn(#10'Prueba 7: Eliminar un elemento y comprobar frecuencia actualizada');
  delete(lista, valorEnRango);
  expectedFrecuencia := 2;
  frecuenciaValor := get_frequency(lista, valorEnRango);
  WriteLn('- Frecuencia de ', valorEnRango, ' después de borrar: ', frecuenciaValor, ' = ', expectedFrecuencia, #9, showOkWrong(frecuenciaValor = expectedFrecuencia));
  
  // Prueba 8: Mostrar contenido y frecuencias
  WriteLn(#10'Prueba 8: Mostrar contenido y frecuencias');
  contenido := to_string(lista);
  contenidoFrecuencias := frequency_to_string(lista);
  WriteLn('- Contenido: ', contenido);
  WriteLn('- Frecuencias: ', contenidoFrecuencias);
  
  // Prueba 9: Conteo de elementos
  WriteLn(#10'Prueba 9: Conteo de elementos');
  expectedNumElementos := 3;  // 1 elemento con valor 10 y 2 elementos con valor 42
  numElementos := num_elems(lista);
  WriteLn('- Número de elementos: ', numElementos, ' = ', expectedNumElementos, #9, showOkWrong(numElementos = expectedNumElementos));
  
  // Prueba 10: Copiar lista
  WriteLn(#10'Prueba 10: Copiar lista');
  copy(lista, listaCopiada);
  copiaCorrecta := (to_string(lista) = to_string(listaCopiada)) and (num_elems(lista) = num_elems(listaCopiada));
  WriteLn('- Contenido original: ', to_string(lista));
  WriteLn('- Contenido copiado: ', to_string(listaCopiada));
  WriteLn('- Copia correcta: ', copiaCorrecta, #9, showOkWrong(copiaCorrecta));
  
  // Prueba 11: Borrado al inicio y fin
  WriteLn(#10'Prueba 11: Borrado al inicio y fin');
  delete_at_begin(lista);
  WriteLn('- Después de borrar al inicio: ', to_string(lista));
  delete_at_end(lista);
  WriteLn('- Después de borrar al final: ', to_string(lista));
  // Verificar frecuencia después de borrados
  expectedFrecuencia := 1;
  frecuenciaValor := get_frequency(lista, valorEnRango);
  WriteLn('- Frecuencia de ', valorEnRango, ' después de borrados: ', frecuenciaValor, ' = ', expectedFrecuencia, #9, showOkWrong(frecuenciaValor = expectedFrecuencia));
  
  // Prueba 12: Borrar la lista completamente
  WriteLn(#10'Prueba 12: Borrar la lista completamente');
  clear(lista);
  WriteLn('- Lista vacía después de clear: ', is_empty(lista), ' = true', #9, showOkWrong(is_empty(lista)));
  // Verificar que las frecuencias se han reseteado
  frecuenciaValor := get_frequency(lista, valorEnRango);
  WriteLn('- Frecuencia de ', valorEnRango, ' después de clear: ', frecuenciaValor, ' = 0', #9, showOkWrong(frecuenciaValor = 0));
  
  // Prueba 13: Comparas los tiempos entre in_list O(1) y rec_in_list O(n)
  WriteLn(#10'Prueba 13: Comparas los tiempos entre in_list O(1) y rec_in_list O(n)');
    initialize(lista);
    for i := 1 to 32767 do
    begin
        insert_at_end(lista, i);
    end;
    startTime := Now;
    in_list(lista, 32767);
    endTime := Now;
    elapsedTime := MilliSecondsBetween(endTime, startTime);

    WriteLn('- Tiempo que tarda la función `in_list` de la lista original: ', elapsedTime:0:2, ' ms');

    startTime := Now;
    rec_in_list(lista, 32767);
    endTime := Now;
    elapsedTime := MilliSecondsBetween(endTime, startTime);

    WriteLn('- Tiempo que tarda la función `rec_in_list` de la lista original: ', elapsedTime:0:2, ' ms');




  WriteLn(#10'Todas las pruebas completadas. Presiona Enter para salir.');
  ReadLn;
end.