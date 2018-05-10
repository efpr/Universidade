
import java.util.LinkedList;
import java.util.Stack;


public class Exp extends I_Aritmetica
{
    public Exp()
    {
        super("exp");
    }
      @Override
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int op2 = (int) pilha.pop();
        int op1 = (int) pilha.pop();

        int pow = (int) Math.pow(op1, op1);

        pilha.push(pow);

        return ++pc;
    }
}
