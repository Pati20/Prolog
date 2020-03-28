% Author: Patrycja Paradowska
% 19 marca 2020r., Lista 2. Prolog, Zadanie 3. Wyznaczanie wezlow osiagalnych z danego wezla w grafie skierowanym

arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

% Wezel Y jest osiagalny z wwezla X, tzn. jest sciezka  od Xdo Y
osiagalny(X,Y) :- sciezka(X,Y, []).

sciezka(X,X, _).
sciezka(X,Y, V) :-
	arc(X,A),
	\+ member(A,V),
	sciezka(A, Y, [X|V]).

