/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Customer;
import entity.DatabaseUtils;
import entity.DateHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Duy Manh
 */
public class CustomerDAO {

    public List<Customer> getAll() {
        List<Customer> ls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement sttm = null;
        try {
            String sSQL = "select * from Customers";
            conn = DatabaseUtils.getDBConnect();
            sttm = conn.prepareStatement(sSQL);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setBirthday(DateHelper.todate(rs.getString(3)));
                c.setGender(rs.getBoolean(4));
                c.setEmail(rs.getString(5));
                c.setPhone(rs.getString(6));
                c.setStatus(rs.getString(7));
                c.setPassword(rs.getString(8));
                c.setRegisterDate(DateHelper.todate(rs.getString(9)));
                ls.add(c);                 
            }
        } catch (Exception e) {
            System.out.println("Error => CustomerDAO => getAll" + e.toString());
        }
        return ls;
    }

    public Object findByID(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void insert(Customer cus) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
