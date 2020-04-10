% Author: Patrycja Paradowska
% 9 kwietnia 2020r., Lista 4. Prolog, Zadanie 3. 

% Mamy 24 zapalki ulozone w sposob przedstawiony na rysunku

% +---+---+---+
% |   |   |   |
% +---+---+---+
% |   |   |   |
% +---+---+---+
% |   |   |   |
% +---+---+---+

% Tworza one kwadrat 3x3 (duzy), kwadraty 2x2 (cztery srednie) oraz kwadraty 1x1 (dziewiec malych).
% Napisac predykat zapalki(N, KWADRATY), ktory zabiera N zapalek tak,
% aby pozostale tworzyly zbiory kwadratow - rozwiazanie rysujemy prostymi znakami.


generuj(W, L, X) :-
    member(X, L) ->
    write(W), !;
    atom_length(W, N), tab(N).

poziome_kreski(L, N1, N2, N3) :-
    write(+), generuj(---, L, N1),
    write(+), generuj(---, L, N2),
    write(+), generuj(---, L, N3),
    write(+), nl.

pionowe_kreski(L, N1, N2, N3, N4) :-
    generuj("|", L, N1), tab(3),
    generuj("|", L, N2), tab(3),
    generuj("|", L, N3), tab(3),
    generuj("|", L, N4), nl.


% Wyobrazmy sobie, ze kazda zapalka jest reprezentowana numerkiem, tak jak na rysunku:

% +---1---+---2---+---3---+
% |       |       |       |
% 4       5       6       7
% |       |       |       |
% +---8---+---9---+--10---+
% |       |       |       |
% 11     12      13       14
% |       |       |       |
% +--15---+---16--+--17---+
% |       |       |       |
% 18      19     20       21
% |       |       |       |
% +--22---+---23--+--24---+


kwadrat(_, 0, []).

% Reprezentacja jednego duzego kwadratu 3x3
kwadrat(duze, 1, [1, 2, 3,
                     4, 7,
                    11, 14,
                    18, 21,
                22, 23, 24]).

% Reprezentacja srednich kwadratow 2x2 (jest ich 4)
kwadrat(srednie, 1, [ 1,  2,
                      4,  6,
                     11, 13, 
                     15, 16]).
kwadrat(srednie, 1, [ 2,  3,
                      5,  7,
                     12, 14,
                     16, 17]). 
kwadrat(srednie, 1, [ 8,  9,
                     11, 13,
                     18, 20,
                     22, 23]).
kwadrat(srednie, 1, [ 9, 10,
                     12, 14,
                     19, 21,
                     23, 24]).

% Reprezentacja malych kwadratow 1x1 (jest ich 9)
kwadrat(male, 1, [1,4,5,8]).
kwadrat(male, 1, [2,5,6,9]).
kwadrat(male, 1, [3,6,7,10]).
kwadrat(male, 1, [8,11,12,15]).
kwadrat(male, 1, [9,12,13,16]).
kwadrat(male, 1, [10,13,14,17]).
kwadrat(male, 1, [15,18,19,22]).
kwadrat(male, 1, [16,19,20,23]).
kwadrat(male, 1, [17,20,21,24]).

kwadrat(S, N, R) :-
    N1 is N - 1,
    N1 > 0,
    kwadrat(S, 1, X),
    kwadrat(S, N1, Y),
    min_list(X, SX),
    min_list(Y, SY),
    SX < SY,
    union(X, Y, R),
    R \= Y.

rysowanie(X) :-
    poziome_kreski(X, 1, 2, 3),
    pionowe_kreski(X, 4, 5, 6, 7),
    poziome_kreski(X, 8, 9, 10),
    pionowe_kreski(X, 11, 12, 13, 14),
    poziome_kreski(X, 15, 16, 17),
    pionowe_kreski(X, 18, 19, 20, 21),
    poziome_kreski(X, 22, 23, 24).

rozwiazanie_zadania(C, B, M, S) :-
    kwadrat(duze, B, S3),
    kwadrat(srednie, M, S2),
    kwadrat(male, S, S1),
    union(S1, S2, U),
    union(U, S3, R),
    length(R, N),
    C is 24 - N,
    rysowanie(R).

zapalki(N, C) :- zapalki(N, C, 0, 0, 0).
zapalki(N, (C), _, M, S) :- C = duze(CN), rozwiazanie_zadania(N, CN, M, S).
zapalki(N, (C), B, _, S) :- C = srednie(CN), rozwiazanie_zadania(N, B, CN, S).
zapalki(N, (C), B, M, _) :- C = male(CN), rozwiazanie_zadania(N, B, M, CN).
zapalki(N, (C, Cs), _ , M, S) :- C = duze(CN), zapalki(N, (Cs), CN, M, S).
zapalki(N, (C, Cs), B, _, S) :- C = srednie(CN), zapalki(N, (Cs), B, CN, S).
zapalki(N, (C, Cs), B, M, _) :- C = male(CN), zapalki(N, (Cs), B, M, CN).
