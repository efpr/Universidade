
public class I_Saida extends Instrucao
{
    private String nome, string;

    public I_Saida(String nome)
    {
        this.nome = nome;
    }

    public I_Saida(String nome, String string)
    {
        this.nome = nome;
        this.string = string;
    }

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public String getString()
    {
        return string;
    }

    public void setString(String string)
    {
        this.string = string;
    }

    @Override
    public String toString() {
        if(nome.equals("Escreve"))
            return "I_Saida{" + "nome=" + nome + ", string=" + string + '}';

        return "I_Saida{" + "nome=" + nome + '}';
    }


}
