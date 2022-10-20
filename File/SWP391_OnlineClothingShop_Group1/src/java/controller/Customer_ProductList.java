/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.BannerDAO;
import DBContext.ProductDAO;
import entity.Banner;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import util.StringDecode;
/**
 *
 * @author Bach Ngoc Minh Chau HE153019
 */
public class Customer_ProductList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Query Parameter
        int page=Integer.parseInt(request.getParameter("page"));
        String query=StringDecode.decode(request.getParameter("query"));
        int subcategory=Integer.parseInt(request.getParameter("subcategory"));
        int brand=Integer.parseInt(request.getParameter("brand"));
        int price=Integer.parseInt(request.getParameter("price"));
        int sortType=Integer.parseInt(request.getParameter("sortType"));
        int sortMode=Integer.parseInt(request.getParameter("sortMode"));
        // Return Parameter Back
        request.setAttribute("page",page);
        request.setAttribute("query", query.replace(' ', '+'));
        request.setAttribute("subcategory", subcategory);
        request.setAttribute("brand", brand);
        request.setAttribute("price", price);
        request.setAttribute("sortType", sortType);
        request.setAttribute("sortMode", sortMode);
        // Random Banner
        BannerDAO bdao= new BannerDAO();
        List<Banner> banners= bdao.getAllBanner();
        Random rand = new Random();
        int size=banners.size();
        if(size>0)
            request.setAttribute("banner",banners.get(rand.nextInt(banners.size())) );
        
        // Product Counter
        ProductDAO pdao=new ProductDAO();
        List<Product> products=pdao.getProductQuery("",0,0,0,0,0); 
        HashMap<Integer,Integer> subcategorycount = new HashMap<>(); 
        HashMap<Integer,Integer> brandcount = new HashMap<>(); 
        for (Product product: products){
            brandcount.put(product.getBrandID(), (brandcount.get(product.getBrandID())==null?0:brandcount.get(product.getBrandID()) ) +1 );
            subcategorycount.put(product.getSubCateID(),(subcategorycount.get(product.getSubCateID())==null?0:subcategorycount.get(product.getSubCateID())) + 1 );
        }
        request.setAttribute("brandCount", brandcount);
        request.setAttribute("subCategoryCount", subcategorycount);
        // Display Product ( Max = 12 )
        int maxProductDisplay = 12;
        // Query Product from db
        products=pdao.getProductQuery(query,subcategory,brand,price,sortType,sortMode);
        int maxPage= (int) Math.ceil( (products.size()*1.0 )/ maxProductDisplay );
        request.setAttribute("maxPage", maxPage);
        List<Product> display = new ArrayList<>();
        for(int i= maxProductDisplay * (page-1);i< maxProductDisplay * page ;i++)
           if(i<products.size())
                display.add(products.get(i));
        request.setAttribute("products", display);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
