/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ottelia
 */
public class ChatFriendDAO {
    


    public ArrayList<Integer> getYourChatFriendId(int yourId) throws Exception {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        ArrayList<Integer> idList = new ArrayList();
        
        String sql = "select friendId from ChatFriend where uId= ?";
               
        try{
                conn = new DBcontext().open();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,yourId);
            
            rs = ps.executeQuery();
            
            int friendId = 0;
            
            while(rs.next()) {
                friendId=rs.getInt("friendId");
                idList.add(friendId);
            }
            
            ps.close();
            
        } catch (SQLException e) {
            throw e;
        }
        return idList;
    }


    public int checkIfNotFriendYetToAdd(int yourId, int friendId) throws Exception {
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int status = 0;
        
        String sql = "If Not Exists(select * from ChatFriend where [uId]=? and friendId=?) \n" +
                        " Begin\n" +
                        " insert into ChatFriend values (?,?);\n" +
                        " insert into ChatFriend values (?,?);\n" +
                        " End";
               
        try{
                conn = new DBcontext().open();
            ps = conn.prepareStatement(sql);
            
            ps.setInt(1,yourId);
            ps.setInt(2, friendId);
            
            ps.setInt(3, yourId);
            ps.setInt(4, friendId);
            
            ps.setInt(5, friendId);
            ps.setInt(6, yourId);
            
            status = ps.executeUpdate();
            
            ps.close();
            
        } catch (SQLException e) {
            throw e;
        } 
        return status;
    }
}
