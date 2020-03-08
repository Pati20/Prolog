% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 5. Napisac bezargumentowy predykat czesciowy_porzadek, ktory jest spelniony, gdy relacja jest czesciowym porzadkiem


le(a, a).
le(a, b).
le(a, c).
le(a, d).
le(a, e).

le(b, b).
le(b, c).
le(b, e).

le(c, c).
le(c, e).

le(d, d).
le(d, e).

le(e, e).

le(f, f).


czesciowy_porzadek() :-
	\+ ((le(X, _); le(_, X)), \+ le(X, X)), 	% ZWROTNOSC czyli kazdy element jest w relacji z samym soba
	\+ (le(X, Y), le(Y, Z), \+ le(X, Z)),		% PRZECHODNIOSC czyli jesli relacja zachodzi dla (X,Y) oraz (Y,Z), to musi tez dla (X,Z)
	\+ (le(X, Y), le(Y, X), X \= Y).		% SŁABA ANTYSYMETRIA czyli relacja nie może zachodzić jednocześnie dla par (X,Y) oraz (Y,X) dla roznych X i Y
