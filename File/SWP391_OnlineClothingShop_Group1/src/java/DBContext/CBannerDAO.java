/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.CBanner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author SAKURA
 */
public class CBannerDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    
    public CBanner getCBanner(int id)
    {
        CBanner cbanner = null;
        try {
            query = "SELECT * FROM dbo.CBanner WHERE ID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                cbanner = new CBanner(rs.getInt("ID"),rs.getString("Img"),rs.getString("Title"),rs.getString("desc"));
            }
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return cbanner;
    }
    public ArrayList<CBanner> getAllCBanner() {
        ArrayList<CBanner> list = new ArrayList<>();
        try {
            query = "SELECT * FROM dbo.CBanner";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CBanner(rs.getInt("ID"),rs.getString("Img"),rs.getString("Title"),rs.getString("desc")));
            }
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return list;
    }
    public void addCBanner(CBanner cbanner){
        try {
            query = "INSERT INTO dbo.CBanner VALUES ( ? , ? , ? )"   ;
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, cbanner.getImg());
            ps.setNString(2, cbanner.getTitle());
            ps.setNString(3, cbanner.getDesc());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
    }
    public void editCBanner(CBanner cbanner){
           try {
            query = "UPDATE dbo.CBanner SET Img = ?,Title = ? , [desc] = ? WHERE ID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setString(1, cbanner.getImg());
            ps.setNString(2, cbanner.getTitle());
            ps.setNString(3, cbanner.getDesc());
            ps.setInt(4, cbanner.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
    }
    public void deleteCBanner(int id){
        try {
            query = "DELETE FROM dbo.CBanner WHERE ID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CBanner.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        
    }
}
