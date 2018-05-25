/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

/**
 *
 * @author efpr
 */
public class Main {
    public static void main(String[] args) {
        
        
        OracleConnection oracle = new OracleConnection();
        
        Gerate g = new Gerate(oracle.getConnection());
        
        // True: pelo oracle
        // False: cria ficheiros
        
        // numero de inst a criar
        int X = 1000000;
        
        for(int i=0; i<X;i++)
            g.genarate_inst(i, false);
    }
}
