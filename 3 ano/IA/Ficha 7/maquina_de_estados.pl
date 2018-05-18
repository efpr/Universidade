
% registo(X,Y).
% estado([registo(),...]).
% maquina(estado()).

%% Predicado: "registo"
%
%% Estado Inicial.
%
v(registo(a,va), s0).
v(registo(b,vb), s0).
v(registo(c,vb), s0).
v(registo(d,vd), s0).
v(registo(e,ve), s0).
%
%% Acção: "afectar" (Inércia)
%
v(registo(N,Y), r(afectar(N,M), S)) :-
    v(registo(M, Y), S).
%
