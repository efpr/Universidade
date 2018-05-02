:- include('predicados_auxiliares.pl').
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nim_minimax():-
  consult(nim),
  consult(minimax),
  estado_inicial(E),
  jogada(E, minimax, humano).

nim_profundidade():-
  consult(nim),
  consult(profundidade),
  estado_inicial(E),
  jogada(E, minimax, humano).

jogar(Jogo, A, B) :-
    consult(Jogo),
    consult(minimax),
    consult(profundidade),
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
