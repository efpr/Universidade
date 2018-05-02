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
