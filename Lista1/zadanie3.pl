% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 3. Opis rozmieszczenia obiektow

left_of(olowek, klepsydra).
left_of(klepsydra, motyl).
left_of(motyl, ryba).
above(rower, olowek).
above(aparat, motyl).

%%%% rekurencyjne reguly

left_rec(X, Y) :- left_of(X, Y).
left_rec(X, Y) :- 
    left_of(X, Z), 
    left_rec(Z, Y).


above_rec(X, Y) :- above(X, Y).
above_rec(X, Y) :- 
    above(X, Z), 
    above_rec(Z, Y).

%%%% definicja nowych predykatow: right_of oraz below

right_of(X, Y) :- left_of(Y, X).
right_rec(X, Y) :- left_rec(Y, X).

below(X, Y) :- above(Y, X).
below_rec(X, Y) :- above_rec(Y, X).


%%%% definicja higher(Object1, Object2), ktory jest prawdziwy, jesli Obiekt1 jest w wyzej polozonym wierszu niz Obiekt2

higher(X, Y) :- above_rec(X, Y).

higher(X, Y) :-
    above_rec(X, Z),
    (left_rec(Z, Y); right_rec(Z, Y)).

higher(X, Y) :-
    above(X, Z1),
    above(Y, Z2),
    higher(Z1, Z2).


