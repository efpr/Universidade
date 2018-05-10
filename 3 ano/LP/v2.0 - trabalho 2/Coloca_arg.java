
import java.util.LinkedList;
import java.util.Stack;


public class Coloca_arg extends I_Chamada_Funcoes
{
    public Coloca_arg(int arg0)
    {
        super("coloca_arg", arg0);
    }
      @Override
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        Bloco temp = new Bloco();

        temp.insert(""+ getInteiro1(), (int) pilha.pop());

        list.add(temp);

        return ++pc;


    }
}
