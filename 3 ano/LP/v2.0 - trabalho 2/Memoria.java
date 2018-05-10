
import java.util.ArrayList;
import java.util.Hashtable;

public class Memoria
{
    private ArrayList<Instrucao> mem_instrucao;
    private Hashtable<String, Integer> mem_label;

    public Memoria()
    {
        mem_instrucao = new ArrayList<Instrucao>();
        mem_label = new Hashtable<String, Integer>();
    }

    public void mem_add_instrucao(Instrucao arg0)
    {
        mem_instrucao.add(arg0);
    }

    public void mem_add_label(String arg0, int arg1)
    {
        mem_label.put(arg0, arg1);
    }

    public int mem_get_label(String arg0)
    {
        return mem_label.get(arg0);
    }

    public int mem_instrucao_size()
    {
        return mem_instrucao.size();
    }

    public void print()
    {
        System.out.println("Instruções:");
        
        for(Instrucao temp : mem_instrucao)
  		{
  			System.out.println(temp.toString());
  		}
        System.out.println("\nLabel:");
        /*for(Label temp : mem_label)
  		{
  			System.out.println(temp.toString());
  		}*/
    }

    public ArrayList<Instrucao> getMem_instrucao() {
        return mem_instrucao;
    }

    public Hashtable<String, Integer> getMem_label() {
        return mem_label;
    }


}
