
import java.util.LinkedList;
import java.util.Stack;


public class Escreve_int extends I_Saida
{
    public Escreve_int()
    {
        super("escreve_int");
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        System.out.print(pilha.pop());
        int[] a = {++pc, b_corrente};
        return a;
    }
}
