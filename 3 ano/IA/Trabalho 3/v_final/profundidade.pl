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
