/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Delivery;
import entity.Order;
import entity.Ship;
import entity.ShipInfo;
import entity.Users;
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
public class ShipDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public ArrayList<Ship> getShip() {
        ArrayList<Ship> list = new ArrayList<>();
        try {
            query = "SELECT * from dbo.Ship";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Ship(rs.getInt("id"), rs.getString("CityName"), rs.getInt("ShipPrice")));
            }
        } catch (SQLException e) {
            Logger.getLogger(ShipDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            DBcontext.close(conn, ps, rs);
        }
        return list;
    }

    public Ship getShip(int id) {
        Ship ship = null;
        try {
            query = "SELECT * from dbo.Ship where id=?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ship = new Ship(rs.getInt("id"), rs.getString("CityName"), rs.getInt("ShipPrice"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ShipDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            DBcontext.close(conn, ps, rs);
        }
        return ship;
    }

    public ShipInfo getShipInfoByOdID(int orderID) {
        String query = " select * from ShipInfo where Order_ID = ? ";
        try {

            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ShipInfo(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        DBcontext.close(conn, ps, rs);
        return null;
    }

    public ArrayList<ShipInfo> getShipInfoByOrder(ArrayList<Order> listOrder) {
        String query = "";
        ArrayList<ShipInfo> list = new ArrayList<>();

        try {
            conn = new DBcontext().open();

            for (int i = 0; i < listOrder.size(); i++) {
                if (i == 0) {
                    query += "select * from ShipInfo where Order_ID = " + listOrder.get(i).getId();
                } else {
                    query += " or Order_ID = " + listOrder.get(i).getId();
                }
            }
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ShipInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addJob(int jid, int userID) {
        String query = "insert Delivery values ( ? , ? , 2 )";
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, jid);
            ps.setInt(2, userID);
            ps.executeQuery();
        } catch (Exception e) {
        }

    }

    public ArrayList<Delivery> getDeliveryJobByShipper(int userID) {
        ArrayList<Delivery> list = new ArrayList<>();
        String query = "select * from Delivery \n"
                + "where UserID =  ? ";

        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean CheckJobExist(int jid, ArrayList<Delivery> list) {
        boolean flag = false;
        for (Delivery delivery : list) {
            if (jid == delivery.getShipInfo()) {
                flag = true;
            }

        }
        return flag;
    }

    public void confirmJob(int jid, String action) {
        String query = "";
        switch (action) {
            case "Accomplished":
                query = "update Delivery set Status = 1 where ShipInfoID = ? ";
                break;
            case "Delivery failed":
                query = "update Delivery set Status = 3 where ShipInfoID =  ? ";
                break;
        }

        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, jid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Delivery> getJobByShipper(int userID) {
        String query = "select * From delivery \n"
                + "                where UserID = ? ";
        ArrayList<Delivery> list = new ArrayList<>();
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<ShipInfo> getShipInfoByJob(ArrayList<Delivery> listJob) {
        String query = "";
        ArrayList<ShipInfo> list = new ArrayList<>();
        for (int i = 0; i < listJob.size(); i++) {
            if (i == 0) {
                query = "select * from ShipInfo \n"
                        + "where  ID = " + listJob.get(i).getShipInfo();
            } else {
                query += " or  ID = " + listJob.get(i).getShipInfo();;
            }
        }
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ShipInfo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;

    }

}
