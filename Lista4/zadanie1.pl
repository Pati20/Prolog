% Author: Patrycja Paradowska
% 7 kwietnia 2020r., Lista 4. Prolog, Zadanie 1.

% Napisac predykat wyrazenie(LISTA, WARTOSC, WYRAZENIE), ktory dla danej listy
% liczb LISTA i danej wartosci WARTOSC buduje wyrazenie WYRAZENIE powstale przez wstawianie miedzy 
% liczby znajdujace sie na liscie operatorow arytmetycznych +, -, * i / oraz, jesli potrzeba, nawiasow.


option(E, O1, O2) :- E = O1 + O2.
option(E, O1, O2) :- E = O1 - O2.
option(E, O1, O2) :- E = O1 * O2.
option(E, O1, O2) :- 
  0 =\= O2, 
  E = O1 / O2.	

create([E], E).
create(L, E) :-
	append(L1, L2, L),
	\+ length(L1, 0),
	\+ length(L2, 0),
	create(L1, O1),
	create(L2, O2),
	option(E, O1, O2).

wyrażenie(NUMBERS, VALUE, EXPRESSION) :-
	create(NUMBERS, E),
	VALUE is E,
	EXPRESSION = E.
