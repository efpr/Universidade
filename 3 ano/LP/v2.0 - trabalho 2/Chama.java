
import java.util.LinkedList;
import java.util.Stack;


public class Chama extends I_Chamada_Funcoes
{
    public Chama(int arg0, String arg1)
    {
        super("chama", arg0, arg1);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        Bloco temp1 = list.get(b_corrente);
        Bloco temp2 = list.getLast();

        if(temp1.equals(temp2))
        {
            Bloco bloco = new Bloco();
            list.add(bloco);
        }

        b_corrente++;

        list.getLast().setValor_retorno(pc);

        int[] a =  {memoria.mem_get_label(getEtiqueta()), b_corrente};
        return a;
    }
}
