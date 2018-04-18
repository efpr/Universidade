% num(Dominio, Pos, Valor).

% sudoku([num,....]).

estado_inicial(e(L,L1)):-
    gerar_num(11, L2),
    gerar_num(11, L1),
    num_iniciais(L2, L1, L).

% estado_final(e(L)):-
%     check(L).
%
% check([]).
% check([[_,_,V]|T]):-
%     nonvar(V),
%     check(T).

gerar_num(100,_).
gerar_num(Q, L):-
    X is Q mod 10,
    X = 0,
    Q1 is Q + 1,
    gerar_num(Q1, L).
gerar_num(Q, [H|T]):-
    X is Q mod 10,
    Y is Q // 10,
    D = [1,2,3,4,5,6,7,8,9],
    H = v(D, pos(X,Y), _),

    Q1 is Q + 1,
    gerar_num(Q1, T).

num_iniciais(L2, L1, L):-
    inserir(v([1,2,3,4,5,6,7,8,9], pos(3,1), 5), L1),
    delete(L2, v(_, pos(3,1), _), L21),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(5,1), 8), L1),
    delete(L21, v(_, pos(5,1), _), L22),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(7,1), 7), L1),
    delete(L22, v(_, pos(7,1), _), L23),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(1,2), 7), L1),
    delete(L23, v(_, pos(1,2), _), L24),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(4,2), 2), L1),
    delete(L24, v(_, pos(4,2), _), L25),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(6,2), 4), L1),
    delete(L25, v(_, pos(6,2), _), L26),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(9,2), 5), L1),
    delete(L26, v(_, pos(9,2), _), L27),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(1,3), 3), L1),
    delete(L27, v(_, pos(1,3), _), L28),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(2,3), 2), L1),
    delete(L28, v(_, pos(2,3), _), L29),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(8,3), 8), L1),
    delete(L29, v(_, pos(8,3), _), L30),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(9,3), 4), L1),
    delete(L30, v(_, pos(9,3), _), L31),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(2,4), 6), L1),
    delete(L31, v(_, pos(2,4), _), L32),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(4,4), 1), L1),
    delete(L32, v(_, pos(4,4), _), L33),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(6,4), 5), L1),
    delete(L33, v(_, pos(6,4), _), L34),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(8,4), 4), L1),
    delete(L34, v(_, pos(7,1), _), L35),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(3,5), 8), L1),
    delete(L35, v(_, pos(3,5), _), L36),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(7,5), 5), L1),
    delete(L36, v(_, pos(7,5), _), L37),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(2,6), 7), L1),
    delete(L37, v(_, pos(2,6), _), L38),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(4,6), 8), L1),
    delete(L38, v(_, pos(4,6), _), L40),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(6,6), 3), L1),
    delete(L40, v(_, pos(6,6), _), L41),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(8,6), 1), L1),
    delete(L41, v(_, pos(8,6), _), L42),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(1,7), 4), L1),
    delete(L42, v(_, pos(1,7), _), L43),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(2,7), 5), L1),
    delete(L43, v(_, pos(2,7), _), L44),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(8,7), 9), L1),
    delete(L44, v(_, pos(8,7), _), L45),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(9,7), 1), L1),
    delete(L45, v(_, pos(9,7), _), L46),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(1,8), 6), L1),
    delete(L46, v(_, pos(1,8), _), L47),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(4,8), 5), L1),
    delete(L47, v(_, pos(7,1), 7), L48),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(6,8), 8), L1),
    delete(L48, v(_, pos(6,8), _), L49),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(9,8), 7), L1),
    delete(L49, v(_, pos(9,8), _), L50),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(3,9), 3), L1),
    delete(L50, v(_, pos(3,9), _), L51),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(5,9), 1), L1),
    delete(L51, v(_, pos(5,9), _), L52),

    inserir(v([1,2,3,4,5,6,7,8,9], pos(7,9), 6), L1),
    delete(L52, v(_, pos(7,9), _), L).

inserir(v(D, pos(X,Y), V), [v(D, pos(X,Y), N)|_]):-
    N is V.
inserir(M, [_|T]):-
    inserir(M, T).

pw(Q):-
    Q \= 9,
    X is Q mod 3,
    X = 0,
    write(' | ').
pw(_):-
    write(' ').

pr([],_,_).
pr(L, Q, NL):-
    Q = 10,
    NL = 3,
    writeln(''),
    writeln('------+-------+------'),
    Q1 is 1,
    NL1 is 1,
    pr(L, Q1, NL1).
pr(L, Q, NL):-
    Q = 10,
    writeln(''),
    Q1 is 1,
    NL1 is NL + 1,
    pr(L, Q1, NL1).
pr([v(_,_,V)|L], Q, NL):-
    nonvar(V),
    write(V), pw(Q),
    Q1 is Q + 1,
    pr(L,Q1, NL).
pr([_|L], Q, NL):-
    write('_'), pw(Q),
    Q1 is Q + 1,
    pr(L,Q1, NL).


mem_lista([]).
mem_lista([H|R]):-
    \+ member(H,R),
    mem_lista(R).

ve_restricoes(e(_,L)):-
    ve_linha(L),
    ve_coluna(L),
    ve_quadrante(L).

ve_linha([v(D,pox(_,Y),V)|L]):-
    findall(V1, member([D,pos(_,Y),V1], L), Lista),
    mem_lista([V|Lista]).

ve_coluna([v(D,pox(X,_),V)|L]):-
    findall(V1, member([D,pos(X,_),V1], L), Lista),
    mem_lista([V|Lista]).

ve_quadrante(L):-
    ve_q(L, 1,1),
    ve_q(L, 4,1),
    ve_q(L, 7,1),
    ve_q(L, 1,4),
    ve_q(L, 4,4),
    ve_q(L, 7,4),
    ve_q(L, 1,7),
    ve_q(L, 4,7),
    ve_q(L, 7,7).

ve_q(L, X,Y):-
    ve_q(L,X,Y,Ls),
    mem_lista(Ls).

ve_q([], _,_, _).
ve_q([v(_,pos(X,Y), V)|L],X1,Y1, Ls):-
    entre(X1,Y1, X, Y),
    ve_q(L, X1, Y1, [V|Ls]).
ve_q(L, X1, Y1, Ls):-
    ve_q(L, X1,Y1, Ls).


entre(X1,Y1,X2,Y2):-
    X2 >= X1,
    X2 =< X1 + 2,
    Y2 >= Y1,
    Y2 =< Y1 + 2.
