
import java.util.LinkedList;
import java.util.Stack;


public class Escreve_str extends I_Saida
{
    public Escreve_str(String arg0)
    {
        super("escreve_str", arg0);
    }
    
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        System.out.print(getString());
        return pc++;
    }
}
