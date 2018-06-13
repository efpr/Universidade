/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eshop.model;
import eshop.beans.Artigo;
import eshop.beans.Autor;

import java.util.ArrayList;

/**
 *
 * @author efpr
 * @author jdias
 * 
 */
public interface ObterDados
{
    public Artigo dadosArtigo(int i_code) throws Exception;
    public ArrayList<Artigo> artigosAutor(int i_code) throws Exception;
    public ArrayList<Autor> maisVendas() throws Exception;
    public int comprarArtigo(int i_code, int n) throws Exception;
    
    public void finish();
}
