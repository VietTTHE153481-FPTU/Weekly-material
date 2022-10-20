/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Cart;
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
public class CartDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    public ArrayList<Cart> getCart(int id) {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            query = "SELECT Cart.ProductID,pro.ProductName,Cart.Amount,pro.SellPrice,pro.ProductImgURL FROM dbo.Cart JOIN (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,MIN(p.height) AS height,MIN(p.width) AS width,MIN(p.weight) AS weight,MIN(ProI.ProductImgURL) AS ProductImgURL FROM dbo.Product p JOIN  dbo.ProductImg ProI ON ProI.ProductID = p.ProductID GROUP BY p.ProductID ) pro ON pro.ProductID = Cart.ProductID WHERE Cart.UserID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Amount"),rs.getInt("SellPrice"),rs.getString("ProductImgURL")));
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return list;
    }
    public int getCartAmount(int id) {
        int res=0;
        try {
            query = "SELECT Cart.ProductID,pro.ProductName,Cart.Amount,pro.SellPrice,pro.ProductImgURL FROM dbo.Cart JOIN (SELECT p.ProductID,MIN(p.ProductName) AS ProductName,MIN(p.Description) AS Description,MIN(p.OriginalPrice) AS OriginalPrice,MIN(p.SellPrice) AS SellPrice,MIN(p.SalePercent) AS SalePercent,MIN(p.SubCategoryID) AS SubCategoryID,MIN(p.SellerID) AS SellerID,MIN(p.Amount) AS Amount,MIN(p.StatusID) AS StatusID,MIN(p.BrandID) AS BrandID,MIN(p.height) AS height,MIN(p.width) AS width,MIN(p.weight) AS weight,MIN(ProI.ProductImgURL) AS ProductImgURL FROM dbo.Product p JOIN  dbo.ProductImg ProI ON ProI.ProductID = p.ProductID GROUP BY p.ProductID ) pro ON pro.ProductID = Cart.ProductID WHERE Cart.UserID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                res+= rs.getInt("Amount");
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return res;
    }
    public void plusCart(int id,int productId) {
        try {
            query = "Update dbo.Cart Set Amount = Amount+1 Where UserID = ? And ProductID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
    public void minusCart(int id,int productId) {
        try {
            query = "Update dbo.Cart Set Amount = Amount-1 Where UserID = ? And ProductID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
    public void deleteCart(int id,int productId) {
        try {
            query = "DELETE from dbo.Cart Where UserID = ? And ProductID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
    public void removeCart(int id) {
        try {
            query = "DELETE from dbo.Cart Where UserID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
    public void validCart() {
         try {
            query = "DELETE FROM dbo.Cart WHERE Amount = 0";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
    public void addtoCart(int id,int productId) {
        try {
            query = "Update dbo.Cart Set Amount = Amount+1 Where UserID = ? And ProductID = ?";
            conn = DBcontext.open(); 
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            long Updatedline = ps.executeUpdate();
            if (Updatedline == 0){
                query = "INSERT INTO dbo.Cart VALUES( ? , ? , 1 )";           
                ps = conn.prepareStatement(query);
                ps.setInt(1, id);
                ps.setInt(2, productId);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return;
    }
}
