/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;


import entity.Trend;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SAKURA
 */
public class TrendDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;
    public List<Trend> getCategoryTrend(Date start,Date end){
        int count=0;
        int sum=0;
        SimpleDateFormat SDF= new SimpleDateFormat("yyyy-MM-dd");
        List<Trend> list=new ArrayList<>();
        try {
            query = "SELECT odr.SubCategoryID,SubCategoryName,SUM(odr.Quantity) AS Count FROM ( SELECT od.ProductID,od.ProductName,od.Quantity,od.Date,SubCategoryID,BrandID FROM (SELECT ProductID,ProductName,Quantity,Date FROM  dbo.Orders JOIN dbo.Order_Detail  ON Order_Detail.Order_ID = Orders.ID ) od JOIN dbo.Product ON Product.ProductID = od.ProductID WHERE od.Date BETWEEN CAST( ? AS DATE) AND CAST( ? AS DATE)  ) odr JOIN dbo.SubCategory ON SubCategory.SubCategoryID = odr.SubCategoryID GROUP BY odr.SubCategoryID,SubCategoryName ORDER BY COUNT DESC";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setString(1,SDF.format(start) );
            ps.setString(2, SDF.format(end));
            rs = ps.executeQuery();
            while (rs.next()) {
                if(count>3)
                    sum+=rs.getInt("Count");
                else
                    list.add( new Trend(rs.getInt("SubCategoryID"),rs.getString("SubCategoryName"),rs.getInt("Count")) );
                count++;
            }
        } catch (SQLException e) {
            Logger.getLogger(TrendDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        if(count>3)
            list.add(new Trend(0,"Other",sum));
        return list;
    }
    public List<Trend> getProductTrend(Date start,Date end){
        int count=0;
        int sum=0;
        SimpleDateFormat SDF= new SimpleDateFormat("yyyy-MM-dd");
        List<Trend> list=new ArrayList<>();
        try {
            query = "SELECT TOP 10 odr.ProductID,odr.ProductName,SUM(odr.Quantity) AS Count  FROM ( SELECT od.ProductID,od.ProductName,od.Quantity,od.Date,SubCategoryID,BrandID FROM  (SELECT ProductID,ProductName,Quantity,Date FROM  dbo.Orders JOIN dbo.Order_Detail  ON Order_Detail.Order_ID = Orders.ID ) od JOIN dbo.Product ON Product.ProductID = od.ProductID WHERE od.Date BETWEEN CAST( ? AS DATE) AND CAST( ? AS DATE) ) odr GROUP BY odr.ProductID, odr.ProductName ORDER BY COUNT DESC";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setString(1,SDF.format(start) );
            ps.setString(2, SDF.format(end));
            System.out.print(ps.toString());
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add( new Trend(rs.getInt("ProductID"),rs.getString("ProductName"),rs.getInt("Count")) );
            }
        } catch (SQLException e) {
            Logger.getLogger(TrendDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        return list;
    }
    public List<Trend> getBrandTrend(Date start,Date end){
        int count=0;
        int sum=0;
        SimpleDateFormat SDF= new SimpleDateFormat("yyyy-MM-dd");
        List<Trend> list=new ArrayList<>();
        try {
            query = "SELECT odr.BrandID,BrandName,SUM(odr.Quantity) AS Count FROM (SELECT od.ProductID,od.ProductName,od.Quantity,od.Date,SubCategoryID,BrandID FROM (SELECT ProductID,ProductName,Quantity,Date FROM  dbo.Orders JOIN dbo.Order_Detail  ON Order_Detail.Order_ID = Orders.ID ) od JOIN dbo.Product ON Product.ProductID = od.ProductID WHERE od.Date BETWEEN CAST( ? AS DATE) AND CAST( ? AS DATE)  ) odr JOIN dbo.Brand ON Brand.BrandID = odr.BrandID GROUP BY odr.BrandID,BrandName ORDER BY COUNT DESC";
            conn = DBcontext.open();
            ps = conn.prepareStatement(query);
            ps.setString(1,SDF.format(start) );
            ps.setString(2, SDF.format(end));
            rs = ps.executeQuery();
            while (rs.next()) {
                if(count>3)
                    sum+=rs.getInt("Count");
                else
                    list.add( new Trend(rs.getInt("BrandID"),rs.getString("BrandName"),rs.getInt("Count")) );
                count++;
            }
        } catch (SQLException e) {
            Logger.getLogger(TrendDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        finally{
            DBcontext.close(conn, ps, rs);
        }
        if(count>3)
            list.add(new Trend(0,"Other",sum));
        return list;
    }
}
