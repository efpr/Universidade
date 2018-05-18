
import java.util.LinkedList;
import java.util.Stack;


public class Sub extends I_Aritmetica
{

    public Sub()
    {
        super("sub");
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int op2 = (int) pilha.pop();
        int op1 = (int) pilha.pop();

        pilha.push(op1-op2);

        int[] a = {++pc, b_corrente};
        return a;
    }
}
