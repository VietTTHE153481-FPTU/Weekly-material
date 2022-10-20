/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author BEAN
 */
public class DBcontext {
        public static Connection open()
        {
            try {
                String server="localhost";
                String databasename="OnlineShop";
                String username="sa";
                String password="123";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                return DriverManager.getConnection("jdbc:sqlserver://"+server+":1433;databaseName="+databasename,username,password);

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }
        public static void close(Connection conn,Statement stmt,ResultSet rs)
        {
            if(stmt!=null)
            {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(conn!=null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBcontext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }   
    
}
