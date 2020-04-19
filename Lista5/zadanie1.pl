% Author: Patrycja Paradowska
% 16 kwietnia 2020r., Lista 5. Prolog, Zadanie 1.
% Napisac predykat scanner(Strumien, Tokeny), ktory czyta strumien znakow i zamienia go na liste tokenow.

% W pliku ex1.prog znajduje sie tekst. Przyklad wykonania skanowania na tym pliku to:
% ?- open('ex1.prog', read, X), scanner(X, Y), close(X), write(Y).


%lexer for simple imperative language.

% key(SLOWO_KLUCZOWE) gdzie SLOWO_KLUCZOWE jest jednym ze slow kluczowych języka Imperator: read, write, if, then, else, fi, while, do, od, and, or, mod;
key(read).
key(write).
key(if).
key(then).
key(else).
key(fi).
key(while).
key(do).
key(od).
key(and).
key(or).
key(mod).


int([H|T]) :- char_type(H,digit), int(T).
int([]) :- !.


id([H|T]) :-
	char_type(H,upper), id(T).
id([]) :-!.


ws(' ').
ws('\t').
ws('\n').


% sep(SEPARATOR) gdzie SEPARATOR jest jednym z separatorów języka Imperator: ’;’, ’+’, ’-’, ’*’, ’/’ ’(’, ’)’, ’<’, ’>’, ’=<’, ’>=’, ’:=’, ’=’, ’/=’.

sep(';'). 
sep('+'). 
sep('-').
sep('*').
sep('/').
sep('(').
sep(')').
sep('<').
sep('>').
sep('=<').
sep('>=').
sep(':=').
sep('=').
sep('/=').

%sep(SEPARATOR) :- member(SEPARATOR,[';','+','-','*','/','(',')','<','>','=<','>=',':=','=','/=']).

readInput('end_of_file',_,[],[]):-
		!.

readInput(C1,C2,L,OUT) :-
		ws(C2),
		get_char(C3),readInput(C2,C3,T,OUT2),
		reduce_right(T,OUT2,OUT),L=[C1].
readInput(C1,C2,L,[OUTH|OUTT]) :-
		sep(C2),
		get_char(C3),readInput(C2,C3,T,OUT2),
		(	
			(atom_chars(S,[C1,C2]),sep(S),reduce_right(T,OUT2,OUTT),OUTH=sep(S),L=[]);
			(reduce_right(T,OUT2,OUTT),OUTH=sep(C2),L=[C1])
		).
readInput(C1,C2,[C1|T],OUT) :-
		get_char(C3),readInput(C2,C3,T,OUT).

reduce_right([_|[]],X,X).
reduce_right([_|T],IN,OUT) :- 
		atom_token(T,TOKEN),OUT=[TOKEN|IN].	

atom_token(L,Y) :-
			(id(L),atom_chars(T,L),Y=id(T));
			(int(L),atom_chars(T,L),Y=int(T));
			(atom_chars(T,L),key(T),Y=key(T)).

scanner(STR,Y) :-
		set_input(STR),
		get_char(C),
		readInput(' ',C,L,P),!,
		reduce_right(L,P,Y),!.
 
