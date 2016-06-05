% monty phyton
%una bruja es una mujer que se quema, brujas estan hechas de madera.
%la madera flota. que mas flota sobre el agua? un pato;
%si algo tiene el mismo peso que un pato entonces debe flotar

bruja(X):- sequema(X), mujer(X).

sequema(X):- madera(X).

madera(X):- flota(X).

flota(X):- mismoPeso(pato, X).

mujer(chica).

mismoPeso(pato, chica).
