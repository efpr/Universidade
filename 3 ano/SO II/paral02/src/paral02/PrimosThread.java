package paral02;

/**
 *
 * @author jsaias
 */
public class PrimosThread extends Thread
{

    int inicio;
    int fim;

    public PrimosThread()
    {
        super();
        this.inicio = 0;
        this.fim = 10;
    }

    public PrimosThread(int inicio, int fim)
    {
        super();
        this.inicio = inicio;
        this.fim = fim;
    }

    @Override
    public void run()
    {
        Primos p = new Primos(inicio, fim);
        p.go();
    }

    public static void main(String[] args)
    {
        PrimosThread primo_1 = new PrimosThread(0, 50000);
        PrimosThread primo_2 = new PrimosThread(50000, 100000);
        PrimosThread primo_3 = new PrimosThread(100000, 150000);
        PrimosThread primo_4 = new PrimosThread(150000, 200000);

        primo_1.start();
        primo_2.start();
        primo_3.start();
        primo_4.start();
    }
}
