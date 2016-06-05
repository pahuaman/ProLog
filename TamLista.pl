%predicado que retorna el tamaño de una lista
%paso base
tamanio([],0).
%paso inductivo reursivo
tamanio([_|C],N):-
   tamanio(C,T),
     N is T + 1.
