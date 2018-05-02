% tablueir([num, num,...])
% num(pos(X,Y), Value)

% jogador(humano).
% jogador(ia).

% galo(jog(X), [num])

meio:- d1 ; d2.

estado_inicial(e(jog(x), Tab)):-
    gerar_tab(Tab1),
    diagonals(Tab1, Tab).

estado_terminal(e(jog(X), Tab)):-
    check_winner(X, Tab) ;
    check_tab(Tab).

utilidade(e(jog(x), Tab), +1):-
    check_winner(x,Tab).
utilidade(e(jog(o), Tab), -1):-
    check_winner(o,Tab).
utilidade(_, 0).

sucessor(e(jog(X), Tab), galo(Linha, Coluna), e(jog(X1), Tab1)):-
    member(num(pos(Linha, Coluna), _, n), Tab),
    mudar_peca(X, Tab, Linha,Coluna, Tab1),
    outro(X,X1).

gerar_tab(Tab):-
    gerar_tab(1,1,Tab).
gerar_tab(_,4,[]):- !.
gerar_tab(X,Y,Tab):-
    X == 4,
    Y1 is Y + 1,
    gerar_tab(1, Y1, Tab).
gerar_tab(X,Y,[num(pos(X,Y), dn, n)|Tab]):-
    X1 is X + 1,
    gerar_tab(X1, Y, Tab).

diagonals([],[]).
diagonals([num(pos(1,1), _,V)|Tab], [num(pos(1,1), d1, V)|Tab1]):-
    diagonals(Tab,Tab1).
diagonals([num(pos(3,1), _,V)|Tab], [num(pos(3,1), d2, V)|Tab1]):-
    diagonals(Tab,Tab1).
diagonals([num(pos(2,2), _,V)|Tab], [num(pos(2,2), meio, V)|Tab1]):-
    diagonals(Tab,Tab1).
diagonals([num(pos(1,3), _,V)|Tab], [num(pos(1,3), d2, V)|Tab1]):-
    diagonals(Tab,Tab1).
diagonals([num(pos(3,3), _,V)|Tab], [num(pos(3,3), d1, V)|Tab1]):-
    diagonals(Tab,Tab1).
diagonals([X|Tab], [X|Tab1]):-
    diagonals(Tab,Tab1).

check_tab([]).
check_tab([num(_, _, X)|Tab]):-
    X \= n,
    check_tab(Tab).

check_winner(J,Tab):-
    check_colum(J,Tab);
    check_lines(J,Tab) /*;
    check_diagn(J,Tab) */.

del_lista([],_, []).
del_lista([H|R], H, L):-
    del_lista(R, H, L).
del_lista([H|R], J, [H|L]):-
    del_lista(R, J, L).

check_mem(_,[],_,_).
check_mem(coluna, [H|R], X, Tab):-
  \+ member(num(pos(_,X), _, H), Tab),
  check_mem(coluna, R, X, Tab).
check_mem(linhas, [H|R], X, Tab):-
  \+ member(num(pos(X,_), _, H), Tab),
  check_mem(coluna, R, X, Tab).
check_mem(diagonais, [H|R], X, Tab):-
  \+ member(num(_, X, H), Tab),
  check_mem(coluna, R, X, Tab).

check_colum(J, Tab):-
    del_lista([x,o,n], J, Lista),!,
    (
    check_mem(coluna, Lista, 1, Tab);
    check_mem(coluna, Lista, 2, Tab);
    check_mem(coluna, Lista, 3, Tab)
    ).

check_lines(J, Tab):-
    del_lista([x,o,n], J, Lista),!,
    (
    check_mem(linhas, Lista, 1, Tab);
    check_mem(linhas, Lista, 2, Tab);
    check_mem(linhas, Lista, 3, Tab)
    ).

check_diagn(J, Tab):-
    del_lista([x,o,n], J, Lista),!,
    (
    check_mem(diagonais, Lista, d1, Tab);
    check_mem(diagonais, Lista, d2, Tab)
    ).

mudar_peca(_,[], _,_, []).
mudar_peca(J, [num(pos(Linha,Coluna), D , V)|Tab], Linha, Coluna, [num(pos(Linha,Coluna), D , J)|Tab1]):-
    V = n,
    mudar_peca(J, Tab, Linha, Coluna, Tab1).
mudar_peca(J, [X|Tab], Linha, Coluna, [X|Tab1]):-
    mudar_peca(J, Tab, Linha, Coluna, Tab1).

outro(x,o).
outro(o,x).

escreve(e(_,Tab)):-
    nl,t_print(Tab, 1),nl.

t_print([], _).
t_print([num(_, _, V)|Tab], C):-
    write(V),
    f_print(C, C1, Tab),
    t_print(Tab, C1).
f_print(C, C2, _):-
    C1 is C mod 3,
    C1 \= 0,
    C2 is C + 1,
    write(' | ').
f_print(_, _, []).
f_print(_, C1, _):-
    nl,writeln('--+---+--'),
    C1 is 1.
escreve_vencedor(e(jog(X), _,_)):-
    outro(X,Y),
    nl,nl,write("Vencedor Jogador: "), write(Y), nl.
