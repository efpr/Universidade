jogador(x).
jogador(o).

estado_inicial(e([  n,n,n,
                    n,n,n,
                    n,n,n]), jogador(x)).

linha(e([X,X,X,
        _,_,_,
        _,_,_]), jogador(X)):- jogador(X).
linha(e([_,_,_,
         X,X,X,
         _,_,_])):- jogador(X).
linha(e([_,_,_,
         _,_,_,
         X,X,X])):- jogador(X).
coluna(e([X,_,_,
         X,_,_,
         X,_,_])):- jogador(X).
coluna(e([_.X,_,
         _,X,_,
         _,X,_])):- jogador(X).
coluna(e([_,_,X,
         _,_,X,
         _,_,X])):- jogador(X).
diagonal(e([X,_,_,
            _,X,_,
            _,_,X])):- jogador(X).
diagonal(e([_,_,X,
            _,X,_,
            X,_,_])):- jogador(X).
empate(e(X)):- \+(member(n,X)).

estado_final(X):- linha(X).
estado_final(X):- coluna(X).
estado_final(X):- diagonal(X).
estado_final(X):- empate(X).

sucessor(e)
