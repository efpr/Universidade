
public class Chama extends I_Chamada_Funcoes
{
    public Chama(int arg0, String arg1)
    {
        super("chama", arg0, arg1);
    }

    public int accao(int pc, Memoria memoria)
    {
        String etiqueta = getEtiqueta();

        for(Label l : memoria.getMem_label())
            if(l.getNome().equals(etiqueta))
                pc = l.getTamanho();

        return pc;
    }
}
