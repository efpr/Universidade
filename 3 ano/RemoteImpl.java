package trabalho1;

/**
 *
 * @author Pedro
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.*;
import java.util.LinkedList;

public class RemoteImpl extends UnicastRemoteObject implements RemoteIf, java.io.Serializable
{
    private String PG_HOST;
    private String PG_DB;
    private String USER;
    private String PWD;

    private Connection con = null;

    public RemoteImpl() throws java.rmi.RemoteException
    {
        Properties();

        try
        {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://" + PG_HOST + ":5432/" + PG_DB,
                    USER,
                    PWD);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.err.println("Problems setting the connection");
        }
    }

    public void Properties()
    {
        try
        {
            java.util.Properties connection = new java.util.Properties();

            FileInputStream file = new FileInputStream("Properties.properties");
            connection.load(file);
            file.close();

            PG_HOST = connection.getProperty("URL");
            PG_DB = connection.getProperty("BD");
            USER = connection.getProperty("USER");
            PWD = connection.getProperty("PASSWORD");
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }


    //Resposta ao primeiro ponto.
    @Override
    public String dadosArtigo(int X) throws java.rmi.RemoteException
    {
        String r = null;
        int A = X;
        System.out.println(X);
        try
        {
            System.out.println("ESTOU AQUI");
            String code, title;
            int stock, vendas;

            //Select de todos os campos do artigo X.
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM artigo WHERE codeartigo =" + A);
            System.out.println(rs.toString());
            while(rs.next())
            {
            code = rs.getString("codeartigo");
            title = rs.getString("titartigo");

            stock = rs.getInt("numstock");
            vendas = rs.getInt("numvendidos");
            r = "Dados: " +"código: "+ code+ ", título: " + title+ ", stock: " + stock+ ", vendas: " + vendas + ".";

            }
            rs.close();
            return r;

        }catch(Exception e)
        {
            System.out.println("Existem erros no programa.");
        }
        /*
        if(r.equals(""))
        {
            return "Nada.";
        }*/
        return r;
    }


}
