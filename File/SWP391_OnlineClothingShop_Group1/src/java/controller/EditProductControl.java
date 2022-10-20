/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.ProductDAO;
import entity.SubCategory;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//import static jakarta.swing.Spring.height;
//import static jakarta.swing.Spring.width;


/**
 *
 * @author phunghe150108
 */
public class EditProductControl extends HttpServlet {

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
     

            int pid = Integer.parseInt(request.getParameter("id"));
            String pname = request.getParameter("pname");
            String Description = request.getParameter("Description");
            double OriginalPrice = Double.parseDouble(request.getParameter("OriginalPrice"));
            double SellPrice = Double.parseDouble(request.getParameter("SellPrice"));
            double SalePercent = Double.parseDouble(request.getParameter("SalePercent"));
            int Amount = Integer.parseInt(request.getParameter("Amount"));
            int sttID = Integer.parseInt(request.getParameter("sttID"));
            int brandID = Integer.parseInt(request.getParameter("brandID"));
            double height = Double.parseDouble(request.getParameter("height"));
            double width = Double.parseDouble(request.getParameter("width"));
            double weight = Double.parseDouble(request.getParameter("weight"));
            int pCategory = Integer.parseInt(request.getParameter("Category"));
           
     
        ProductDAO pdao = new ProductDAO();
        
        pdao.EditProduct(pname,  Description,  OriginalPrice,
             SellPrice,  SalePercent,pCategory, Amount,  sttID,
             brandID,  height,  width,  weight,  pid);

        response.sendRedirect("ManagerProduct");
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
