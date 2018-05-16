
# Inteligência Artificial - Trabalho 1

## Elementos


 Número | Primeiro Nome + Apelido
--------|-------------------------
35476 | João Dias
35477 | Eduardo Romão

## Respostas

### Grupo 1

#### Pergunta 1.1

Para o problema da travessia o inicio é representado no ficheiro `travessia.pl` através de duas margens e um barco. Estes tres predicado contem o numero de missionários, de canibais e o lado em que se encontra. 
```prolog
inicio([margem(missionarios(3), canibais(3), esquerda),
		barco(missionarios(0), canibais(0), esquerda),
		margem(missionarios(0), canibais(0), direita)]).
```
No inicio a margem direita e o barco encontram-se vazios. O objetivo será passar todos os missionários e canibais para a margem direita.
```prolog
objetivo([margem(missionarios(3), canibais(3), direita)]).
```
Para atingir o objetivo temos cinco acções diferentes. São elas embarcar canibais, embarcar missionários, desembarcar canibais, desembarcar missionários e travessia de margem.
```prolog
acao(embarcar_missionario,
	[margem(missionarios(X), canibais(Y), Margem),
	barco(missionarios(X1), canibais(Y1), Margem)],
	[margem(missionarios(X2),canibais(Y),Margem),
	barco(missionarios(X3), canibais(Y1), Margem)],
	[margem(missionarios(X), canibais(Y), Margem),
	barco(missionarios(X1), canibais(Y1), Margem)]
):-
	max_margem(X), max_margem(Y), margem_actual(Margem),
	max_barco(X1), max_barco(Y1),
	T is X1+Y1, T < 2,
	X2 is X-1, X3 is X1+1,
	Y =< X2.
	
acao(embarcar_canibais,
	[margem(missionarios(X), canibais(Y), Margem),
	barco(missionarios(X1), canibais(Y1), Margem)],
	[margem(missionarios(X),canibais(Y2),Margem),
	barco(missionarios(X1), canibais(Y3), Margem)],
	[margem(missionarios(X), canibais(Y), Margem),
	barco(missionarios(X1), canibais(Y1), Margem)]
):-
	max_margem(X), max_margem(Y), margem_actual(Margem),
	max_barco(X1), max_barco(Y1),
	T is X1+Y1, T < 2,
	Y2 is Y-1, Y3 is Y1+1,
	Y2 =< X.

acao(travessia_de_margem,
	[barco(missionarios(X), canibais(Y), Margem)],
	[barco(missionarios(X), canibais(Y), Margem1)],
	[barco(missionarios(X), canibais(Y), Margem)]
):-
	margem_actual(Margem), margem_actual(Margem1),
	Margem \= Margem1,
	max_barco(X), max_barco(Y),
	T is X+Y, T > 0.

acao(desembarcar_missionario,
	[barco(missionarios(X), canibais(Y), Margem),
	margem(missionarios(X1), canibais(Y1), Margem)],
	[barco(missionarios(X2), canibais(Y), Margem),
	margem(missionarios(X3), canibais(Y1), Margem)],
	[barco(missionarios(X), canibais(Y), Margem),
	margem(missionarios(X1), canibais(Y1), Margem)]
):-
	max_barco(X), max_barco(Y), margem_actual(Margem),
	max_margem(X1), max_margem(Y1),
	X > 0,
	X2 is X-1, X3 is X1+1,
	Y1 =< X3.

acao(desembarcar_canibais,
	[barco(missionarios(X), canibais(Y), Margem),
	margem(missionarios(X1), canibais(Y1), Margem)],
	[barco(missionarios(X), canibais(Y2), Margem),
	margem(missionarios(X1), canibais(Y3), Margem)],
	[barco(missionarios(X), canibais(Y), Margem),	
	margem(missionarios(X1), canibais(Y1), Margem)]
):-
	max_barco(X), max_barco(Y), margem_actual(Margem),
	max_margem(X1), max_margem(Y1),
	Y > 0,
	Y2 is Y-1, Y3 is Y1+1,
	Y3 =< X1.
```
#### Pergunta 1.3
No algoritmo de progresão o programa corre em 0.309s e executa 3.914.613 inferências, sendo este o melhor algoritmo visto os outros não estarem aptos a funcionar.


## Programas Usados

- `travessia.pl`: contem todo o programa da travessia.
- `pesquisa.pl`: executar os algoritmos.
- `progressao.pl`: algoritmo de progressão.
- `regressão.pl`: algoritmo de regressão.
- `pop.pl`: algoritmo pop.


