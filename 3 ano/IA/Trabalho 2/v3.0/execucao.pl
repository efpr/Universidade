%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   BACKTRACKING
%
p:- estado_inicial(E0), back(E0,A), esc(A,1).
%
back(e([],A),A).
back(E,Sol):- sucessor(E,E1), ve_restricoes(E1),
                          back(E1,Sol).
%
sucessor(e([v(D,N,V)|R],E),e(R,[v(D,N,V)|E])):-
    member(V,D).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   FORWARD CHECK
%
q:- estado_inicial(E0), foward(E0,A), esc(A,1).
%
foward(e([],A),A).
foward(E, Sol):- sucessor2(E,E1), ve_restricoes(E1),
                          foward(E1, Sol).
%
sucessor2(e([v(D,N,V)|NonAffect],E),e(NonAffect1,[v(D,N,V)|E])):-
    member(V,D),
    forwarding(v(D,N,V), NonAffect, NonAffect1).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Função para escrever o tabuleiro completo
%
esc(_,10):-!.
esc(L, Y):-
    findall(v(D,pos(Q,X,Y),V), member(v(D,pos(Q,X,Y),V),L), Lista),
    sort(Lista,LP),
    fprint(LP,1),
    fsep(Y),
    Y1 is Y + 1,
    esc(L,Y1).
%%
fsep(X):-
    X1 is X mod 3,
    X1 = 0,
    Y is X mod 9,
    Y \= 0,
    writeln('------+-------+------').
fsep(_).
%
space(Q):-
    Q \= 9,
    X is Q mod 3,
    X = 0,
    write(' | ').
space(_):-
    write(' ').
%
fprint([],_):- writeln('').
fprint([v(_,pos(_,_,_),V)|L], Q):-
    write(V), space(Q),
    Q1 is Q + 1,
    fprint(L,Q1).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
