% Author: Patrycja Paradowska
% 19 marca 2020r., Lista 2. Prolog, Zadanie 2. Sprawdzanie, czy dany element wystepuje jednokrotnie lub dwukrotnie na zadanej liscie

% X - okreslony element
% L - podana lista elementow

jednokrotnie(X, L) :-
	append(P, [X|S], L),
	\+ member(X, S),
	\+ member(X, P).
	
dwukrotnie(X, L) :-
	append(P, [X|S], L),
	\+ member(X, P),
	jednokrotnie(X, S).
