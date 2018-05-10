
import java.util.LinkedList;
import java.util.Stack;


public class Smenor extends I_Salto
{
    public Smenor(String arg0)
    {
        super("smenor", arg0);
    }
      @Override
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int op1 = (int) pilha.pop();
        int op2 = (int) pilha.pop();

        pilha.push(op2);
        pilha.push(op1);

        if(op1 > op2)
        {
            /*int posicao = list.get(list.size()-1).getSize();
            Bloco temp = new Bloco(posicao);

            list.add(temp);*/

            return memoria.mem_get_label(getEtiqueta());

        }

        return ++pc;
    }
}
