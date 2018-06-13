package eshop.model;

import eshop.beans.Artigo;
import eshop.beans.Autor;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Postgres implements ObterDados{

    Connection con = null;

    public Postgres(String host, String db, String user, String pw) {
        /*PG_HOST=host;
        PG_DB= db;
        USER=user;
        PWD= pw;*/
        host="localhost";
        db= "efpr";
        user="efpr";
        pw= "123";
        
        try {
            con = connect(host, db, user, pw);
        } catch (Exception ex) {
            System.out.println("Failed to Connect");
            Logger.getLogger(Postgres.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection connect(String host, String db, String user, String pw) throws Exception {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            // url = "jdbc:postgresql://host:port/database",
            con = DriverManager.getConnection("jdbc:postgresql://" + host + ":5432/" + db,
                    user,
                    pw);

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems setting the connection");
        }
        
        return con;
    }

    public void finish() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
            }
        }
    }

    
    public Artigo dadosArtigo(int codigo_artigo) throws Exception
    {
        // obter dados do artigo
        String code = Integer.toString(codigo_artigo);
        Artigo artigo = new Artigo();   // criação objeto artigo
        artigo.setCode(codigo_artigo);
       
        Statement stmt = con.createStatement();        
        ResultSet rs = stmt.executeQuery("SELECT titulo,stock,vendidos FROM t1_artigo WHERE code="+code);
        // query para obter dados do artigo na nossa base de dados
        while(rs.next())
        {
            artigo.setTitulo(rs.getString("titulo"));
            artigo.setStock(rs.getInt("stock"));
            artigo.setVendidos(rs.getInt("vendidos"));
            // atribuiçao de valores ao objeto artigo criado inicialmente
        }
        rs = stmt.executeQuery("SELECT code_autor FROM t1_artigo_autor WHERE code_artigo="+code);
        // execução de nova query para saber quais os autores do artigo em questão
        
        ArrayList<Integer> autor = new ArrayList<Integer>();
        while(rs.next())
        {
            autor.add(rs.getInt("code_autor"));
            // adicionar todos os autores do artigo a um arraylist de autores
        }
        artigo.setAutor(autor);
        
        rs.close();   
        stmt.close();
        return artigo;
    }
    
    public ArrayList<Artigo> artigosAutor(int codigo_autor) throws Exception
    {
        // obter dados de artigos de um certo autor
        String code = Integer.toString(codigo_autor);
        ArrayList<Artigo> artigo = new ArrayList<Artigo>();
        // arraylist para guardar todos os artigos do autor
        
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT code_artigo FROM t1_artigo_autor WHERE code_autor="+code);
        // query para obter o codigo de todos os artigos desse autor
        while(rs.next())
        {
            Artigo a = dadosArtigo(rs.getInt("code_artigo"));
            // obter dados de cada artigo
            artigo.add(a);
            // colocar os dados num arraylist de artigos
        }
        
        rs.close();
        stmt.close();
              
        return artigo;
    }
    
    public ArrayList<Autor> maisVendas() throws Exception
    {
        // calcular o autor com mais vendas
        ArrayList<Autor> autor = new ArrayList<Autor>();
        // arraylist de autores pois pode haver mais que um autor com mais vendas
       
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("select t1_autor.code, t1_autor.nome, t1_autor.email FROM" +
                                            "        (select max(vendidos) as maxi FROM" +
                                            "                (select t1_artigo_autor.code_autor as code, sum(vendidos) as vendidos from" +
                                            "                t1_artigo, t1_artigo_autor" +
                                            "                where t1_artigo_autor.code_artigo = t1_artigo.code" +
                                            "                group by t1_artigo_autor.code_autor) as tab) as max," +
                                            "        (select t1_artigo_autor.code_autor as code, sum(vendidos) as vendidos from" +
                                            "        t1_artigo, t1_artigo_autor" +
                                            "        where t1_artigo_autor.code_artigo = t1_artigo.code" +
                                            "        group by t1_artigo_autor.code_autor) as tab1 " +
                                            "    INNER JOIN t1_autor on tab1.code=t1_autor.code" +
                                            "where tab1.vendidos = max.maxi");
        // query para obter os autores com mais vendas
        
        int i=0;
        while(rs.next())
        {
            Autor a = new Autor();
            a.setCode(rs.getInt("cod"));
            a.setNome(rs.getString("nome"));
            a.setEmail(rs.getString("mail"));
            autor.add(a);
        }
        // adicionar cada autor ao arraylist de autores
        rs.close();
        stmt.close();
        return autor;
    }
    
    public synchronized int comprarArtigo(int codigo_artigo, int n) throws Exception
    {
        // executar uma compra de n artigos
        Artigo artigo = dadosArtigo(codigo_artigo);
        // obter dados do artigo a comprar
        
        System.out.println("STOCK: " + artigo.getStock());
        if(artigo.getStock() < n)   // se não houver stock suficiente cancelar a compra
            return -1;
        
        Statement stmt = con.createStatement();
        
        artigo.setStock(artigo.getStock()-n);
        artigo.setVendidos(artigo.getVendidos()+n);
        stmt.executeUpdate("UPDATE t1_artigo SET stock="+artigo.getStock()+" , vendidos="+artigo.getVendidos()+ " WHERE code="+artigo.getCode());
        stmt.executeUpdate("INSERT INTO  t1_compras (c_artigo,quantidade) VALUES("+artigo.getCode()+","+n+")");
        // querys para atualizar o artigo (stock e numero de vendas) e a tabela de compras
        
        stmt.close();
        
        return 1;
    }
    
    
}
