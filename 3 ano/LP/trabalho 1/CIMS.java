
// Conjunto de Instrucoes Maquina Simples
import java.util.ArrayList;

public class CIMS {
  	private Memoria memoria;
    private ArrayList<Object> avaliacao;
    private ArrayList<Object> execucao;

    public CIMS()
    {
        memoria = new Memoria();
        avaliacao = new ArrayList<Object>();
        execucao = new ArrayList<Object>();
    }

  	public void add_Inst(Instrucao obj)
    {
        memoria.mem_add_instrucao(obj);
    }

    public void add_Label(Label label)
    {
    	memoria.mem_add_label(label);
    }

  	public int getMemoriaSize()
  	{
  		return memoria.mem_instrucao_size();
  	}

  	public void print()
  	{
  		memoria.print();
  	}

  	/** Executa o programa CIMS carregado na maquina. */
  	public void executa()
  	{

  	}
}
