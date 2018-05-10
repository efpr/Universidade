
public class I_Chamada_Funcoes extends Instrucao
{
    private String nome, etiqueta;
    private int inteiro1, inteiro2;

    public I_Chamada_Funcoes(String nome, int inteiro1)
    {
        this.nome = nome;
        this.inteiro1 = inteiro1;
    }

    public I_Chamada_Funcoes(String nome, int inteiro1, String etiqueta)
    {
        this.nome = nome;
        this.etiqueta = etiqueta;
        this.inteiro1 = inteiro1;
    }

    public I_Chamada_Funcoes(String nome, int inteiro1, int inteiro2 )
    {
        this.nome = nome;
        this.inteiro1 = inteiro1;
        this.inteiro2 = inteiro2;
    }

    public I_Chamada_Funcoes(String nome)
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

    public String getEtiqueta()
    {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta)
    {
        this.etiqueta = etiqueta;
    }

    public int getInteiro1()
    {
        return inteiro1;
    }

    public void setInteiro1(int inteiro1)
    {
        this.inteiro1 = inteiro1;
    }

    public int getInteiro2()
    {
        return inteiro2;
    }

    public void setInteiro2(int inteiro2)
    {
        this.inteiro2 = inteiro2;
    }

    @Override
    public String toString() {
        if(nome.equals("Regressa"))
            return "I_Chamada_Funcoes{" + "nome=" + nome + '}';
        if(nome.equals("Chama"))
            return "I_Chamada_Funcoes{" + "nome=" + nome + ", etiqueta=" + etiqueta + ", inteiro1=" + inteiro1 + '}';
        if(nome.equals("Coloca"))
            return "I_Chamada_Funcoes{" + "nome=" + nome + ", inteiro1=" + inteiro1 + '}';

        return "I_Chamada_Funcoes{" + "nome=" + nome + ", inteiro1=" + inteiro1 + ", inteiro2=" + inteiro2 + '}';
    }


}
