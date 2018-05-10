%ações(Nome, PreCond, Coisas que passam a ser verdade, Passam a ser mentira)

inicio([]).

objetivo([sapato(esq), sapato(dir)]).

acao(
		calcar_peuga(Pe),
		[],
		[peuga(Pe)],
		[]).

acao(
		calcar_sapato(Pe),
		[peuga(Pe)],
		[sapato(Pe)],
		[]).