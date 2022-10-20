/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jdk.nashorn.internal.ir.TryNode;

/**
 *
 * @author Admin
 */
public class LoginDAO {
    Connection conn =null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Users login(String user, String pass){
        try {
            String query ="select * from Users where Username = ? and [Password] = ?";
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
        }
        DBcontext.close(conn, ps, rs);
        return null;
    }
     public Users checkUserExist(String user){
        try {
            String query ="select * from Users where Username = ?";
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            
            rs = ps.executeQuery();
            while(rs.next()){
                
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
        }
        DBcontext.close(conn, ps, rs);
        return null;
    }
    public void register(String user, String pass , String email){
        String query = "insert into Users\n"
                + "Values('?','?','?',3,1)";
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        DBcontext.close(conn, ps, rs);
    }
}
