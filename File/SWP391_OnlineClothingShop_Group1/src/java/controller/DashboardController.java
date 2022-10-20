/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.OrderDAO;
import DBContext.ProductDAO;
import DBContext.UserDAO;
import entity.Order;
import entity.Product;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author BEAN
 */
public class DashboardController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession ss = request.getSession();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        OrderDAO odao = new OrderDAO();
        ArrayList<Order> olist = new ArrayList<>();
          ArrayList<Product> plist = new ArrayList<>();
        int totalCus = 0;
        int totalProduct = 0;
        int totalOrder = 0;
        try {
            Users u = (Users) ss.getAttribute("user");
            String role = udao.getRoleByUserName(u.getUserName());
            if (role.equals("Admin")) {
                olist = odao.getAllOrders();
                totalCus = udao.getTotalUser();
                totalProduct = pdao.getTotalProduct();
                plist = pdao.getAllProduct();
                totalOrder = odao.geTotalOrderByListP(plist);
            } else if (role.equals("Seller")) {
               plist = pdao.getProductBySellerName(u.getUserName());
                olist = odao.getOdByListProduct(plist);
                totalCus = odao.geTotalUserIDByListP(plist);
                totalProduct = plist.size();
                totalOrder = odao.geTotalOrderByListP(plist);
            } else {
                response.sendRedirect("error.jsp");
            }

            request.setAttribute("totalCus", totalCus);
            request.setAttribute("totalPro", totalProduct);
            request.setAttribute("totalOrders", totalOrder);
            request.setAttribute("listOrder", olist);
            request.getRequestDispatcher("Dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
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
