% Author: Patrycja Paradowska
% 14 maja 2020r., Lista 7. Prolog, Zadanie 1.

% Napisac predykat merge(IN1, IN1, OUT) scalajacy dwa niemalejace strumienie
% liczb IN1 i IN2 w jeden niemalejacy strumien liczb OUT2.

merge(IN1, IN2, OUT) :-
   freeze(IN1, 
      freeze(IN2, 
         (IN1 = [H1 | T1] ->
            (
               (IN2 = [H2 | T2] ->
                  (
                     (H1 =< H2 ->
                        OUT = [H1 | OUT2],
                        merge(T1, IN2, OUT2);
                        OUT = [H2 | OUT2],
                        merge(IN1, T2, OUT2)
                     )
                  );
                  OUT = IN1
               )
            );
            (
               (IN2 = [H2 | T2] ->
                  OUT = IN2;
                  OUT = []
               )
            )
         )
      )
   ), !.
