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
 *
 * comment dau class ten
 */
public class ConfirmOrderController extends HttpServlet {

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
            out.println("<title>Servlet ConfirmOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderController at " + request.getContextPath() + "</h1>");
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
        Users u = (Users) ss.getAttribute("user");
        try {
            int oid = Integer.parseInt(request.getParameter("oid"));
            String action = request.getParameter("action");

            ArrayList<Order> olist = new ArrayList<>();
            //GET LIST PRODUCT BY SELLER
            ArrayList<Product> plist = pdao.getProductBySellerName(u.getUserName());
            //GET LIST ORDER BY PRODUCT
            olist = odao.getOdByListProduct(plist);
            boolean check = odao.CheckOrderExist(oid, olist);
            if ((check && action.equals("accept")) || (check && action.equals("reject"))) {
                odao.OrderAction(oid, action);
                
                olist = odao.getOdByListProduct(plist);

                //UPDATE LAI TOTAL CUS , TOTAL PRO , TOTAL ORDER , TOTAL PROFIT
                olist = odao.getOdByListProduct(plist);
                int total = odao.geTotalUserIDByListP(plist);
                int profit = odao.getProfitByOrder(olist);
                request.setAttribute("totalCus", total);
                request.setAttribute("totalPro", plist.size());
                request.setAttribute("totalOrders", olist.size());
                request.setAttribute("totalProfit", profit);
                request.setAttribute("listOrder", olist);
                request.getRequestDispatcher("OrderDashBoard.jsp").forward(request, response);
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
