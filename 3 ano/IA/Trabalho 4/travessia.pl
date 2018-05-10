
% margem(missionarios(), canibais(), lado).

% barco(missionario(), canibais(), lado).

inicio([margem(missionarios(3), canibais(2), esquerda),
         barco(missionarios(0), canibais(0), esquerda),
         margem(missionarios(0), canibais(0), direita)]).

 % objetivo([margem(missionarios(3), canibais(3), direita)]).

objetivo([margem(missionarios(2), canibais(2), esquerda),
         barco(missionarios(0), canibais(0), direita),
         margem(missionarios(1), canibais(0), direita)]).

max_margem(0).
max_margem(1).
max_margem(2).
max_margem(3).

max_barco(0).
max_barco(1).
max_barco(2).

margem_actual(esquerda).
margem_actual(direita).


acao(
    embarcar_missionario,
    [margem(missionarios(X), canibais(Y), Margem),
    barco(missionarios(X1), canibais(Y1), Margem)],

    [margem(missionarios(X2),canibais(Y),Margem),
    barco(missionarios(X3), canibais(Y1), Margem)],

    [margem(missionarios(X), canibais(Y), Margem),
    barco(missionarios(X1), canibais(Y1), Margem)]
    ):-
        max_margem(X), max_margem(Y), margem_actual(Margem),
        max_barco(X1), max_barco(Y1),
        T is X1+Y1, T < 2,
        X2 is X-1, X3 is X1+1,
        Y =< X2.

acao(
    embarcar_canibais,
    [margem(missionarios(X), canibais(Y), Margem),
    barco(missionarios(X1), canibais(Y1), Margem)],

    [margem(missionarios(X),canibais(Y2),Margem),
    barco(missionarios(X1), canibais(Y3), Margem)],

    [margem(missionarios(X), canibais(Y), Margem),
    barco(missionarios(X1), canibais(Y1), Margem)]
    ):-
        max_margem(X), max_margem(Y), margem_actual(Margem),
        max_barco(X1), max_barco(Y1),
        T is X1+Y1, T < 2,
        Y2 is Y-1, Y3 is Y1+1,
        Y2 =< X.


acao(
    travessia_de_margem,
    [barco(missionarios(X), canibais(Y), Margem)],

    [barco(missionarios(X), canibais(Y), Margem1)],

    [barco(missionarios(X), canibais(Y), Margem)]
    ):-
        margem_actual(Margem), margem_actual(Margem1),
        Margem \= Margem1,
        max_barco(X), max_barco(Y),
        T is X+Y, T > 0.


acao(
    desembarcar_missionario,
    [barco(missionarios(X), canibais(Y), Margem),
    margem(missionarios(X1), canibais(Y1), Margem)],

    [barco(missionarios(X2), canibais(Y), Margem),
    margem(missionarios(X3), canibais(Y1), Margem)],

    [barco(missionarios(X), canibais(Y), Margem),
    margem(missionarios(X1), canibais(Y1), Margem)]
    ):-
      max_barco(X), max_barco(Y), margem_actual(Margem),
      X > 0,
      max_margem(X1), max_margem(Y1),
      X2 is X-1, X3 is X1+1,
      X3 =< Y1.

acao(
    desembarcar_canibais,
    [barco(missionarios(X), canibais(Y), Margem),
    margem(missionarios(X1), canibais(Y1), Margem)],

    [barco(missionarios(X), canibais(Y2), Margem),
    margem(missionarios(X1), canibais(Y3), Margem)],

    [barco(missionarios(X), canibais(Y), Margem),
    margem(missionarios(X1), canibais(Y1), Margem)]
    ):-
      max_barco(X), max_barco(Y), margem_actual(Margem),
      Y > 0,
      max_margem(X1), max_margem(Y1),
      Y2 is Y-1, Y3 is Y1+1,
      Y3 =< X1.
