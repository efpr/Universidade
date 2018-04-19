%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ESTADO INICIAL DO PROBLEMA
%
estado_inicial(e(NonAffect, Affect)) :-
    gerar_num(11, NonAffect1),								% inicializar as variaveis nao afetadas
    num_iniciais2(e(NonAffect1, []), e(NonAffect, Affect)).	% inicializar os valores iniciais do sudoku
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iniciar as variaveis nao afetadas
% cada variavel do tabuleiro sera v(Dominio, pos(Quadrante, CoordenadaX, CoordenadaY), Valor)
gerar_num(100,_):- !.
gerar_num(Q, L):-
    X is Q mod 10,
    X = 0,
    Q1 is Q + 1,
    gerar_num(Q1, L).
gerar_num(Q, [H|T]):-
    X is Q mod 10,
    Y is Q // 10,
    D = [1,2,3,4,5,6,7,8,9],
    quadrante(X,Y,Qd),
    H = v(D, pos(Qd,X,Y), _),
    Q1 is Q + 1,
    gerar_num(Q1, T).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% atraves da posição atribuir o quadrante do tabulerio respetivo
quadrante(X,Y, Q):-
    entre(1,1,X,Y),
    Q = q1.
quadrante(X,Y, Q):-
    entre(4,1,X,Y),
    Q = q2.
quadrante(X,Y, Q):-
    entre(7,1,X,Y),
    Q = q3.
quadrante(X,Y, Q):-
    entre(1,4,X,Y),
    Q = q4.
quadrante(X,Y, Q):-
    entre(4,4,X,Y),
    Q = q5.
quadrante(X,Y, Q):-
    entre(7,4,X,Y),
    Q = q6.
quadrante(X,Y, Q):-
    entre(1,7,X,Y),
    Q = q7.
quadrante(X,Y, Q):-
    entre(4,7,X,Y),
    Q = q8.
quadrante(X,Y, Q):-
    entre(7,7,X,Y),
    Q = q9.

entre(X1,Y1,X2,Y2):-
    X2 >= X1,
    X2 =< X1 + 2,
    Y2 >= Y1,
    Y2 =< Y1 + 2.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% inicializa as variaveis consoante o estado inicial do sudoku
inicializar(v(D,P,V), e(NonAffect, Affect), e(NonAffect1, [v(D,P,V)|Affect])):-
    delete(NonAffect, v(_,P,_), NonAffect1).				% muda das nao afetadas para afetadas

num_iniciais(E1, Ef):-
    D = [1,2,3,4,5,6,7,8,9],
    inicializar(v(D, pos(q1,3,1), 5), E1, E2),
    inicializar(v(D, pos(q2,5,1), 8), E2, E3),
    inicializar(v(D, pos(q3,7,1), 7), E3, E4),
    inicializar(v(D, pos(q1,1,2), 7), E4, E5),
    inicializar(v(D, pos(q2,4,2), 2), E5, E6),
    inicializar(v(D, pos(q2,6,2), 4), E6, E7),
    inicializar(v(D, pos(q3,9,2), 5), E7, E8),
    inicializar(v(D, pos(q1,1,3), 3), E8, E9),
    inicializar(v(D, pos(q1,2,3), 2), E9, E10),
    inicializar(v(D, pos(q3,8,3), 8), E10, E11),
    inicializar(v(D, pos(q3,9,3), 4), E11, E12),
    inicializar(v(D, pos(q4,2,4), 6), E12, E13),
    inicializar(v(D, pos(q5,4,4), 1), E13, E14),
    inicializar(v(D, pos(q5,6,4), 5), E14, E15),
    inicializar(v(D, pos(q6,8,4), 4), E15, E16),
    inicializar(v(D, pos(q4,3,5), 8), E16, E17),
    inicializar(v(D, pos(q6,7,5), 5), E17, E18),
    inicializar(v(D, pos(q4,2,6), 7), E18, E19),
    inicializar(v(D, pos(q5,4,6), 8), E19, E20),
    inicializar(v(D, pos(q5,6,6), 3), E20, E21),
    inicializar(v(D, pos(q6,8,6), 1), E21, E22),
    inicializar(v(D, pos(q7,1,7), 4), E22, E23),
    inicializar(v(D, pos(q7,2,7), 5), E23, E24),
    inicializar(v(D, pos(q9,8,7), 9), E24, E25),
    inicializar(v(D, pos(q9,9,7), 1), E25, E26),
    inicializar(v(D, pos(q7,1,8), 6), E26, E27),
    inicializar(v(D, pos(q8,4,8), 5), E27, E28),
    inicializar(v(D, pos(q8,6,8), 8), E28, E29),
    inicializar(v(D, pos(q9,9,8), 7), E29, E30),
    inicializar(v(D, pos(q7,3,9), 3), E30, E31),
    inicializar(v(D, pos(q8,5,9), 1), E31, E32),
    inicializar(v(D, pos(q9,7,9), 6), E32, Ef).

