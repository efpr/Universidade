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
    public static void main(String[] args) throws Exception
    {
        // 1
        for(java.security.Provider i : java.security.Security.getProviders())
            System.out.println(i.getName() + " v." + i.getVersion());
        // 2
        System.out.println();
        for(java.security.Provider.Service i : java.security.Security.getProviders()[0].getServices())
            System.out.println(i);
        // 3
        System.out.println();
        for(String i : java.security.Security.getAlgorithms("Cipher"))
            System.out.println(i);
        // 4
        java.security.KeyStore ks = java.security.KeyStore.getInstance("PKCS12");
            
        javax.crypto.KeyGenerator keyGen = javax.crypto.KeyGenerator.getInstance("AES");
        keyGen.init(256);
        javax.crypto.SecretKey secretKey = keyGen.generateKey();
        System.out.println("Algorithm: " + secretKey.getAlgorithm() + "\tFormat: " + secretKey.getFormat());

        byte[] password = secretKey.getEncoded();
        java.io.FileInputStream f = new java.io.FileInputStream("keyStoreName");
        
        //// CONTINUAR

        
        // 5
        javax.crypto.Cipher cipher;

        cipher = javax.crypto.Cipher.getInstance("AES");
        cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, secretKey);
        /* para vários blocos usar-se-ia o método update() (multiple-part encryption)
           até ao penúltimo bloco, seguido de doFinal()
        */
        
        String MSG = "Exemplo";

        byte[] plaintext = MSG.getBytes();
        byte[] ciphertext = cipher.doFinal( plaintext );  // cifrar num "bloco" só

        // teste rápido para ver o q fica, que não será visível:
        System.out.println( new String(ciphertext) );
    }
    
    
}
