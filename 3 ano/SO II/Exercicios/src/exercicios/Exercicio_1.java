/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exercicios;

/**
 *
 * @author Eduardo
 */
public class Exercicio_1
{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        byte[] b = new byte[128];
        int lidos = System.in.read(b);
        System.out.println(Integer.parseInt(new String(b, 0, lidos - 1)) + 1);
    }

}
