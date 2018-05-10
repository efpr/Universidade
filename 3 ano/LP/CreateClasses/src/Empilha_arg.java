
import java.util.LinkedList;
import java.util.Stack;


public class Empilha_arg extends I_Acesso_Argumentos
{
    public Empilha_arg(int arg0, int arg1)
    {
        super("empilha_arg", arg0, arg1);
    }

    @Override    
    public int accao(Memoria memoria, LinkedList<Bloco> list, Stack pilha, int pc, int b_corrente)
    {
        Bloco temp = list.get(b_corrente-1-getInteiro1());
        
        pilha.push(temp.searchIndexV(getInteiro2()));
        
        return pc++;
    }    
    
   
}
