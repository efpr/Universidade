carga(10).
carga(9).
...
carga(1).

max_carga(10).

dist(2,1,9).
dist(1,2,9).

dist(2,3,5).
dist(3,2,5).

dist(1,3,14).
dist(3,1,14).

estar(1).
estar(2).
estar(3).

acao(
    andar,
    [carga(N), estar(S1)],
    [carga(N1), estar(S2)],
    [carga(N), estar(S1)]
    ):-
        dist(S1,S2,L),
        N1 is N - L.

acao(
    carregar,
    [carga(N)],
    [carga(N1)],
    [carga(N)]
    ):-
        max_carga(N1).
