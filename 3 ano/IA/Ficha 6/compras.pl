%ações(Nome, PreCond, Coisas que passam a ser verdade, Passam a ser mentira)

/*
Está em casa e repara que precisa de comprar alguns objetos: bananas , leite e um berbequim . Pode comprar as
bananas e o leite no super_mercado e o berbequim na loja_de_ferragens .
*/
local(super_mercado).
local(loja_de_ferragens).
local(casa).
produto(leite).
produto(bananas).
produto(berbequim).
vende(super_mercado, leite).
vende(super_mercado, bananas).
vende(loja_de_ferragens, berbequim).

inicio([estar(casa)]).

objetivo([estar(casa), ter(bananas), ter(leite), ter(berbequim)]).

acao(	comprar(Produto),
		[estar(Local)],
		[ter(Produto)],
		[]
		):-
			produto(Produto),
			local(Local),
			vende(Local, Produto).

acao(
		ir(Local1, Local2),
		[estar(Local1)],
		[estar(Local2)],
		[estar(Local1)]
		) :-
			local(Local1),
			local(Local2),
			Local2 \= Local1.