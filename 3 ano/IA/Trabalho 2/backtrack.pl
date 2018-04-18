p:- estado_inicial(E0), back(E0,A), esc(A).

back(e([],A),A).
back(E,Sol):- sucessor(E,E1), ve_restricoes(E1), pr(E1, 1, 1),
                          back(E1,Sol).

sucessor(e([v(D,N,V)|R],E),e(R,E)):-
    member(V,D),
    inserir(v(D,N,V), E).

esc(A):-
    pr(A, 1, 1).
