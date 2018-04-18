estado(me(NME,NCE), b(NMB,NCB), md(NMD,NCD), MARGEM)

estado_inicial(estado(me(3,3), b(0,0), md(0,0), esq)).
estado_final(estado(me(0,0), b(0,0), md(3,3), dir)).

% Atravesar para a direita
tr
(
      estado(ME, b(M,C), MD, esq),
      rema(dir),
      estado(ME, b(M,C), MD, dir)
):-   0 < M + C <=2.

% Atravesar para a esquerda
tr
(
      estado(ME, b(M,C), MD, dir),
      rema(esq),
      estado(ME, b(M,C), MD, esq)
):-   0 < M + C <=2.

% Embarca
tr(estado(ME, b(MB,CB)))
