% Author: Patrycja Paradowska
% 19 marca 2020r., Lista 2. Prolog, Zadanie 1. Szukanie srodkowego elementu listy (lub false, gdy lista ma parzysta liczbe elementow)

srodkowy(L,X):-
	[X]=L;
	(append(L1,[_],L),
	L1=[_|L2],
	srodkowy(L2,X)).
