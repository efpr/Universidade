
import java.util.LinkedList;
import java.util.Stack;


public class Muda_linha extends I_Saida
{
    public Muda_linha()
    {
        super("muda_linha");
    }
    
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        System.out.println();
        return pc++;
    }
}
