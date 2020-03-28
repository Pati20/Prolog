% Author: Patrycja Paradowska
% 20 marca 2020r., Lista 2. Prolog, Zadanie 5. 


create(N, L) :- findall(Number, between(1, N, Number), L).%numlist(1,N,L).


permute([],[]).
permute([H|T],L) :- permute(T,L1), select(H,L,L1).


links([H1|T1], [H2|T2], [H1, H2|Tail]) :- !, links(T1, T2, Tail).
links([], R, R) :- !.
links(R, [], R).


lista(N, X):-
	create(N,L1),
	permute(L1, L2),
	links(L1,L2,X).
