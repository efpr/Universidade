/*
    # Pressupostos para a representação dos estados do jogo:

    <nenhum>

    # Predicados que definem um jogo:

    estado_inicial(Estado).
    estado_terminal(Estado).
    sucessor(Estado, Opção, EstadoSucessor).
    utilidade(EstadoTerminal, Utilidade).

    opcional: escrever(Estado)

*/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Minimax (cf. aima)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
minimax(E, terminal) :-
    estado_terminal(E), !.
%
minimax(E, MelhorAcao) :-
    findall(
        i(V, A),
        (
            sucessor(E, A, S),
            valor_min_mm(S, V)
        ),
        ValoresAcoes),
    arg_maxvalor(ValoresAcoes, i(_, MelhorAcao)).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
valor_max_mm(Estado, Valor) :-
    estado_terminal(Estado), !,
    utilidade(Estado, Valor).
%
valor_max_mm(Estado, Valor) :-
    %
    %   Determinar os valores_min dos sucessores.
    %
    findall(
        V,
        (
            sucessor(Estado, _, S),
            valor_min_mm(S, V)
        ),
        Valores),
    %
    %   Escolher o maior valor_min.
    %
    maximo(Valores, Valor).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
valor_min_mm(Estado, Valor) :-
    estado_terminal(Estado), !,
    utilidade(Estado, Valor).
%
valor_min_mm(Estado, Valor) :-
    %
    %   Determinar os valores_max dos sucessores
    %
    findall(
        V,
        (
            sucessor(Estado, _, S),
            valor_max_mm(S, V)
        ),
        Valores),
    %
    %   Escolher o menor valor_max.
    %
    minimo(Valores, Valor).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Minimax Profundidade 3
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
profundidade(E, terminal) :-
    estado_terminal(E), !.
%
profundidade(E, MelhorAcao) :-
    findall(
        i(V, A),
        (
            sucessor(E, A, S),
            valor_min_pf(S, V, 3)
        ),
        ValoresAcoes),
    arg_maxvalor(ValoresAcoes, i(_, MelhorAcao)).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
valor_max_pf(Estado, Valor, _) :-
    estado_terminal(Estado), !,
    utilidade(Estado, Valor).
%
valor_max_pf(_,0,0).
valor_max_pf(Estado, Valor, Cont) :-
    %
    %   Determinar os valores_min dos sucessores.
    %
    Cont1 is Cont - 1,
    findall(
        V,
        (
            sucessor(Estado, _, S),
            valor_min_pf(S, V, Cont1)
        ),
        Valores),
    %
    %   Escolher o maior valor_min.
    %
    maximo(Valores, Valor).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
valor_min_pf(Estado, Valor,_) :-
    estado_terminal(Estado), !,
    utilidade(Estado, Valor).
%
valor_min_pf(_,0,0).
valor_min_pf(Estado, Valor, Cont) :-
    %
    %   Determinar os valores_max dos sucessores
    %
    Cont1 is Cont - 1,
    findall(
        V,
        (
            sucessor(Estado, _, S),
            valor_max_pf(S, V, Cont1)
        ),
        Valores),
    %
    %   Escolher o menor valor_max.
    %
    minimo(Valores, Valor).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Alfa-Beta
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
/*
alfabeta(E, terminal) :-
    estado_terminal(E), !.
%
alfabeta(E, MelhorAcao) :-
    findall(
        i(V, A),
        (
            sucessor(E, A, S),
            valor_min_ab(S, V)
        ),
        ValoresAcoes),
    arg_maxvalor(ValoresAcoes, i(_, MelhorAcao)).

valor_max_ab(Estado, Valor):-
    estado_terminal(Estado), !,
    utilidade(Estado, Valor).

valor_max_ab(Estado, Alpha, Beta):-
    findall(
        V,
        (
            sucessor(Estado,_,S),
            valor_min_ab(Estado, Alpha, Beta)
        ),
        Valores
    )
    */
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Predicados auxiliares
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
minimo([A | R], Minimo) :- minimo(R, A, Minimo).
%
minimo([], Minimo, Minimo).
%
minimo([A | R], X, Minimo) :-
    A > X, !,
    minimo(R, X, Minimo).
%
minimo([A | R], _, Minimo) :-
    minimo(R, A, Minimo).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
maximo([A | R], Maximo) :- maximo(R, A, Maximo).
%
maximo([], Maximo, Maximo).
%
maximo([A | R], X, Maximo) :-
    A < X, !,
    maximo(R, X, Maximo).
%
maximo([A | R], _, Maximo) :-
    maximo(R, A, Maximo).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
inverte(L, LI) :- inverte(L, LI, []).
%
inverte([], L, L).
%
inverte([A | R], X, Acc) :-
    inverte(R, X, [A | Acc]).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
min(neg_inf, _, neg_inf) :- !.
min(pos_inf, A, A) :- !.
%
min(_, neg_inf, neg_inf) :- !.
min(A, pos_inf, A) :- !.
%
min(A, B, A) :- number(A), number(B), B > A, !.
min(_, B, B).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   max(A,B,C) <=> C = max(A,B)
%
max(pos_inf, _, pos_inf) :- !.
max(neg_inf, A, A) :- !.
%
max(_, pos_inf, pos_inf) :- !.
max(A, neg_inf, A) :- !.
%
max(A, B, A) :- number(A), number(B), B < A, !.
max(_, B, B).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
arg_maxvalor([A], A).
%
arg_maxvalor([i(V, _) | Resto], i(V1, A1)) :-
    arg_maxvalor(Resto, i(V1, A1)),
    V1 > V, !.
%
arg_maxvalor([X | _], X).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
jogar(Jogo, A, B) :-
    consult(Jogo),
    estado_inicial(E),
    jogada(E, A, B).

jogada(E, _, _) :-
    estado_terminal(E),
    escreve(E),
    nl, write('** FIM **'), nl.

jogada(E, A, B) :-
    nl, nl, write('** Novo Turno **'), nl,
    escreve(E),
    decidir(A, E, J),
    sucessor(E, J, S),
    jogada(S, B, A).

decidir(humano, _, J) :-
    nl, write("Humano: "),
    read(J), nl.

decidir(minimax, E, J) :-
    nl, write("Minimax... "), nl,
    minimax(E, J),
    write(J), nl.

decidir(profundidade, E, J) :-
    nl, write("Profundidade... "), nl,
    profundidade(E, J),
    write(J), nl.

decidir(alfabeta, E, J) :-
    nl, write("Alfa-Beta... "), nl,
    alfabeta(E, J),
    write(J), nl.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Teste simples sobre um jogo.
%
teste(Jogo) :-
    consult(Jogo),
    estado_inicial(E),
    time(minimax(E, P_mm)),
    /*time(alfabeta(E, P_ab)),*/
    time(profundidade(E, P_pf)),
    write('Minimax:  '), write(P_mm), nl,
    /*write('Alfabeta: '), write(P_ab), nl,*/
    write('Alfabeta: '), write(P_pf), nl.
