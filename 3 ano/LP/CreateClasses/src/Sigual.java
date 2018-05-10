
import java.util.LinkedList;
import java.util.Stack;


public class Sigual extends I_Salto
{
    public Sigual(String arg0)
    {
        super("sigual", arg0);
    }
    
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        int op1 = (int) pilha.pop();
        int op2 = (int) pilha.pop();
        
        pilha.push(op2);
        pilha.push(op1);
        
        if(op1 == op2)
        {
            /*int posicao = list.get(list.size()-1).getSize();
            Bloco temp = new Bloco(posicao);

            list.add(temp);*/
            
            return memoria.mem_get_label(getEtiqueta());
            
        }
        
        return pc++;
            
    }
}
