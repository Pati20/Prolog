% Author: Patrycja Paradowska
% 7 maja 2020r., Lista 6. Prolog, Zadanie 2. 

:- ['skaner.pl','zadanie1.pl','interpreter.pl'].

% opens file, reads key words from it (with lexer) and then using parser checks if its 
% gramaticly correct program. after that program is executed

wykonaj(N) :- 
	open(N,read,X),
	scanner(X,Y),
	close(X),
	phrase(program(PROGRAM),Y), 
	interpreter(PROGRAM).

