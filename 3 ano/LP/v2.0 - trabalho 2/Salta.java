
import java.util.LinkedList;
import java.util.Stack;


public class Salta extends I_Salto
{
    public Salta(String arg0)
    {
        super("salta", arg0);
    }
  @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        /*int posicao = list.get(list.size()-1).getSize();
        Bloco temp = new Bloco(posicao);

        list.add(temp);
        */
        int[] a = {memoria.mem_get_label(getEtiqueta()), b_corrente};
        return a;
    }
}
