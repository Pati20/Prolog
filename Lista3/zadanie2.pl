% Author: Patrycja Paradowska
% 26 marca 2020r., Lista 3. Prolog, Zadanie 2. 

max_sum(L, S) :-
	max_sum(L, 0, 0, S).

max_sum([Head|Tail], Current, Best, Sum) :-
	Current1 is max(Current + Head, 0),
 	Best1 is max(Current1, Best),
 	max_sum(Tail, Current1, Best1, Sum).

max_sum([], _, Best1, Best1).
