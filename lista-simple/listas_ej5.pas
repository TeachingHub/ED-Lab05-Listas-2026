program listas_ej5;

uses uListaEnlazadaSimple;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;

{
    Implementar un subprograma que reciba dos listas ordenadas de enteros y devuelva una nueva lista ordenada con la unión de ambas listas.
    Las listas originales no deben ser modificadas.
}
procedure unir_listas_ordenadas(var lista1, lista2, lista_resultante: tListaSimple);
begin
    WriteLn('No implementado');
end;


procedure crear_lista_ordenada_1(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 3);
    insert_at_end(l, 5);
end;

procedure crear_lista_ordenada_2(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 2);
    insert_at_end(l, 4);
    insert_at_end(l, 6);
end;

procedure crear_lista_ordenada_3(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
    insert_at_end(l, 6);
end;

procedure crear_lista_ordenada_4(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 7);
    insert_at_end(l, 9);
end;

procedure crear_lista_ordenada_5(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 3);
    insert_at_end(l, 5);
    insert_at_end(l, 8);
end;

procedure crear_lista_ordenada_vacia(var l: tListaSimple);
begin
    initialize(l);
end;


procedure test_unir_listas_ordenadas();
var
    lista1, lista2, lista_resultante, lista_correcta: tListaSimple;
    resultado, lista1_str, lista2_str: string;
begin
    WriteLn('Ejercicio: Unir listas ordenadas');

    // Test 1: Listas sin elementos comunes
    crear_lista_ordenada_1(lista1); // lista1 = [1, 3, 5]
    lista1_str := to_string(lista1);
    crear_lista_ordenada_2(lista2); // lista2 = [2, 4, 6]
    lista2_str := to_string(lista2);
    crear_lista_ordenada_3(lista_correcta); // lista_correcta = [1, 2, 3, 4, 5, 6]

    WriteLn('  Listas a unir: lista1 = ', lista1_str, ', lista2 = ', lista2_str);
    unir_listas_ordenadas(lista1, lista2, lista_resultante);
    resultado := to_string(lista_resultante);

    WriteLn('  Test 1: Resultado = ', resultado, ', Correcto = ', to_string(lista_correcta) , ' El ejercicio funciona ', bool_to_str(resultado = to_string(lista_correcta)));
    WriteLn('  Estado lista inicial 1 sin modificar: ',  bool_to_str(lista1_str = to_string(lista1)));
    WriteLn('  Estado lista inicial 2 sin modificar: ',  bool_to_str(lista2_str = to_string(lista2)));


    // Test 2: Listas con elementos comunes y diferentes longitudes
    crear_lista_ordenada_4(lista1); // lista1 = [1, 2, 7, 9]
    lista1_str := to_string(lista1);
    crear_lista_ordenada_5(lista2); // lista2 = [3, 5, 8]
    lista2_str := to_string(lista2);
    initialize(lista_correcta);
    insert_at_end(lista_correcta, 1);
    insert_at_end(lista_correcta, 2);
    insert_at_end(lista_correcta, 3);
    insert_at_end(lista_correcta, 5);
    insert_at_end(lista_correcta, 7);
    insert_at_end(lista_correcta, 8);
    insert_at_end(lista_correcta, 9);
    WriteLn('  Listas a unir: lista1 = ', lista1_str, ', lista2 = ', lista2_str);
    unir_listas_ordenadas(lista1, lista2, lista_resultante);
    resultado := to_string(lista_resultante);

    WriteLn('  Test 2: Resultado = ', resultado, ', Correcto = ', to_string(lista_correcta) , ' El ejercicio funciona ', bool_to_str(resultado = to_string(lista_correcta)));
    WriteLn('  Estado lista inicial 1 sin modificar: ',  bool_to_str(lista1_str = to_string(lista1)));
    WriteLn('  Estado lista inicial 2 sin modificar: ',  bool_to_str(lista2_str = to_string(lista2)));

    // Test 3: Una lista vacía y otra con elementos
    crear_lista_ordenada_vacia(lista1); // lista1 = []
    lista1_str := to_string(lista1);
    crear_lista_ordenada_2(lista2); // lista2 = [2, 4, 6]
    lista2_str := to_string(lista2);
    crear_lista_ordenada_2(lista_correcta); // lista_correcta = [2, 4, 6]
    WriteLn('  Listas a unir: lista1 = ', lista1_str, ', lista2 = ', lista2_str);
    unir_listas_ordenadas(lista1, lista2, lista_resultante);
    resultado := to_string(lista_resultante);

    WriteLn('  Test 3: Resultado = ', resultado, ', Correcto = ', to_string(lista_correcta) , ' El ejercicio funciona ', bool_to_str(resultado = to_string(lista_correcta)));
    WriteLn('  Estado lista inicial 1 sin modificar: ',  bool_to_str(lista1_str = to_string(lista1)));
    WriteLn('  Estado lista inicial 2 sin modificar: ',  bool_to_str(lista2_str = to_string(lista2)));

    // Test 4: Ambas listas vacías
    crear_lista_ordenada_vacia(lista1); // lista1 = []
    lista1_str := to_string(lista1);
    crear_lista_ordenada_vacia(lista2); // lista2 = []
    lista2_str := to_string(lista2);
    crear_lista_ordenada_vacia(lista_correcta); // lista_correcta = []
    WriteLn('  Listas a unir: lista1 = ', lista1_str, ', lista2 = ', lista2_str);
    unir_listas_ordenadas(lista1, lista2, lista_resultante);
    resultado := to_string(lista_resultante);

    WriteLn('  Test 4: Resultado = ', resultado, ', Correcto = ', to_string(lista_correcta) , ' El ejercicio funciona ', bool_to_str(resultado = to_string(lista_correcta)));
    WriteLn('  Estado lista inicial 1 sin modificar: ',  bool_to_str(lista1_str = to_string(lista1)));
    WriteLn('  Estado lista inicial 2 sin modificar: ',  bool_to_str(lista2_str = to_string(lista2)));

    // Test 5: Listas con algunos elementos duplicados (en listas separadas pero no necesariamente internamente)
    crear_lista_ordenada_4(lista1); // lista1 = [1, 2, 7, 9]
    lista1_str := to_string(lista1);
    crear_lista_ordenada_4(lista2); // lista2 = [1, 2, 7, 9]
    lista2_str := to_string(lista2);
    initialize(lista_correcta);
    insert_at_end(lista_correcta, 1);
    insert_at_end(lista_correcta, 1);
    insert_at_end(lista_correcta, 2);
    insert_at_end(lista_correcta, 2);
    insert_at_end(lista_correcta, 7);
    insert_at_end(lista_correcta, 7);
    insert_at_end(lista_correcta, 9);
    insert_at_end(lista_correcta, 9);
    WriteLn('  Listas a unir: lista1 = ', lista1_str, ', lista2 = ', lista2_str);
    unir_listas_ordenadas(lista1, lista2, lista_resultante);
    resultado := to_string(lista_resultante);

    WriteLn('  Test 5: Resultado = ', resultado, ', Correcto = ', to_string(lista_correcta) , ' El ejercicio funciona ', bool_to_str(resultado = to_string(lista_correcta)));
    WriteLn('  Estado lista inicial 1 sin modificar: ',  bool_to_str(lista1_str = to_string(lista1)));
    WriteLn('  Estado lista inicial 2 sin modificar: ',  bool_to_str(lista2_str = to_string(lista2)));
end;


begin
    test_unir_listas_ordenadas();
    readln;
end.