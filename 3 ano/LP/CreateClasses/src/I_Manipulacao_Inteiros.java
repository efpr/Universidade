
public class I_Manipulacao_Inteiros extends Instrucao
{
    private String nome;
    private int inteiro;

    public I_Manipulacao_Inteiros(String nome, int inteiro)
    {
        this.nome = nome;
        this.inteiro = inteiro;
    }

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public int getInteiro()
    {
        return inteiro;
    }

    public void setInteiro(int inteiro)
    {
        this.inteiro = inteiro;
    }

    @Override
    public String toString() {
        return "I_Manipulacao_Inteiros{" + "nome=" + nome + ", inteiro=" + inteiro + '}';
    }


}
