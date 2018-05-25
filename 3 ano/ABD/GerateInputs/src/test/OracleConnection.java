/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author efpr
 */
public class OracleConnection {
    
    private Connection connection = null;
    
    public OracleConnection()
    {
        start();
    }
    
    public void start()
    {
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (ClassNotFoundException e) {
            System.out.println("Falta o Oracle JDBC Driver");
            return;

        }

        try {
            // Não sei as cenas
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "password");

        } catch (SQLException e) {
            System.out.println("Falhou a iniciar");
            return;

        }
    }
    
    public Connection getConnection()
    {
        return connection;
    }
    
    public void close()
    {
        try {
            connection.close();
        } catch (SQLException ex) {
            System.out.println("Falhou a fechar");
            return;
        }
    }
}
