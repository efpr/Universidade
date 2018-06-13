/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.trabalho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author dias
 */
public class OpBD {
    
    Connection con = null;
    Statement stmt = null;

    public OpBD(String host, String db, String user, String pw) {
       try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://"+ host + ":5432/" + db, user, pw);
            stmt = con.createStatement();
            if (stmt != null)
                System.out.println("Ligado á BD");
            else
                System.out.println("Oops! Could not connect...");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Oops! Exception when connecting..");
        }
   }
    
   public void getArticle(int codigo){
       try {
           ResultSet rs = stmt.executeQuery("SELECT idQuest, NomeQuest, tamanhoQuest FROM questionarios");
            
        } catch(Exception e) {
            System.err.println("Oops! Something went wrong inserting!");
        }
   }
    
}
