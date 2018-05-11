
// Conjunto de Instrucoes Maquina Simples
import java.util.LinkedList;
import java.util.Stack;

public class CIMS {
  	private Memoria memoria;
    private Stack avaliacao;
    private LinkedList<Bloco>  execucao;
    private int pc; // program counter

    public CIMS()
    {
        pc = 0;
        memoria = new Memoria();
        avaliacao = new Stack();
        execucao = new LinkedList<Bloco>();
    }

  	public void add_Inst(Instrucao obj)
    {
        memoria.mem_add_instrucao(obj);
    }

    public void add_Label(String arg1, int arg2)
    {
    	memoria.mem_add_label(arg1,arg2);
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
        Bloco bloco = new Bloco();
        execucao.add(bloco);

        int b_corrente = 0;

        pc = memoria.mem_get_label("main");

        while(execucao.size() != 0)
        {
            pc = memoria.getMem_instrucao().get(pc).accao(memoria, execucao, avaliacao, pc, b_corrente);
        }
  	}
}
