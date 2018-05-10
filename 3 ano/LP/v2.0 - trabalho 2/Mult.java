
import java.util.LinkedList;
import java.util.Stack;


public class Mult extends I_Aritmetica
{
    public Mult()
    {
        super("mult");
    }
      @Override
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int op2 = (int) pilha.pop();
        int op1 = (int) pilha.pop();

        pilha.push(op1*op2);

          return ++pc;
    }
}
