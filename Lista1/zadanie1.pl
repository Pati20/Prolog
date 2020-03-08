% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 1.

ojciec(radek, tomek).
ojciec(tomek, jola).
ojciec(darek, sylwia).
ojciec(radek, mateusz).

matka(kasia, tomek).
matka(aleksandra, jola).
matka(jola, sylwia).
matka(sylwia, mateusz).

mezczyzna(radek).
mezczyzna(tomek).
mezczyzna(darek).
mezczyzna(mateusz).

kobieta(kasia).
kobieta(aleksandra).
kobieta(jola).
kobieta(sylwia).

  
jest_rodzicem(X, Y) :-
	matka(X, Y);
	ojciec(X, Y).

jest_matka(X) :- matka(X, _).

jest_ojcem(X) :- ojciec(X, _).

jest_synem(X) :-
	jest_rodzicem(_, X),
	mezczyzna(X).

siostra(X, Y) :- 
	kobieta(X),
	jest_rodzicem(Z, X), 
	jest_rodzicem(Z, Y),
	X \= Y.

dziadek(X, Y) :- 
	ojciec(X, Z),
	jest_rodzicem(Z, Y).

babcia(X,Y) :-
	matka(X, Z),
	jest_rodzicem(Z, Y).

rodzenstwo(X, Y) :- 
	jest_rodzicem(Z, X),
	jest_rodzicem(Z, Y),
	X \= Y.

ciotka(X, Y) :-
	kobieta(X),
	rodzenstwo(X, Z),
	jest_rodzicem(Z, Y).
