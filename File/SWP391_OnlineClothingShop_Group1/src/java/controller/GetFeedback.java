/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.FeedbackDAO;
import DBContext.ProductDAO;
import entity.Feedback;
import entity.Product;
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
 * @author Ottelia
 */
public class GetFeedback extends HttpServlet {

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
            out.println("<title>Servlet GetFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetFeedback at " + request.getContextPath() + "</h1>");
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
                response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            ProductDAO productDao = new ProductDAO();
           
          String orderId = request.getParameter("orderId");
       String productId = request.getParameter("productId");
            Product product=productDao.getProductByID(productId);
           

            request.setAttribute("product", product);
            request.setAttribute("orderId", orderId);
            request.getRequestDispatcher("GetFeedback.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Error.jsp");
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
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
 
            // get FeedbackDAO
            FeedbackDAO feedbackDAO = new FeedbackDAO();

            // get current product id
            int productId = Integer.parseInt(request.getParameter("productId"));

            // get input rating
            int star = Integer.parseInt(request.getParameter("star-value"));
            String feedback = request.getParameter("feedback-text");

            //get order id
            int orderId =Integer.parseInt(request.getParameter("orderId"));

            // create feedback
            Feedback userFeedback = new Feedback();
            userFeedback.setProductID(productId);
            userFeedback.setUserID(user.getUserID());
            userFeedback.setStar(star);
            userFeedback.setOrderID(orderId);
            userFeedback.setFeedbackDetail(feedback);
            System.out.println(userFeedback.toString());

            // add feedback to database
            feedbackDAO.addFeedback(userFeedback);

            // redirect to productlist
            response.sendRedirect("home");
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
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
