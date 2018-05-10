
import java.util.ArrayList;


public class Bloco 
{
    private ArrayList<Pares> table;
    
    private int valor_retorno;
    private int valor_posicao;
    
    public Bloco()
    {
        table = new ArrayList<Pares>();
    }

    public int getValor_retorno() {
        return valor_retorno;
    }

    public void setValor_retorno(int valor_retorno) {
        this.valor_retorno = valor_retorno;
    }

    public int getValor_posicao() {
       
        return valor_posicao;
    }

    public void setValor_posicao(int valor_posicao) {
        this.valor_posicao = valor_posicao;
    }
    
    public int getSize()
    {
        return table.size();
    }
    
public void insert(String arg0, int arg1)
    {
        table.add(new Pares(arg0, arg1));
    }
    
    public int searchValue(String arg0)
    {
        for(Pares pares : table)
            if(pares.var.equals(arg0))
                return pares.value;
        
        return -1;
    }
    
    public int searchIndex(String arg0)
    {
        for(int i=0; i<table.size(); i++)
        {
            if(table.get(i).var.equals(arg0))
                return i;
        }
        return -1;
    }
    
    public void changeValue(int index, int value)
    {
        table.get(index).value = value;
    }
    
    public int searchIndexV(int arg0)
    {
        return table.get(arg0-1).value;
    }
    
    
   
}
