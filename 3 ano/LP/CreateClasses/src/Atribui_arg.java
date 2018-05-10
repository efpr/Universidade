
import java.util.LinkedList;
import java.util.Stack;


public class Atribui_arg extends I_Acesso_Argumentos
{
    public Atribui_arg(int arg0, int arg1)
    {
        super("atribui_arg", arg0, arg1);
    }
    
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        list.get(b_corrente-1-getInteiro1()).changeValue(getInteiro2(), (int) pilha.pop());
        
        return pc++;
    }   
}
