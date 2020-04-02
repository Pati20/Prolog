% Author: Patrycja Paradowska
% 26 marca 2020r., Lista 3. Prolog, Zadanie 3. 


insert_o(X, Xs, [X|Xs]).
insert_o(X, [Y,Z|Ys],[Y,Z|Zs]):-
  insert_o(X,Ys,Zs).

insert_e(X,[Y|Ys],[Y,X|Ys]).
insert_e(X,[Y,Z|Ys],[Y,Z|Zs]):-
  insert_e(X,Ys,Zs).

even_permutation([],[]).
even_permutation([X|Xs], Ys):-
  even_permutation(Xs,Zs),
  insert_o(X,Zs,Ys).

even_permutation([X|Xs],Ys):-
  odd_permutation(Xs,Zs),
  insert_e(X,Zs,Ys).

odd_permutation([X|Xs],Ys):-
  odd_permutation(Xs,Zs),
  insert_o(X,Zs,Ys).

odd_permutation([X|Xs],Ys):-
  even_permutation(Xs,Zs),
  insert_e(X, Zs, Ys).
