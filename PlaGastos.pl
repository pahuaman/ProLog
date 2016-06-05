viajar(roma, 20000).
viajar(londres, 25000).
viajar(tunez, 15000).

hospedaje(hotel, roma, 25000).
hospedaje(hotel, londres, 15000).
hospedaje(hotel, tunez, 10000).

hospedaje(hostal, roma, 15000).
hospedaje(hostal, londres, 10000).
hospedaje(hostal, tunez, 80000).

hospedaje(acampar, roma, 10000).
hospedaje(acampar, londres, 5000).
hospedaje(acampar, tunez, 5000).

costo_total(Ciudad, Dias, Tipo_alojamiento, Costo):-
           viajar(Ciudad, A), hospedaje(Tipo_alojamiento, Ciudad, B),
           C is B*Dias, Costo is C+A.




