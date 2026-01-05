program listas_ej8;

uses uListaEnlazadaCircularMod;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;

procedure crear_lista_circular_1(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
end;

procedure crear_lista_circular_2(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 10);
    insert_at_end(l, 20);
end;

procedure crear_lista_circular_3(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 7);
    insert_at_end(l, 7);
    insert_at_end(l, 7);
end;

procedure crear_lista_circular_4(var l: tListaCircular);
begin
    initialize(l);
    insert_at_end(l, 1);
end;

procedure crear_lista_circular_vacia(var l: tListaCircular);
begin
    initialize(l);
end;


procedure test_num_elems_functions();
var
    lista: tListaCircular;
    elems_iterativo, elems_recursivo: integer;
    resultado_test: boolean;
begin
    WriteLn('Ejercicio: Comparación num_elems iterativo vs recursivo');

    // Test 1: Lista con varios elementos
    crear_lista_circular_1(lista); // lista = [1, 2, 3, 4, 5]
    WriteLn('  Test 1: Lista con 5 elementos.');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', elems_iterativo);
    WriteLn('    num_elems_rec (recursivo): ', elems_recursivo);
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 2: Lista con menos elementos
    crear_lista_circular_2(lista); // lista = [10, 20]
    WriteLn('  Test 2: Lista con 2 elementos.');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', num_elems(lista));
    WriteLn('    num_elems_rec (recursivo): ', num_elems_rec(lista));
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 3: Lista con elementos repetidos
    crear_lista_circular_3(lista); // lista = [7, 7, 7]
    WriteLn('  Test 3: Lista con elementos repetidos (3 elementos).');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', num_elems(lista));
    WriteLn('    num_elems_rec (recursivo): ', num_elems_rec(lista));
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 4: Lista vacía
    crear_lista_circular_vacia(lista); // lista = []
    WriteLn('  Test 4: Lista vacía.');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', num_elems(lista));
    WriteLn('    num_elems_rec (recursivo): ', num_elems_rec(lista));
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 5: Lista con un solo elemento
    crear_lista_circular_4(lista); // lista = [1]
    WriteLn('  Test 5: Lista con un solo elemento.');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', num_elems(lista));
    WriteLn('    num_elems_rec (recursivo): ', num_elems_rec(lista));
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 6: Lista vacía después de eliminar elementos
    crear_lista_circular_1(lista); // lista = [1, 2, 3, 4, 5]
    clear(lista); // lista = []
    WriteLn('  Test 6: Lista vacía después de clear().');
    elems_iterativo := num_elems(lista);
    elems_recursivo := num_elems_rec(lista);
    resultado_test := (elems_iterativo = elems_recursivo);
    WriteLn('    num_elems (iterativo): ', num_elems(lista));
    WriteLn('    num_elems_rec (recursivo): ', num_elems_rec(lista));
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));
    WriteLn('');
end;


procedure test_to_string_functions();
var
    lista: tListaCircular;
    str_iterativo, str_recursivo: string;
    resultado_test: boolean;
begin
    WriteLn('Ejercicio: Comparación to_string iterativo vs recursivo');

    // Test 1: Lista con varios elementos
    crear_lista_circular_1(lista); // lista = [1, 2, 3, 4, 5]
    WriteLn('  Test 1: Lista con 5 elementos.');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', str_iterativo, '"');
    WriteLn('    to_string_rec (recursivo): "', str_recursivo, '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 2: Lista con menos elementos
    crear_lista_circular_2(lista); // lista = [10, 20]
    WriteLn('  Test 2: Lista con 2 elementos.');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', to_string(lista), '"');
    WriteLn('    to_string_rec (recursivo): "', to_string_rec(lista), '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 3: Lista con elementos repetidos
    crear_lista_circular_3(lista); // lista = [7, 7, 7]
    WriteLn('  Test 3: Lista con elementos repetidos (3 elementos).');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', to_string(lista), '"');
    WriteLn('    to_string_rec (recursivo): "', to_string_rec(lista), '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 4: Lista vacía
    crear_lista_circular_vacia(lista); // lista = []
    WriteLn('  Test 4: Lista vacía.');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', to_string(lista), '"');
    WriteLn('    to_string_rec (recursivo): "', to_string_rec(lista), '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 5: Lista con un solo elemento
    crear_lista_circular_4(lista); // lista = [1]
    WriteLn('  Test 5: Lista con un solo elemento.');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', to_string(lista), '"');
    WriteLn('    to_string_rec (recursivo): "', to_string_rec(lista), '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));

    // Test 6: Lista vacía después de eliminar elementos
    crear_lista_circular_1(lista); // lista = [1, 2, 3, 4, 5]
    clear(lista); // lista = []
    WriteLn('  Test 6: Lista vacía después de clear().');
    str_iterativo := to_string(lista);
    str_recursivo := to_string_rec(lista);
    resultado_test := (str_iterativo = str_recursivo);
    WriteLn('    to_string (iterativo): "', to_string(lista), '"');
    WriteLn('    to_string_rec (recursivo): "', to_string_rec(lista), '"');
    WriteLn('    ¿Resultados iguales?: ', bool_to_str(resultado_test));
end;


begin
    test_num_elems_functions();
    WriteLn(''); // Separador entre tests
    test_to_string_functions();
    readln;
end.