num_iniciais2(E1, Ef):-
    D = [1,2,3,4,5,6,7,8,9],
    inicializar(v(D, pos(q1,3,1), 8), E1, E2),
    inicializar(v(D, pos(q1,2,2), 4), E2, E3),
    inicializar(v(D, pos(q2,4,1), 1), E3, E4),
    inicializar(v(D, pos(q2,5,1), 6), E4, E5),
    inicializar(v(D, pos(q2,6,1), 4), E5, E6),
    inicializar(v(D, pos(q2,6,2), 3), E6, E7),
    inicializar(v(D, pos(q2,4,3), 7), E7, E8),
    inicializar(v(D, pos(q2,5,3), 5), E8, E9),
    inicializar(v(D, pos(q3,7,1), 7), E9, E10),
    inicializar(v(D, pos(q3,9,1), 9), E10, E11),
    inicializar(v(D, pos(q3,7,2), 1), E11, E12),
    inicializar(v(D, pos(q3,7,3), 3), E12, E13),
    inicializar(v(D, pos(q3,8,3), 2), E13, E14),
    inicializar(v(D, pos(q3,9,3), 4), E14, E15),
    inicializar(v(D, pos(q4,1,4), 1), E15, E16),
    inicializar(v(D, pos(q4,2,4), 8), E16, E17),
    inicializar(v(D, pos(q4,3,4), 3), E17, E18),
    inicializar(v(D, pos(q4,1,5), 2), E18, E19),
    inicializar(v(D, pos(q4,3,5), 9), E19, E20),
    inicializar(v(D, pos(q4,3,6), 5), E20, E22),
    inicializar(v(D, pos(q5,4,4), 5), E22, E23),
    inicializar(v(D, pos(q5,5,4), 4), E23, E24),
    inicializar(v(D, pos(q5,4,5), 8), E24, E25),
    inicializar(v(D, pos(q5,5,5), 7), E25, E26),
    inicializar(v(D, pos(q5,6,5), 1), E26, E27),
    inicializar(v(D, pos(q5,6,6), 6), E27, E28),
    inicializar(v(D, pos(q6,7,5), 4), E28, E29),
    inicializar(v(D, pos(q6,8,6), 9), E29, E30),
    inicializar(v(D, pos(q7,2,7), 5), E30, E31),
    inicializar(v(D, pos(q7,3,7), 1), E31, E32),
    inicializar(v(D, pos(q7,2,8), 3), E32, E33),
    inicializar(v(D, pos(q7,3,9), 4), E33, E34),
    inicializar(v(D, pos(q8,6,8), 5), E34, E35),
    inicializar(v(D, pos(q8,6,9), 2), E35, E36),
    inicializar(v(D, pos(q9,7,7), 9), E36, E37),
    inicializar(v(D, pos(q9,8,7), 8), E37, E38),
    inicializar(v(D, pos(q9,7,8), 6), E38, E39),
    inicializar(v(D, pos(q9,8,9), 1), E39, Ef).

