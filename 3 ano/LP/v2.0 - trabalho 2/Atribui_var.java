
import java.util.LinkedList;
import java.util.Stack;


public class Atribui_var extends I_Acesso_Variaveis
{
    public Atribui_var(int arg0, int arg1)
    {
        super("atribui_var", arg0, arg1);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int top = (int) pilha.pop();
        pilha.push(top);

        list.get(b_corrente-getInteiro1()).changeValue(getInteiro2()-1, top);
        int[] a = {++pc, b_corrente};
        return a;
    }
}
