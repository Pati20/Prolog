% Author: Patrycja Paradowska
% 19 marca 2020r., Lista 2. Prolog, Zadanie 4. Zaproponowac reguly upraszczajace wyrazenie


%%% Zaproponowane reguly upraszczajace wyrazenie, zapisane  w postaci 4-argumentowego predykatu: regula(LewyArgument, Operator, PrawyArgument, Wynik)


regula(X, +, -X, 0).

regula(X, /, X, 1) :-
	number(X),
	X =\= 0.

regula(X, /, X, 1) :-
	\+ number(X).

regula(X, +, Y, X) :-
	number(Y),
	Y =:= 0, !.

regula(X, +, Y, Y) :-
	number(X),
	X =:= 0, !. 

regula(X, -, Y, 0) :-
	Y = X, !.

regula(X, -, 0, X) :-
	number(X).

regula(_, *, 0, 0).

regula(0, *, _, 0).

regula(X, *, 1, X).

regula(X*Y, /, Y, X) :-
	number(Y),
	Y =\= 0.

regula(X*Y, /, Y, X) :-
	\+ number(Y). 



%%% Predykat uprosc - korzystajac z predykatu regula/4 upraszcza zadane wyrazenie (wedlug zaproponowanych regul)


uprosc(W, W) :-		
	atomic(W).

uprosc(W, Wynik) :-		
	W =.. [Operator, LewyArgument, PrawyArgument],
	regula(LewyArgument, Operator, PrawyArgument, Wynik).

uprosc(W, Wynik) :-
	W =.. [Operator, LewyArgument, PrawyArgument],
	\+ regula(LewyArgument, Operator, PrawyArgument, _),
	uprosc(LewyArgument, NowyLewy),
	uprosc(PrawyArgument, NowyPrawy),
	regula(NowyLewy, Operator, NowyPrawy, Wynik).



