% Author: Patrycja Paradowska
% 8 kwietnia 2020r., Lista 4. Prolog, Zadanie 2. Napisz predykat rybki(Kto), ktory znajduje odp zagadke Einsteina - Kto hoduje rybki?


% Mamy okreslone wskazowki:
% 1. Norweg zamieszkuje pierwszy dom.
% 2. Anglik mieszka w czerwonym domu.
% 3. Zielony dom znajduje się bezposrednio po lewej stronie domu bialego.
% 4. Dunczyk pija herbatke.
% 5. Palacz papierosow light mieszka obok hodowcy kotow.
% 6. Mieszkaniec zoltego domu pali cygara.
% 7. Niemiec pali fajke.
% 8. Mieszkaniec srodkowego domu pija mleko.
% 9. Palacz papierosów light ma sasiada, ktory pija wode.
% 10. Palacz papierosow bez filtra hoduje ptaki.
% 11. Szwed hoduje psy.
% 12. Norweg mieszka obok niebieskiego domu.
% 13. Hodowca koni mieszka obok zoltego domu.
% 14. Palacz mentolowych pija piwo.
% 15. W zielonym domu pija sie kawe.


rybki(Kto):-
	Domy=[[norweg,_,_,_,_],[_,niebieski,_,_,_],[_,_,mleko,_,_],_,_],
	member([anglik,czerwony,_,_,_],Domy),
	lewy([_,zielony,kawa,_,_],[_,bialy,_,_,_],Domy),
	member([dunczyk,_,herbata,_,_],Domy),
	obok([_,_,_,light,_],[_,_,_,_,koty],Domy),
	member([_,zolty,_,cygara,_],Domy),
	member([niemiec,_,_,fajka,_],Domy),
	obok([_,_,_,light,_],[_,_,woda,_,_],Domy),
	member([_,_,_,bez_filtra,ptaki],Domy),
	member([szwed,_,_,_,psy],Domy),
	obok([_,_,_,_,konie],[_,zolty,_,_,_],Domy),
	member([_,_,piwo,mentolowe,_],Domy),
	member([Kto,_,_,_,rybki],Domy).

lewy(X,Y,List):-append(_,[X,Y|_],List).

obok(X,Y,Lista):-
	lewy(X,Y,Lista);
	lewy(Y,X,Lista).
