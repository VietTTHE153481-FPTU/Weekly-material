/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.ProductDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phunghe150108
 */
public class AddProductControl extends HttpServlet {

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
      
        String pname = request.getParameter("pname");
        String Description = request.getParameter("Description");
        String OriginalPrice = request.getParameter("OriginalPrice");
        String SellPrice = request.getParameter("SellPrice");
        String SalePercent = request.getParameter("SalePercent");
        String Amount = request.getParameter("Amount");
        String sttID = request.getParameter("sttID");
        String brandID = request.getParameter("brandID");
        String height = request.getParameter("height");
        String width = request.getParameter("width");
        String weight = request.getParameter("weight");
        String pCategory = request.getParameter("Category");
        String ProductImgURL = request.getParameter("ProductImgURL");
        HttpSession session = request.getSession();
        //get user tren session ve 
        // ep kieu vì session.getAttribute trả về string
        Users u = (Users) session.getAttribute("user");
        int sid = u.getUserID();
        
        ProductDAO pdao = new ProductDAO();
        pdao.AddProduct(pname, Description, OriginalPrice, SellPrice, SalePercent, pCategory, sid, Amount, sttID, brandID, height, width, weight);
        pdao.AddProductImg(pname, ProductImgURL);
        request.getRequestDispatcher("ManagerProduct").forward(request, response);
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
