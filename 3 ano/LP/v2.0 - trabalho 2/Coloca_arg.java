
import java.util.LinkedList;
import java.util.Stack;


public class Coloca_arg extends I_Chamada_Funcoes
{
    public Coloca_arg(int arg0)
    {
        super("coloca_arg", arg0);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {

        Bloco temp1 = list.get(b_corrente);
        Bloco temp2 = list.getLast();

        if(temp1.equals(temp2))
        {
          Bloco temp = new Bloco();

          temp.insert(""+ getInteiro1(), (int) pilha.pop());

          list.add(temp);
        }
        else
        {
          temp2.insert(""+ getInteiro1(), (int) pilha.pop());
        }



        int[] a = {++pc, b_corrente};
        return a;


    }
}
