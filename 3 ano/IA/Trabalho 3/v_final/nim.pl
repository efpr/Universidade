%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ESTADO INICIAL DO PROBLEMA
%
estado_inicial(e(jog(ia), Tab)):-
    gerar_tab(1, 5, Tab).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ESTADO INICIAL DO PROBLEMA
%
estado_terminal(e(_, Tab)):-
    check_tab(Tab).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Utilidade:
%       (+) -1: derrota
%       (+)  1: vito'ria
%       (+)  0: empate (impossivel de acontecer)
%
utilidade(e(jog(ia), Tab), -1):-
    check_tab(Tab).
utilidade(e(jog(humano), Tab), +1):-
    check_tab(Tab).
utilidade(_, 0).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SUCESSOR DO PROBLEMA
%
sucessor(e(jog(X), Tab), menos(Linha, N), e(jog(X1), Tab1)):-
    member(linha(Linha,_), Tab), % gera a linha a esscolher
    retirar_linha(Tab, Linha, N, Tab1),
    outro(X,X1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%---------------------------------------------------------------------------------%
%       Predicados Auxiliares
%---------------------------------------------------------------------------------%


%---------------------------------------------------------------------------------%
%
% Gera as linhas do problema, em que o núemro de peças é igual ao número da linha
%
gerar_tab(X, X,[]).
gerar_tab(X, Y, [linha(X, X)|Tab]):-
    X1 is X + 1,
    gerar_tab(X1, Y, Tab).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Verifica se ainda existem peças a retirar. Retorna true no caso de não haver
% peças a retirar
%
check_tab([]).
check_tab([linha(_,X)|Tab]):-
    X = 0,
    check_tab(Tab).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Gera os números que são possiveis de retirar na linha
%
gerar_lista(0,[]).
gerar_lista(V, [V|L]):-
    V1 is V - 1,
    gerar_lista(V1,L).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Retira o peças da linha X
%
retirar_linha([],_,_,[]).
retirar_linha([linha(Linha, V)|Tab], Linha, N, [linha(Linha, X)|Tab1]):-
    gerar_lista(V, Lista), !, % gera o numero de casas a tirar
    member(N, Lista),
    X is V - N,
    X >= 0,
    retirar_linha(Tab,Linha,N, Tab1).

retirar_linha([H|Tab], Linha, N, [H|Tab1]):-
    retirar_linha(Tab, Linha, N, Tab1).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% Troca de Jogador
%
outro(ia, humano).
outro(humano, ia).
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
%
% PRINT DO PROBLEMA
%
escreve(e(_,Tab)):-
    t_print(Tab).

t_print([]).
t_print([linha(X,N)| Tab]):-
    nl,write('(linha '), write(X), write(') '),
    n_print(N),
    t_print(Tab).

n_print(0).
n_print(N):-
    write(' | '),
    N1 is N - 1,
    n_print(N1).
%---------------------------------------------------------------------------------%