num_iniciais3(E1, Ef):-
    D = [1,2,3,4,5,6,7,8,9],
    inicializar(v(D, pos(q1,2,1), 2), E1, E2),
    inicializar(v(D, pos(q1,3,1), 1), E2, E3),
    inicializar(v(D, pos(q1,2,2), 8), E3, E4),
    inicializar(v(D, pos(q1,3,2), 3), E4, E5),
    inicializar(v(D, pos(q1,1,3), 5), E5, E6),
    inicializar(v(D, pos(q1,2,3), 7), E6, E7),
    inicializar(v(D, pos(q2,5,2), 1), E7, E8),
    inicializar(v(D, pos(q2,4,3), 4), E8, E9),
    inicializar(v(D, pos(q3,8,1), 7), E9, E10),
    inicializar(v(D, pos(q3,7,2), 6), E10, E11),
    inicializar(v(D, pos(q3,8,3), 8), E11, E12),
    inicializar(v(D, pos(q4,1,4), 7), E12, E13),
    inicializar(v(D, pos(q4,1,5), 1), E13, E14),
    inicializar(v(D, pos(q5,6,4), 1), E14, E15),
    inicializar(v(D, pos(q5,4,5), 7), E15, E16),
    inicializar(v(D, pos(q5,6,5), 2), E16, E17),
    inicializar(v(D, pos(q5,4,6), 9), E17, E18),
    inicializar(v(D, pos(q6,9,5), 5), E18, E19),
    inicializar(v(D, pos(q6,9,6), 1), E19, E20),
    inicializar(v(D, pos(q7,2,7), 6), E20, E22),
    inicializar(v(D, pos(q7,3,8), 7), E22, E23),
    inicializar(v(D, pos(q7,2,9), 4), E23, E24),
    inicializar(v(D, pos(q8,6,7), 4), E24, E25),
    inicializar(v(D, pos(q8,5,8), 3), E25, E26),
    inicializar(v(D, pos(q9,8,7), 1), E26, E27),
    inicializar(v(D, pos(q9,9,7), 7), E27, E28),
    inicializar(v(D, pos(q9,7,8), 5), E28, E29),
    inicializar(v(D, pos(q9,8,8), 2), E29, E30),
    inicializar(v(D, pos(q9,7,9), 9), E30, E31),
    inicializar(v(D, pos(q9,8,9), 3), E31, Ef).

num_iniciais4(E1, Ef):-
    D = [1,2,3,4,5,6,7,8,9],
    inicializar(v(D, pos(q1,2,2), 7), E1, E2),
    inicializar(v(D, pos(q1,3,2), 9), E2, E3),
    inicializar(v(D, pos(q1,2,3), 1), E3, E4),
    inicializar(v(D, pos(q2,6,1), 5), E4, E5),
    inicializar(v(D, pos(q2,6,2), 8), E5, E6),
    inicializar(v(D, pos(q2,4,3), 9), E6, E7),
    inicializar(v(D, pos(q3,7,1), 7), E7, E8),
    inicializar(v(D, pos(q3,9,2), 3), E8, E9),
    inicializar(v(D, pos(q3,8,3), 4), E9, E10),
    inicializar(v(D, pos(q4,2,4), 4), E10, E11),
    inicializar(v(D, pos(q4,3,5), 5), E11, E12),
    inicializar(v(D, pos(q4,2,6), 3), E12, E13),
    inicializar(v(D, pos(q5,5,4), 6), E13, E14),
    inicializar(v(D, pos(q5,5,6), 1), E14, E15),
    inicializar(v(D, pos(q6,8,4), 9), E15, E16),
    inicializar(v(D, pos(q6,7,5), 2), E16, E17),
    inicializar(v(D, pos(q6,8,6), 5), E17, E18),
    inicializar(v(D, pos(q7,2,7), 5), E18, E19),
    inicializar(v(D, pos(q7,1,8), 3), E19, E20),
    inicializar(v(D, pos(q7,3,9), 1), E20, E22),
    inicializar(v(D, pos(q8,6,7), 1), E22, E23),
    inicializar(v(D, pos(q8,4,8), 2), E23, E24),
    inicializar(v(D, pos(q8,4,9), 4), E24, E25),
    inicializar(v(D, pos(q9,8,7), 6), E25, E26),
    inicializar(v(D, pos(q9,7,8), 4), E26, E27),
    inicializar(v(D, pos(q9,8,8), 8), E27, Ef).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% verifica se numa lista todos os valores sao diferentes
