/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.model;

import eshop.beans.Artigo;
import eshop.beans.Autor;
import java.util.ArrayList;
import javax.servlet.ServletContext;


public class DataManager implements ObterDados{
    
    private static ObterDados dbManager;
    
    public DataManager(ServletContext context)
    {
        dbManager = new Postgres(
                (String) context.getAttribute("dbURL"),
                (String) context.getAttribute("dbName"),
                (String) context.getAttribute("dbUser"),
                (String) context.getAttribute("dbPassword"));
       
            
    }

    @Override
    public Artigo dadosArtigo(int i_code) throws Exception {
        return dbManager.dadosArtigo(i_code);
    }

    @Override
    public ArrayList<Artigo> artigosAutor(int i_code) throws Exception {
        return dbManager.artigosAutor(i_code);
    }

    @Override
    public ArrayList<Autor> maisVendas() throws Exception {
        return dbManager.maisVendas();
    }

    @Override
    public int comprarArtigo(int i_code, int n) throws Exception {
       return dbManager.comprarArtigo(i_code, n);
    }

    @Override
    public void finish() {
        dbManager.finish();
    }
    
}
