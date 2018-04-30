
public class I_Salto extends Instrucao
{
    private String nome;
    private String etiqueta;

    public I_Salto(String nome, String etiqueta)
    {
        this.nome=nome;
        this.etiqueta=etiqueta;
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

    @Override
    public String toString() {
        return "I_Salto{" + "nome=" + nome + ", etiqueta=" + etiqueta + '}';
    }


}
