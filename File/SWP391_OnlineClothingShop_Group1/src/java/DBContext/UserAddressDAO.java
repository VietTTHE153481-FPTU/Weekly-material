/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.UserAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SAKURA
 */
public class UserAddressDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    public UserAddress getUserAddress(int id) {
        UserAddress ua = null;
        try {
            query = "SELECT * from dbo.UserAddress WHERE UserID = ? ";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ua=new UserAddress(rs.getInt("ID"),rs.getInt("UserID"),rs.getString("ShipName"),rs.getString("ShipAddress"),rs.getInt("ShipCityID"),rs.getString("PhoneNum"));
            }
        } catch (SQLException e) {
            Logger.getLogger(UserAddressDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return ua;
    }
}
