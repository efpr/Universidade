mensagem(N, X, Y, Z) :-
	nl,
    write('----- [Alínea '), write(N), write('] -----'),nl,
    write(X), 
    write(' de '), write(Y),
    escreve_lista(Z), nl.

escreve_lista(X) :-
    \+ is_list(X),!,
    write(' é '),
    write(X),
    write('.').
escreve_lista([]) :- !, write(' é vazio.').
escreve_lista([X]) :- !, escreve_lista(X).
escreve_lista([X | L]) :- 
    write(' são '),
    write(X),
    escreve_itens(L),
    write('.').
escreve_itens([]) :- !.
escreve_itens([X]) :- 
    write(' e '),
    write(X).
escreve_itens([X | T]) :- 
    write(', '), write(X), !,
    escreve_itens(T).
%
% Uma pessoa é um homem ou uma mulher
%
homem(X) :- homem(X, _, _).
mulher(X) :- mulher(X, _, _).

pessoa(X) :- homem(X).
pessoa(X) :- mulher(X).
%
% Conjunto das pessoas
pessoas(Pessoas) :-
    setof(Pessoa, pessoa(Pessoa), Pessoas).


% Alinea 2
irmao(X, Y):-
	filho(X, Z),
	filho(Y, Z),
	X\==Y.
% Alinea 3
primoDireito(X,Y):-
	filho(X, B),
	filho(Y, A),
	irmao(A,B).
% Alinea 4
irmaos(X,Y):-
	setof(A, irmao(X,A), Y).
% Alinea 5 
primo(X,Y):-
	primoDireito(X,Y).
primo(X,Y):-
	filho(Y, Pai_de_Y),
	primo(X, Pai_de_Y).
primo(X,Y):-
	filho(X, Pai_de_X),
	primo(Pai_de_X, Y).
primos(X,Y):-
	setof(A,primo(X,A),Y).
% Alinea 6
esposa(X,Y):-
	mulher(X),
	homem(Y),
	filho(F,X),
	filho(F,Y).
% Alinea 7
descende(X,Y):-
	filho(X,Y).
descende(X,Y):-
	filho(X,Z),
	descende(Z,Y).
ascendentes(X,Y):-
	setof(Z, descende(X,Z),Y), !.
ascendentes(_,[]).
% Alinea 8
ascende(X,Y):-
	filho(Y,X).
ascende(X,Y):-
	filho(Z,X),
	descende(Y,Z).
descendentes(X,Y):-
	setof(Z, ascende(X,Z),Y), !.
descendentes(_,[]).
% Alinea 9
no(N, X, Y):-
	homem(L),
	filho(N,L),
	mulher(R),
	filho(N,R),	
	[no(L,_,_)|X],
	[no(R,_,_)|Y].
no(_N,0,0).
ascendentes_sep(N,no(N,_,_)).