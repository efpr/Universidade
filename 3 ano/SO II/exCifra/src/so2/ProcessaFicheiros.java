/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package so2;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;

public class ProcessaFicheiros {


    private String inFile;
    private String outFile;


    public static void main(String[] args) throws java.security.NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException, IOException {
	if (args.length<3) {
            System.err.println("erro: argumentos insuficientes\n"+
                             "java ProcessaFicheiros OPCAO inFilename outFilename");
            System.exit(1);
        }/*
        // gerate key
        javax.crypto.KeyGenerator keyGen = javax.crypto.KeyGenerator.getInstance("DES");
        //keyGen.init();
        javax.crypto.SecretKey secretKey = keyGen.generateKey();
        
        FileOutputStream f = new FileOutputStream("mykey.txt");
        byte[] b = secretKey.getEncoded();
        f.write(b);
        f.close();*/
                
        // get Key
        byte[] b2 = new byte[1024];
        FileInputStream fin = new FileInputStream("mykey.txt");
        int l = fin.read();
        fin.close();
        
        javax.crypto.spec.DESKeySpec skspec = new javax.crypto.spec.DESKeySpec(b2);
        SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = skf.generateSecret(skspec);
        
        // esta parte ate podia dar
        ProcessaFicheiros pf= new ProcessaFicheiros(args[1], args[2]); 
        if (args[0].equals("-copiar"))
            pf.passaDados();
        else if (args[0].equals("-cifrar"))
            pf.cifrar(secretKey);
        else if (args[0].equals("-decifrar"))
            pf.decifrar(secretKey);
        else 
            System.err.println("OPCAO INVALIDA: " + args[0]);

	System.out.println("vou passar dados de ("+args[0]+
			   ") para ("+ args[1]+")\n");
    }

    public void cifrar(SecretKey secretKey) 
    {
        byte[] b= new byte[1024];
	int lidos;

	try {
            javax.crypto.Cipher cipher;
            cipher = javax.crypto.Cipher.getInstance("DES");
            cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, secretKey);
            
	    FileInputStream fis= new FileInputStream(inFile);
	    FileOutputStream fos= new FileOutputStream(outFile);
	    
	    lidos= fis.read(b);
	    while (lidos>0) {
		// escrever os bytes no outro ficheiro
		  byte[] ciphertext = cipher.update(b,0, lidos ); 
		
                  fos.write(ciphertext);
		// e continuar
		lidos= fis.read(b);
	    }
             byte[] ciphertext = cipher.doFinal(); 
             fos.write(ciphertext);
	    fis.close();
	    fos.close();
	}
	catch (Exception e) {
	    e.printStackTrace();
	    System.err.println("PROBLEMA: "+e.getMessage());
	    return;
	}
	System.out.println("----------- ok");
    }
    
    public void decifrar(SecretKey secretKey)
    {
        byte[] b= new byte[1024];
	int lidos;

	try {
            javax.crypto.Cipher cipher;
            cipher = javax.crypto.Cipher.getInstance("DES");
            cipher.init(javax.crypto.Cipher.DECRYPT_MODE, secretKey);
            
	    FileInputStream fis= new FileInputStream(inFile);
	    FileOutputStream fos= new FileOutputStream(outFile);
	    
	    lidos= fis.read(b);
	    while (lidos>0) {
		// escrever os bytes no outro ficheiro
		  byte[] ciphertext = cipher.update(b,0, lidos ); 
		
                  fos.write(ciphertext);
		// e continuar
		lidos= fis.read(b);
	    }
             byte[] ciphertext = cipher.doFinal(); 
             fos.write(ciphertext);
	    fis.close();
	    fos.close();
	}
	catch (Exception e) {
	    e.printStackTrace();
	    System.err.println("PROBLEMA: "+e.getMessage());
	    return;
	}
	System.out.println("----------- ok");
    }
    
    public ProcessaFicheiros(String inFile, String outFile) {
	this.inFile= inFile;
	this.outFile= outFile;
    }


    // faz uma copia simples
    public void passaDados() {
	byte[] b= new byte[1024];
	int lidos;

	try {
	    FileInputStream fis= new FileInputStream(inFile);
	    FileOutputStream fos= new FileOutputStream(outFile);
	    
	    lidos= fis.read(b);
	    while (lidos>0) {
		// escrever os bytes no outro ficheiro
		fos.write(b,0,lidos); 
		
		// e continuar
		lidos= fis.read(b);
	    }
	    fis.close();
	    fos.close();
	}
	catch (Exception e) {
	    e.printStackTrace();
	    System.err.println("PROBLEMA: "+e.getMessage());
	    return;
	}
	System.out.println("----------- ok");
    }


}