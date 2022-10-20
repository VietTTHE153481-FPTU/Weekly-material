///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import entity.Product;
//import entity.ProductAll;
//import entity.ProductDetailImg;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @author Duy Manh
// */
//public class ProductDetailsDAO {
//
//    Connection conn = null;
//    PreparedStatement ps = null; //...
//    ResultSet rs = null; //Get the results returned
//
//    public ProductAll GetProductDetailsByProductID(int productID) {
//        Product product = null;
//        ProductDetailImg productImg = null;
//        ProductAll productAll = null;
//        String query = "select * from Product \n"
//                + "JOIN ProductImg \n"
//                + "On Product.ProductID = ProductImg.ProductID\n"
//                + "where Product.ProductID = ? ";
//        try {
//            conn = new DBcontext().open(); // open connection
//            ps = conn.prepareStatement(query); // open complie sql statement 
//            ps.setInt(1, productID);
//            rs = ps.executeQuery(); // run statement
//            if (rs.next()) { // traverse from beginning to end all rows in the product table in the database
//                product = new Product(rs.getInt("ProductID"), rs.getString("ProductName"),
//                        rs.getString("Description"),
//                        rs.getFloat("OriginalPrice"), rs.getFloat("SellPrice"), rs.getFloat("SalePercent"),
//                        rs.getInt("SubCategoryID"), rs.getInt("SellerID"), rs.getInt("Amount"),
//                        rs.getInt("StatusID"), rs.getInt("BrandID"),
//                        rs.getFloat("height"), rs.getFloat("width"), rs.getFloat("weight"));
//                productImg = new ProductDetailImg(rs.getInt("productID"),rs.getString("ProductImgURL"),
//                        rs.getString("Fullimage"),
//                        rs.getString("TopImage"), rs.getString("BottomImage"), rs.getString("Other"));
//                productAll = new ProductAll(product, productImg);
////                int productID ; 
////    String productImgURL ; 
////    String fullImg ;  
////    String topImg ; 
////    String bottomImg ; 
////    String otherImg ;
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        DBcontext.close(conn, ps, rs);
//        return productAll;
//    }
//}
