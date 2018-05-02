# Inteligência Artificial - Trabalho 1

## Elementos


 Número | Primeiro Nome + Apelido
--------|-------------------------
  35476 | João Dias
  35477 | Eduardo Romão

## Respostas

### Grupo 1

#### Pergunta 1.1

A estrutura de dados adequada para representar um estado do jogo consiste no jogador e no tabuleiro. Sendo o tabuleiro um conjunto de variaveis que contem o numero da linha e o numero de traços.

#### Pergunta 1.2

O estado terminal obtem-se quando o tabuleiro se encontra vazio, ou sem traços.

#### Pergunta 1.3

A função utilidade que recebe um estado e devolve um valor que consiste no valor -1 quando se perde, 0 quando se empata e 1 quando se ganha.

#### Pergunta 1.4

A implementação do algoritmo minimax encontra-se no ficheiro 'minimax.pl'


### Grupo 2

#### Pergunta 2.1

Para o jogo do galo de modo a representar a estrutura de um estado usa-se um conjunto do jogador juntamente com o tabuleiro. Sendo o tabuleiro uma lista com nove variaveis. Estas variaveis possuem uma posição e o valor nessa posição (x,o,n).

#### Pergunta 2.2

Um estado é terminal se cumprir duas condições. A primeira consiste no ultimo jogador a jogar ter ganho atraves do predicado 'check_winner'. A segunda condição, caso a primeira falhe, consiste em estarem todas as posições ocupadas com x ou o, havendo assim um empate.

#### Pergunta 2.3

A função utilidade atribui o valor 1 quando o jogador vence, o valor 0 quando há um empate e o valor -1 quando o jogador perde.


## Programas Usados

- `nim.pl`: motor de jogo do nim
- `galo.pl`: motor de jogo do galo
- `minimax.pl`: contem o algoritmo minimax
- `alfabeta.pl`: contem o algoritmo alfabeta
- `profundidade.pl`: contem o algoritmo profundidade
- `predicados_auxiliar.pl`: contem predicados auxiliares dos algoritmos
- `jogar.pl`: ficheiro utilizado para jogar


