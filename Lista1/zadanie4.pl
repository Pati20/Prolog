% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 4. Napisac definicje nastepujacych relacji: elementu maksymalnego, najwiekszego, minimalnego i najmniejszego.

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


minimalny(X) :-
    le(X, X), 
    \+ (le(Y, X), X \= Y). % nieprawda, jesli jest jakis element w relacji z X i jest rozny od X

maksymalny(X) :-
    le(X, X), 
    \+ (le(X, Y), X \= Y). % nieprawda, jesli jest jakis element, z ktorym X jest w relacji i jest rozny od X

najmniejszy(X) :-
	le(X, X), 
	\+ (le(Y, Y), \+ le(X, Y)). % nieprawda, jesli jest jakis element, z którym X nie jest w relacji (bo najmniejszy musi byc w relacji z każdym)

najwiekszy(X) :-
	le(X, X), 
	\+ (le(Y, Y), \+ le(Y, X)).  % nieprawda, jesli jest jakis element, ktory nie jest w relacji z X (bo z najwiekszym kazdy musi byc w relacji)
