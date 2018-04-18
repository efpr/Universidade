package so2;

import java.io.*;
import java.net.*;
import java.util.Vector;

public class VeiculosServer
{

    private int serverPort;

    private Vector<Registo> repositorio;

    public VeiculosServer(int p)
    {
        serverPort = p;
        repositorio = new Vector<>(); // INICIALIZE o Vector
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

        VeiculosServer serv = new VeiculosServer(p);
        serv.servico();   // activa o servico
    }

    public void servico()
    {

        try
        {
            // inicializa o socket para receber ligacoes
            ServerSocket socket = new ServerSocket(serverPort);
            while (true)
            {
                // espera uma ligacao
                // ... accept()
                Socket data = socket.accept();

                try
                {
                    Object objPedido = null;
                    // le os dados do pedido, como um OBJECTO "objPedido"		
                    InputStream is = data.getInputStream();
                    ObjectInputStream ois = new ObjectInputStream(is);
                    objPedido = ois.readObject();
                    // apreciar o objecto com o pedido recebido:
                    if (objPedido == null)
                    {
                        System.err.println("PEDIDO NULL: esqueceu-se de alguma coisa");
                    }

                    if (objPedido instanceof PedidoDeConsulta)
                    {
                        PedidoDeConsulta pc = (PedidoDeConsulta) objPedido;

                        // procurar o registo associado a matricula pretendida
                        String matricula = pc.getMatricula();
                        // pesquisar no servidor (Vector, mais tarde num ficheiro)
                        Object o = null;
                        for (int i = 0; i < repositorio.size(); i++)
                        {
                            Registo r = repositorio.get(i);
                            if (r.getMatricula().equals(matricula))
                            {
                                o = r;
                                break;
                            }
                        }
                        // enviar objecto Cliente via socket		    
                        // se encontra devolve o registo, se não, devolve um novo objecto ou string a representar que nao encontrou
                        OutputStream os = data.getOutputStream();
                        ObjectOutputStream oos = new ObjectOutputStream(os);
                        if (o == null)
                        {
                            o = "Não encontrou";
                        }

                        oos.writeObject(o);

                    }
                    else if (objPedido instanceof PedidoDeRegisto)
                    {
                        PedidoDeRegisto pr = (PedidoDeRegisto) objPedido; // ...

                        // ver se ja existia registo desta matricula
                        Registo r = pr.getRegisto();
                        boolean o = false;
                        for (Registo i : repositorio)
                        {
                            if (r.equals(i))
                            {
                                o = true;
                                break;
                            }
                        }
                        // adicionar ao rep local (se nao e' uma repeticao)
                        if (!o)
                        {
                            repositorio.add(r);
                        }
                        // responder ao cliente
                        OutputStream os = data.getOutputStream();
                        ObjectOutputStream oos = new ObjectOutputStream(os);
                        oos.writeObject("OK");
                    }
                    else
                    {
                        System.out.println("PROBLEMA");
                    }

                }
                catch (Exception exNoAtendimento)
                {
                    exNoAtendimento.printStackTrace();
                }
                finally
                {  // fechar o socket de dados
                    // fechar o socket de dados dedicado a este cliente:
                    try
                    {
                        data.close();
                    }
                    catch (Exception e002)
                    {
                    }
                }

            }  // ... ciclo de atendimento

        }
        catch (Exception problemaBindAccept)
        {
            problemaBindAccept.printStackTrace();
        }

    }

}
