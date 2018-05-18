
import java.util.LinkedList;
import java.util.Stack;


public class Empilha extends I_Manipulacao_Inteiros
{
    public Empilha(int arg0)
    {
        super("empilha", arg0);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        pilha.push(getInteiro());

        int[] a = {++pc, b_corrente};
        return a;
    }
}
