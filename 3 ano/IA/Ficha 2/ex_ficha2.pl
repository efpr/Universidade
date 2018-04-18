:-include('lib_ficha2.pl').

min(X,Y,X):-
	X<Y, !.
max(X,Y,X):-
	X>Y, !.
max(_,Y,Y).

capacidade(c1,3).
capacidade(c2,2).

estado_inicial(niveis(0,0)). 	% Estado Inicial
estado_final(niveis(_,1)).	% Estado Final
