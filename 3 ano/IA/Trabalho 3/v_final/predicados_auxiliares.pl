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
