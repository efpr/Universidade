/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package so2;

/**
 *
 * @author efpr
 */
public class Cifra
{
    public static void main(String[] args)
    {
        
        for(java.security.Provider i : java.security.Security.getProviders())
            System.out.println(i.getName() + " v." + i.getVersion());
        
        System.out.println();
        for(java.security.Provider.Service i : java.security.Security.getProviders()[0].getServices())
            System.out.println(i);
        
        System.out.println();
        for(String i : java.security.Security.getAlgorithms("Cipher"))
            System.out.println(i);
        
        
    }
    
    
}
