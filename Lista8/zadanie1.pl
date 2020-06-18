% Author: Patrycja Paradowska
% 5 czerwca 2020r., Lista 8. Prolog, Zadanie 1.

% Na rysunku zostala przedstawiona mapka do pokolorowania w taki sposob, ze
% zadne dwa obszary graniczace ze soba nie moga byc pokolorowane tym samym kolorem.
% Nalezy zapisac problem pokolorowania mapy w postaci prologowych zmiennych
% z dziedzinami, na ktore narzucono odpowiednie ograniczenia.

:- use_module(library(clpfd)).


kolorowanie(X) :-
   X = [Obszar1, Obszar2, Obszar3, Obszar4, Obszar5, Obszar6, Obszar7, Obszar8, Obszar9],
   X ins 1..3,
   Obszar4 #\= Obszar5,
   Obszar8 #\= Obszar9,
   Obszar6 #\= Obszar8,
   Obszar6 #\= Obszar7,
   Obszar7 #\= Obszar8,
   Obszar7 #\= Obszar9,
   Obszar2 #\= Obszar3,   
   Obszar2 #\= Obszar4,
   Obszar2 #\= Obszar9,
   Obszar1 #\= Obszar6,
   Obszar1 #\= Obszar5,
   Obszar1 #\= Obszar4,
   Obszar1 #\= Obszar2,
   Obszar3 #\= Obszar4,
   Obszar3 #\= Obszar5,
   Obszar3 #\= Obszar9,
   Obszar5 #\= Obszar6,
   Obszar5 #\= Obszar7,
   Obszar5 #\= Obszar9.


