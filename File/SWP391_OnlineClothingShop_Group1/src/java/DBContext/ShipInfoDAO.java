/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.ShipInfo;
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
public class ShipInfoDAO {
    Connection conn = null;
    PreparedStatement ps = null; //...
    ResultSet rs = null; //Get the results returned
    public int addShipInfo(ShipInfo shipinfo){
        try {           
            conn= DBcontext.open();
            ps = conn.prepareStatement("INSERT INTO dbo.ShipInfo (Order_ID,CustomerName,ShippingAddress,ShipCityID,PhoneNum,Note) VALUES(?,?,?,?,?,?)");
            ps.setInt(1,shipinfo.getOrderID());
            ps.setNString(2, shipinfo.getCustomerName());
            ps.setNString(3, shipinfo.getShippingAddress());
            ps.setInt(4,shipinfo.getShipCityID());
            ps.setString(5, shipinfo.getPhoneNum());
            ps.setNString(6, shipinfo.getNote());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ShipInfoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            DBcontext.close(conn, ps,rs);
        }
        return 0;
    }
}
