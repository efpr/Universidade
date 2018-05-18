
import java.util.LinkedList;
import java.util.Stack;


public class Empilha_var extends I_Acesso_Variaveis
{
    public Empilha_var(int arg0, int arg1)
    {
        super("empilha_var", arg0, arg1);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        Bloco temp = list.get(b_corrente-getInteiro1());
      //  System.out.println("bloco: " + b_corrente +" "+ temp.getValor_posicao());
        pilha.push(temp.searchIndexV(getInteiro2()));
        int[] a = {++pc, b_corrente};
        return a;
    }
}
