/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.OrderDAO;
import DBContext.ProductDAO;
import DBContext.ShipDAO;
import DBContext.UserDAO;
import entity.Order;
import entity.Product;
import entity.ShipInfo;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author BEAN
 */
public class OrderDetailsController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath() + "</h1>");
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
        OrderDAO odao = new OrderDAO();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        ShipDAO sdao = new ShipDAO();
        HttpSession ss = request.getSession();
        try {
            int oid = Integer.parseInt(request.getParameter("oid"));
            Users u = (Users) ss.getAttribute("user");
            ArrayList<Order> olist = new ArrayList<>();
            //GET LIST PRODUCT BY SELLER
            ArrayList<Product> plist = pdao.getProductBySellerName(u.getUserName());
            //GET LIST ORDER BY PRODUCT
            olist = odao.getOdByListProduct(plist);
            boolean check = odao.CheckOrderExist(oid, olist);
            if (check) {
                List<Order> order = odao.getOrderByOdID(oid);
                ShipInfo ship = sdao.getShipInfoByOdID(oid);
                ArrayList<Product> listP = pdao.getAllProduct();
                List<Product> listProduct = pdao.getProductByListOd(listP, olist);

                request.setAttribute("order", order);
                request.setAttribute("ship", ship);
                request.setAttribute("listProduct", listProduct);

                request.getRequestDispatcher("/OrderDetail.jsp").forward(request, response);
            } else {
                  response.sendRedirect("error.jsp");
            }


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
