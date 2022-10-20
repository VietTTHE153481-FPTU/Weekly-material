/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Duy Manh
 */
public class DatabaseUtils {
    public static final String connectionUrl ="jdbc:sqlserver://localhost:1433;" +
            "databaseName=SWP391_OnlineShop; user=sa; password=123";
    public static Connection getDBConnect(){
        try {
            Connection con = null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(connectionUrl);
            return con;            
        } catch (ClassNotFoundException ex) {
            System.out.println("where is Driver");
        } catch (SQLException ex) {
            System.out.println("error: "+ex.toString());
        }
        return null;
        
    }
}
