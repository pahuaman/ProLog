%este le indica a nuestra base que familia puede cambiar durante la ejecucion del programa
:- dynamic(familia/2).

%hechos de la base de conocimientos
familia(andres, [enrique, gabriela]).
familia(jose,   [antonio, maria]).
familia(eduardo,[ana, josue]).

%Funcion para eliminar una familia
elimina :- write('Nombre: '), read(Nombre),
           retract(familia(Nombre, _)), !.
elimina :- write('Esa persona No existe\n ').

%borrar todas las familias que tengamos en la base y en memoria
borrar :- abolish(familia/2),
          write('Se han borrado todas las familias \n').

%Funcio para agregar una familia nueva a la base de conocimientos
agregar :- write('Nombre: '), read(Nombre),
           write('Cantidad de familiares: '),
           read(Cant), crearFamilia(Cant, F),
           Fam = familia(Nombre, F),
           asserta(Fam).

crearFamilia(0, [])        :- !, true.
crearFamilia(C, [Hijo|L]) :- read(Hijo), Ctemp is C - 1, crearFamilia(Ctemp,L).


%El menu principal de nuestro sistema experto
menu :- write('\n*****Sistema de Familias*********\n '),
        write('1. Agregar familia \n '),
        write('2. Eliminar una familia \n '),
        write('3. Borrar todas las familias \n '),
        write('4. mostrar todas las familias \n '),
        write('5. mostrar los hijos de algun padre \n '),
        write('6. mostrar todos los padres \n '),
        write('Elige tu opcion (Cero para salir): '), read(Opcion),
        ejecutar(Opcion).

%Regla que funciona similar a un swicth
ejecutar(Opcion) :- Opcion == 1, agregar, menu;
                    Opcion == 2, elimina, menu;
                    Opcion == 3, borrar,  menu;
                    Opcion == 4, mostrar, menu;
                    Opcion == 5, hijo_de, menu;
                    Opcion == 6, listaPadres, menu;
                    Opcion == 0, true.

%Regla para mostrar las familias (solo los hijos)
mostrar :- setof(C, (P,H)^(familia(P,H), member(C,H)), L), write(L).

%Regla para mostrar los hijos por separado.
hijo_de :- write('Nombre: '), read(Nombre),
           familia(Nombre, L),nl,
           write(L).

%Regla para mostrar a los progenitores
listaPadres :- findall(Nombre, familia(Nombre, _), Padres),
               write(Padres).



