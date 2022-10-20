/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.ProductDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duy Manh
 */
public class ProductDetailDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public List<String> getImages(int pid) {
        ArrayList<String> list = new ArrayList<>();
        try {

            query = "select pi.ProductImgUrl from [OnlineShop].[dbo].[Product] p, [OnlineShop].[dbo].[ProductImg] pi where p.ProductID = pi.ProductID and p.ProductID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("ProductImgURL"));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("loi");
        }

        return null;
    }

    public ProductDetail getProductDetail(int id) {
        ProductDetail p = new ProductDetail();
        List<String> images = getImages(id);
        try {

            query = " select  ProductID, ProductName , Description , OriginalPrice ,\n"
                    + "                SellPrice  , SalePercent , SubCategoryID , SellerID , Amount, StatusID ,BrandID , height  , width ,weight from  [OnlineShop].[dbo].[Product]\n"
                    + "				 where ProductID = ?";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                p = new ProductDetail(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginalPrice"),
                        rs.getDouble("SellPrice"),
                        rs.getDouble("SalePercent"),
                        rs.getInt("SubCategoryID"),
                        rs.getInt("SellerID"),
                        rs.getInt("Amount"),
                        rs.getInt("StatusID"),
                        rs.getInt("BrandID"),
                        rs.getDouble("height"),
                        rs.getDouble("width"),
                        rs.getDouble("weight"),
                      
             
                        images
                );
            }

            return p;
        } catch (SQLException e) {
        }

        return null;
    }

    public static void main(String[] args) {
        ProductDetailDAO dao = new ProductDetailDAO();
        for (int i = 0; i < dao.getProductDetail(10).getImages().size(); i++) {
            System.out.println(dao.getProductDetail(10).getImages().get(i));
        }

    }
}
