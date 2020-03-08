% Author: Patrycja Paradowska
% 6 marca 2020r., Lista 1. Prolog, Zadanie 2.

% on(Block1, Block2) czyli Block1 lezy na Block2
on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).
on(block5, block6).
on(block6, block7).

above(Block1, Block2) :-
	on(Block1, BlockZ),
	above(BlockZ, Block2).

above(Block1, Block2) :-
	on(Block1, Block2).
