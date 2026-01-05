program listas_ej3;

uses uListaEnlazadaSimpleSetAt, SysUtils;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;

procedure crear_lista_vacia(var list: tListaSimple);
begin
    initialize(list);
end;

procedure crear_lista_con_elementos(var list: tListaSimple);
begin
    initialize(list);
    insert_at_end(list, 1);
    insert_at_end(list, 2);
    insert_at_end(list, 3);
end;


procedure test_set_at_lista_vacia();
var
    list: tListaSimple;
    resultado, esperado: string;
begin
    WriteLn('Test set_at: Lista vacía');
    crear_lista_vacia(list);
    set_at(list, 1, 10);
    resultado := to_string(list);
    esperado := '';
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));
end;

procedure test_set_at_posicion_1();
var
    list: tListaSimple;
    resultado, esperado: string;
begin
    WriteLn('Test set_at: Posición 1');
    crear_lista_con_elementos(list);
    set_at(list, 1, 10);
    resultado := to_string(list);
    esperado := '10 2 3 ';
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));
end;

procedure test_set_at_posicion_media();
var
    list: tListaSimple;
    resultado, esperado: string;
begin
    WriteLn('Test set_at: Posición media');
    crear_lista_con_elementos(list);
    set_at(list, 2, 10);
    resultado := to_string(list);
    esperado := '1 10 3 ';
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));
end;

procedure test_set_at_posicion_final();
var
    list: tListaSimple;
    resultado, esperado: string;
begin
    WriteLn('Test set_at: Posición final');
    crear_lista_con_elementos(list);
    set_at(list, 3, 10);
    resultado := to_string(list);
    esperado := '1 2 10 ';
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));
end;

procedure test_set_at_posicion_fuera_rango();
var
    list: tListaSimple;
    resultado, esperado: string;
begin
    WriteLn('Test 1 set_at: Posición fuera de rango');
    crear_lista_con_elementos(list);
    set_at(list, 4, 10);
    resultado := to_string(list);
    esperado := '1 2 3 '; // No debería modificar nada
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));

    WriteLn('Test 2 set_at: Posición fuera de rango');
    crear_lista_con_elementos(list);
    set_at(list, 0, 10);
    resultado := to_string(list);
    esperado := '1 2 3 '; // No debería modificar nada
    WriteLn('  Resultado = ', resultado, ', Esperado = ', esperado, ', Test: ', bool_to_str(resultado = esperado));
end;


begin
    WriteLn('Comprobación del método set_at en uListaEnlazadaSimple:');
    WriteLn('');

    test_set_at_lista_vacia();
    test_set_at_posicion_1();
    test_set_at_posicion_media();
    test_set_at_posicion_final();
    test_set_at_posicion_fuera_rango();

    readln;
end.