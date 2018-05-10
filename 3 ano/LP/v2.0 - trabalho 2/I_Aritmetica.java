
public class I_Aritmetica extends Instrucao
{
    private String nome;

    public I_Aritmetica(String nome)
    {
        this.nome = nome;
    }

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "I_Aritmetica{" + "nome=" + nome + '}';
    }


}
