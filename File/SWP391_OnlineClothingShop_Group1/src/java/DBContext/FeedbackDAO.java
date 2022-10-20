/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ottelia
 */
public class FeedbackDAO {

   
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    public ArrayList<Feedback> getAllFeedbacks() {
        query = "SELECT * FROM Feedback";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a feedback by id
     *
     * @param id the id of the feedback
     * @return a feedback with the specified id
     */
    public Feedback getFeedbacksById(int id) {
        String query = "SELECT * FROM Feedback WHERE ID = ?";
        try {
            Feedback f;
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);           
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                return f;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a list of feedback by product id
     *
     * @param productId the id of the product
     * @return a list of feedback
     */
    public ArrayList<Feedback> getFeedbacksByProductId(int productId) {
        String query = "SELECT * FROM Feedback WHERE ProductID = ?";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);           
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a list of feedback by user id
     *
     * @param userId the id of the user
     * @return a list of feedback
     */
    public ArrayList<Feedback> getFeedbacksByUserId(int userId) {
        String query = "SELECT * FROM Feedback WHERE UserID = ?";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);      
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a list of feedback by user id and product id
     *
     * @param userId the id of the user
     * @param productId the id of the product
     * @return list of feedback with the user id and product id
     */
    public ArrayList<Feedback> getFeedbacksByUserIdAndProductId(int userId, int productId) {
        String query = "SELECT * FROM Feedback WHERE UserID = ?"
                + " AND ProductID = ?";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);           
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get a feedback by order id
     *
     * @param orderId the id of the order
     * @return a list of feedback with the order id
     */
    public ArrayList<Feedback> getFeedbacksByOrderId(int orderId) {
        String query = "SELECT * FROM Feedback WHERE OrderID = ? ";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);         
            ps.setInt(1, orderId);

            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
public ArrayList<Feedback> getFeedbacksBySellerId(int sellerId) {
        String query = "SELECT * FROM (dbo.Feedback f JOIN dbo.Product p ON  p.ProductID=f.ProductID) JOIN dbo.Users u ON  u.UserID=p.SellerID WHERE f.UserID=?";
        try {
            ArrayList<Feedback> lsFeedback = new ArrayList<>();
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);         
            ps.setInt(1, sellerId);

            rs = ps.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                lsFeedback.add(f);
            }
            return lsFeedback;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * Add a feedback to the database
     *
     * @param theFeedback to add to database
     * @return true if add successful, else false
     */
    public void addFeedback(Feedback feedback) {
        String query = "INSERT INTO Feedback VALUES (?, ?, ?, ?, ?);";     
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
           
            //Set data to the "?"
            ps.setInt(1, feedback.getUserID());
            ps.setInt(2, feedback.getProductID());
            ps.setInt(3, feedback.getOrderID());
            ps.setInt(4, feedback.getStar());
            ps.setString(5, feedback.getFeedbackDetail());
            ps.executeUpdate();
        } catch (Exception e) {

        }
       
    }
    public Feedback getFeedbackByOrderIdAndProductId(int orderId, int ProductId){
        String query = "select * from Feedback where OrderID =? and ProductID =?";
        try {
            Feedback f;
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);           
            ps.setInt(1, orderId);
            ps.setInt(1, ProductId);
            rs = ps.executeQuery();
            if (rs.next()) {
                f = new Feedback(
                        rs.getInt("ID"),
                        rs.getInt("UserID"),
                        rs.getInt("ProductID"),
                        rs.getInt("OrderID"),
                        rs.getInt("Star"),
                        rs.getString("FeedbackDetail")
                );
                return f;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get total count of all feedback
     *
     * @return total count of all feedback
     */
    public int countTotalFeedback() {
        return getAllFeedbacks().size();
    }

}
