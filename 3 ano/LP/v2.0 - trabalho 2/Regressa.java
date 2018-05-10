
import java.util.LinkedList;
import java.util.Stack;


public class Regressa extends I_Chamada_Funcoes
{
    public Regressa()
    {
        super("regressa");
    }
      @Override
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        pc = list.get(b_corrente).getValor_retorno();

        list.remove(b_corrente);
        b_corrente--;

        return ++pc;
    }
}
