heuristica(estado(
    robo(pos((X,Y)), bateria(_)),
    sala(_, sujas(Dirt), carregador(Charger)
    )), Val):-
        calcula_distancia((X,Y), Dirt, Charger, V).

calcula_distancia((X,Y), [], [(X1,Y1)|_], Val):-
    dif(X,X1, M),
    dif(Y,Y1, N),
    Val is M + N.
calcula_distancia((X,Y), Lista, _, Val):-
    calcula_distancia((X,Y), Lista, Val).


calcula_distancia(_, [], _).

dif(A,B,C):- A>B, C is A-B.
dif(A,B,C):- A=<B, C is B-A.
