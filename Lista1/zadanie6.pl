% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 6.

prime(HI,LO,N) :-
	between(HI,LO,N), 
	isprime(N).

isprime(X) :-
	\+ (B is floor(sqrt(X)),
	between(2,B,A),
	(0 is mod(X,A))).