list_dif([]).
list_dif([H|R]):-
    \+ member(H,R),
    list_dif(R).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% verificar todas as restrições
ve_restricoes(e(_,L)):-
    ve_linha(L),
    ve_coluna(L),
    ve_quadrante(L).

ve_linha([v(_,pos(_,_,Y),V)|L]):-
    %findall(V1, member(v(D,pos(_,_,Y),V1), L), Lista),		% colocar todos os valores de uma
    %list_dif([V|Lista]).									% linha numa lista
    \+ member(v(_,pos(_,_,Y),V), L).

ve_coluna([v(_,pos(_,X,_),V)|L]):-
    %findall(V1, member(v(D,pos(_,X,_),V1), L), Lista),		% colocar todos os valores de uma
    %list_dif([V|Lista]).									% coluna numa lista
    \+ member(v(_,pos(_,X,_),V), L).

ve_quadrante([v(_,pos(Qd,_,_),V)|L]):-
    %findall(V1, member(v(D,pos(Qd,_,_),V1), L), Lista),		% colocar todos os valores de um
    %list_dif([V|Lista]).									% quadrante numa lista
    \+ member(v(_,pos(Qd,_,_), V), L).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Algoritmo forward check
%
% Atualizar dominios de variaveis nao afetadas por linhas colunas e quadrantes
forwarding(v(_, pos(Q,X,Y), V), NonAffect, NonAffect1):-
    de_linha(Y, V, NonAffect, NonAffect1),
    de_coluna(X, V, NonAffect, NonAffect1),
    de_quadrante(Q, V, NonAffect, NonAffect1).
%
de_linha(_,_,[],_).
de_linha(Y, V, NonAffect, NonAffect1):-
    findall(v(D1,pos(Q1,X1,Y), V1), member(v(D1,pos(Q1,X1,Y),V1), NonAffect), Lista),
    remove(V,Lista, Lista2),
    deleteAll(NonAffect,Lista, Lista3),
    append(Lista3, Lista2, NonAffect1).
%
de_coluna(_,_,[],_).
de_coluna(X, V, NonAffect, NonAffect1):-
    findall(v(D1,pos(Q1,X,Y1), V1), member(v(D1,pos(Q1,X,Y1),V1), NonAffect), Lista),
    remove(V,Lista, Lista2),
    deleteAll(NonAffect,Lista, Lista3),
    append(Lista3, Lista2, NonAffect1).
%
de_quadrante(_,_,[],_).
de_quadrante(Q, V, NonAffect, NonAffect1):-
    findall(v(D1,pos(Q,X1,Y1), V1), member(v(D1,pos(Q,X1,Y1),V1), NonAffect), Lista),
    remove(V,Lista, Lista2),
    deleteAll(NonAffect,Lista, Lista3),
    append(Lista3, Lista2, NonAffect1).

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Retira uma lista2 de uma lista1 para uma lista3
% deleteAll(lista1, lista2, lista3)
deleteAll(A,[], A).
deleteAll(Tail, [L2|R],T):-
    delete(Tail, L2, Result),
    deleteAll(Result, R, T).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% remove do dominio de uma variavel o valor V
remove(_,[],[]).
remove(V,[v(D, P,V1)|Lista], [v(D1,P,V1)|Lista2]):-
    delete(D, V, D1),
    remove(V, Lista, Lista2).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
