
import java.util.LinkedList;
import java.util.Stack;


public class Locais extends I_Chamada_Funcoes
{
    public Locais(int arg0, int arg1)
    {
        super("locais", arg0, arg1);
    }
      @Override
    public int[] accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
      for(int i=0; i<=getInteiro1()+getInteiro2(); i++)
          list.get(b_corrente).insert("m", 0);
      int[] a = {++pc, b_corrente};
      return a;
    }
}
