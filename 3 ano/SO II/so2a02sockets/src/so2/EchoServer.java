package so2;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EchoServer
{

    private int serverPort;

    public EchoServer(int p)
    {
        serverPort = p;
    }

    public static void main(String[] args)
    {
        System.err.println("SERVER...");
        if (args.length < 1)
        {
            System.err.println("Missing parameter: port number");
            System.exit(1);
        }
        int p = 0;
        try
        {
            p = Integer.parseInt(args[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.exit(2);
        }

        EchoServer serv = new EchoServer(p);
        serv.servico();   // activa o servico
    }

    // activa o servidor no porto indicado em "serverPort"
    public void servico()
    {
        try
        {
            // exercicio 2: inicializar um socket para aceitar ligacoes...
            ServerSocket socket = new ServerSocket(serverPort);

            //ciclo de antendimento ao serviço
            while (true)
            {
                Socket data = socket.accept();

                //ler o pedido
                byte[] msg2 = new byte[256];
                InputStream socketIn = data.getInputStream();
                int lidos = socketIn.read(msg2, 0, 256);

                String msg = new String(msg2, 0, lidos);
                System.out.println("   -------> " + msg);

                msg += " #";
                OutputStream socketOut = data.getOutputStream();
                socketOut.write(msg.getBytes());

                data.close();
            }
        }
        catch (IOException ex)
        {
            Logger.getLogger(EchoServer.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
