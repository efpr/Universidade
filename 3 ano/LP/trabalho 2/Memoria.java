
import java.util.ArrayList;

public class Memoria
{
    private ArrayList<Instrucao> mem_instrucao;
    private ArrayList<Label> mem_label;

    public Memoria()
    {
        mem_instrucao = new ArrayList<Instrucao>();
        mem_label = new ArrayList<Label>();
    }

    public void mem_add_instrucao(Instrucao arg0)
    {
        mem_instrucao.add(arg0);
    }

    public void mem_add_label(Label arg0)
    {
        mem_label.add(arg0);
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
        for(Label temp : mem_label)
  		{
  			System.out.println(temp.toString());
  		}
    }

    public ArrayList<Instrucao> getMem_instrucao() {
        return mem_instrucao;
    }

    public ArrayList<Label> getMem_label() {
        return mem_label;
    }


}
