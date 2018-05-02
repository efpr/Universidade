%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ESTADO INICIAL DO PROBLEMA
%
estado_inicial(e(jog(x), Tab)):-
    gerar_tab(Tab).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ESTADO INICIAL DO PROBLEMA
%
estado_terminal(e(jog(X), Tab)):-
    other_player(X,X1), (
    check_winner(X1, Tab) ;
    check_tab(Tab)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Utilidade:
%       (+) -1: derrota
%       (+)  1: vito'ria
%       (+)  0: empate (impossivel de acontecer)
%
utilidade(e(jog(x), Tab), +1):-
    check_winner(x,Tab).
utilidade(e(jog(o), Tab), -1):-
    check_winner(o,Tab).
utilidade(_, 0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SUCESSOR DO PROBLEMA
%
sucessor(e(jog(X), Tab), galo(Linha, Coluna), e(jog(X1), Tab1)):-
    member(num(pos(Linha, Coluna), n), Tab),
    mudar_peca(X, Tab, Linha,Coluna, Tab1),
    other_player(X,X1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%---------------------------------------------------------------------------------%
%       Predicados Auxiliares
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Gera o tablueiro do galo, em que fica preenchido com n
%
gerar_tab(Tab):-
    gerar_tab(1,1,Tab).
gerar_tab(_,4,[]):- !.
gerar_tab(X,Y,Tab):-
    X == 4,
    Y1 is Y + 1,
    gerar_tab(1, Y1, Tab).
gerar_tab(X,Y,[num(pos(X,Y), n)|Tab]):-
    X1 is X + 1,
    gerar_tab(X1, Y, Tab).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Verifica se ainda existem posições a jogar. Retorna true no caso de não haver
% peças a retirar
%
check_tab([]).
check_tab([num(_, X)|Tab]):-
    X \= n,
    check_tab(Tab).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Verifica se já exite um vencedor
%
check_winner(J,Tab):-
    member(num(pos(1,1),X1), Tab),
    member(num(pos(2,1),X2), Tab),
    member(num(pos(3,1),X3), Tab),
    member(num(pos(1,2),X4), Tab),
    member(num(pos(2,2),X5), Tab),
    member(num(pos(3,2),X6), Tab),
    member(num(pos(1,3),X7), Tab),
    member(num(pos(2,3),X8), Tab),
    member(num(pos(3,3),X9), Tab),
    (
    iguais(X1, X2, X3, J);
    iguais(X4, X5, X6, J);
    iguais(X7, X8, X9, J);
    iguais(X1, X4, X7, J);
    iguais(X2, X5, X8, J);
    iguais(X3, X6, X9, J);
    iguais(X1, X5, X9, J);
    iguais(X3, X5, X7, J)
    ).

iguais(X, X, X, X).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Coloca a peça a mudar no tabuleiro
%
mudar_peca(_,[], _,_, []).
mudar_peca(J, [num(pos(Linha,Coluna), V)|Tab], Linha, Coluna, [num(pos(Linha,Coluna), J)|Tab1]):-
    V = n,
    mudar_peca(J, Tab, Linha, Coluna, Tab1).
mudar_peca(J, [X|Tab], Linha, Coluna, [X|Tab1]):-
    mudar_peca(J, Tab, Linha, Coluna, Tab1).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Troca de Jogador
%
other_player(x,o).
other_player(o,x).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% PRINT DO PROBLEMA
%
escreve(e(_,Tab)):-
    nl,t_print(Tab, 1),nl.

t_print([], _).
t_print([num(_, V)|Tab], C):-
    V \= n,
    write(V),
    f_print(C, C1, Tab),
    t_print(Tab, C1).
t_print([num(_, _)|Tab], C):-
    write(' '),
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
%---------------------------------------------------------------------------------%
