:-include('bd.pl').
:-include('lib_ficha1.pl').

alinea_2 :-
    Pessoa = 'Afonso II',
    setof(X, irmao(Pessoa, X), Irmaos),
    mensagem(2, 'Os irmãos', Pessoa, Irmaos).
%
alinea_3 :-
    Pessoa = 'Afonso IX',
    setof(X, primoDireito(Pessoa, X), PrimosDireitos),
    mensagem(3, 'Os primos-direitos', Pessoa, PrimosDireitos).
%
alinea_4 :-
    Pessoa = 'Sancho I',
    setof(X, irmaos(Pessoa, X), Irmaos),
    mensagem(4, 'Os irmãos', Pessoa, Irmaos).
%
alinea_5 :-
    forall(pessoa(Pessoa), (
        primos(Pessoa, Primos),
        mensagem(5, 'Os primos', Pessoa, Primos)
    )).

alinea_6 :-
   forall( (homem(Homem), filho(_, Homem)), (
        setof(Mulher, esposa(Mulher, Homem), Esposas),
        mensagem(6, 'As esposas', Homem, Esposas)
   )),
   forall( (esposa(Mulher, Homem)),
        mensagem(6.5, 'Uma esposa de ', Homem, Mulher)
    ).
%
alinea_7 :-
    forall( pessoa(Pessoa), (
        ascendentes(Pessoa, Ascendentes),
        mensagem(7, 'Os ascendentes', Pessoa, Ascendentes)
        )).
%
alinea_8 :-
    forall(pessoa(Pessoa), (
        descendentes(Pessoa, Descendentes),
        mensagem(8, 'Os descendentes', Pessoa, Descendentes)
    )).
%
alinea_9 :-
    forall(pessoa(Pessoa), (
        ascendentes_sep(Pessoa, Ascendentes),
        mensagem(9, 'Os ascendentes separados', Pessoa, Ascendentes)
    )).
%
% ====================================================================
%
% CONSTRUÇÃO DE UMA ÁRVORE
%
% ====================================================================
%
alinea_10 :-
    Pessoa = 'Afonso Henriques',
    descendentes_sep(Pessoa, Arvore),
    mensagem(10, 'A árvore geneológica', Pessoa, Arvore).
%
% PROCESSAMENTO DA ÁRVORE
%
alinea_11 :-
    Pessoa = 'Afonso Henriques',
    %
    descendentes_nivel(Pessoa, 1, Filhos),
    mensagem('11.1', 'Os filhos', Pessoa, Filhos),
    %
    descendentes_nivel(Pessoa, 2, Netos),
    mensagem('11.2', 'Os netos', Pessoa, Netos),
    %
    descendentes_nivel(Pessoa, 3, Bisnetos),
    mensagem('11.3', 'Os bisnetos', Pessoa, Bisnetos),
    %
    descendentes_nivel(Pessoa, 4, Trinetos),
    mensagem('11.4', 'Os trinetos', Pessoa, Trinetos),
    %
    descendentes_nivel(Pessoa, 5, Tetranetos),
    mensagem('11.5', 'Os tetranetos', Pessoa, Tetranetos),
    %
    descendentes_nivel(Pessoa, 6, Pentanetos),
    mensagem('11.6', 'Os pentanetos', Pessoa, Pentanetos),
    %
    write('OK').
%
% ORDENAÇÃO
%
alinea_13 :-
    pessoas(Pessoas),
    ordena_nomes_idade(Pessoas, P_ordenadas),
    mensagem(13, 'Por ordem da nascimento', Pessoas, P_ordenadas).
%
% PROCESSAMENTO DE LISTAS
%
alinea_16 :-
    Lista = [a, b, c, d, e],
    troca(Lista, 0, 2, [c, b, a, d, e]),
    troca(Lista, 2, 0, [c, b, a, d, e]),
    troca(Lista, 2, 2, Lista),
    mensagem(16, 'Trocas', Lista, 'OK').

todas :-
    alinea_2,
    alinea_3,
    alinea_4,
%    alinea_5,
    alinea_6,
    alinea_7,
    alinea_8,
    alinea_9,
    alinea_10,
    alinea_11,
    alinea_13,
    alinea_16,
    write('FEITO'), nl,
    halt.

%:- initialization(todas).
