package so2;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EchoClient
{

    private String address = null;
    private int sPort = 0;

    public EchoClient(String add, int p)
    {
        address = add;
        sPort = p;
    }

    public static void main(String[] args)
    {
        // exigir os argumentos necessarios
        if (args.length < 3)
        {
            System.err.println("Argumentos insuficientes:  java EchoClient ADDRESS PORT MSG");
            System.exit(1);
        }

        try
        {
            String addr = args[0];
            int p = Integer.parseInt(args[1]);

            EchoClient cl = new EchoClient(addr, p);

            // ler o texto a enviar ao servidor
            String s = args[2];

            cl.go(s);   // faz o pretendido
        }
        catch (Exception e)
        {
            System.out.println("Problema no formato dos argumentos");
            e.printStackTrace();
        }
    }

    public void go(String msg)
    {
        // exercicio 1: mostrar a mensagem que vai ser enviada
        // ...
        System.out.println("VOU ENVIAR: " + msg);

        // ... exercicio 3
        Socket s;
        try
        {
            s = new Socket(address, sPort);
            // ja esta connected
            // escrever a mensagem?
            OutputStream socketOut = s.getOutputStream();
            socketOut.write(msg.getBytes());

            // ler a resposta
            byte[] msg2 = new byte[256];
            InputStream socketIn = s.getInputStream();
            int lidos = socketIn.read(msg2, 0, 256);

            System.out.println("O SERVIDOR ENVIOU: " + new String(msg2, 0, lidos));

        }
        catch (Exception ex)
        {
            Logger.getLogger(EchoClient.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }

        //...exercicio 
    }

}
