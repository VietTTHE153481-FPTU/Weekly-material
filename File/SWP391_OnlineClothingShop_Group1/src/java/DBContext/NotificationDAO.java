/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SAKURA
 */
public class NotificationDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    public void addNotification(Notification notification)  {
        try {
            query = "INSERT INTO dbo.[Notifications] VALUES (?,?,?,0,GETDATE())";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, notification.getUserID());
            ps.setInt(2,notification.getOrderID());
            ps.setNString(3, notification.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
    }
    public ArrayList<Notification> getAllNotification(int id) {
        ArrayList<Notification> list = new ArrayList<>();
        try {
            query = "SELECT * FROM dbo.[Notifications] WHERE UserID = ? ORDER BY [status] ASC, [time] DESC";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getInt("ID"),rs.getInt("UserID"), rs.getInt("OrderID"), rs.getString("Content"), rs.getInt("status"), rs.getDate("time")));
            }
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return list;
    }
    public void markAsRead(int id,int notiId){
        try {
            query = "UPDATE dbo.Notifications set status=1 where UserID = ? and ID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, notiId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
    }
    public void readAll(int id){
        try {
            query = "UPDATE dbo.Notifications set status=1 where UserID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
    }
}
