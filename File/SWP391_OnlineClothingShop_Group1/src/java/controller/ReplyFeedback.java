/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.FeedbackDAO;
import DBContext.FeedbackRepliesDAO;
import DBContext.ProductDAO;
import DBContext.UserDAO;
import entity.Feedback;
import entity.FeedbackReplies;
import entity.Product;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Ottelia
 */
public class ReplyFeedback extends HttpServlet {

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
            out.println("<title>Servlet ReplyFeedback</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReplyFeedback at " + request.getContextPath() + "</h1>");
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
        //Vietnamese character
            response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        try {

            // get all dao
            ProductDAO productDao = new ProductDAO();
            FeedbackDAO feedbackDao = new FeedbackDAO();
            UserDAO userDao = new UserDAO();
           

            // get feedback id
            int feedbackId = Integer.parseInt(request.getParameter("FeedbackID"));

            // get the feedback and set data for the feedback
            Feedback feedback = feedbackDao.getFeedbacksById(feedbackId);
            feedback.setProduct(
                    productDao.getProductByID(
                            String.valueOf(feedback.getProductID())
                    )
            );
            feedback.setUser(
                    userDao.getUsersByID(feedback.getUserID())
            );
            
            // send to jsp page
            request.setAttribute("feedback", feedback);
            FeedbackRepliesDAO replyDAO= new FeedbackRepliesDAO();
            List<FeedbackReplies> replist= replyDAO.getFeedbacksRepliesByFeedbackId(feedbackId);
            String rep=null;
            if (!replist.isEmpty()){
            rep= replyDAO.getFeedbacksRepliesByFeedbackId(feedbackId).get(0).getRepliesText();}
            request.setAttribute("rep", rep);
            request.getRequestDispatcher("ReplyFeedback.jsp").forward(request, response);
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
        //Vietnamese character
            response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        try {
            HttpSession session = request.getSession();
            Users a = (Users) session.getAttribute("user");
            // get all dao
            ProductDAO productDao = new ProductDAO();
            FeedbackDAO feedbackDao = new FeedbackDAO();
            UserDAO userDao = new UserDAO();
           

            // get feedback id
            int feedbackId = Integer.parseInt(request.getParameter("id"));

            // get the feedback and set data for the feedback
            Feedback feedback = feedbackDao.getFeedbacksById(feedbackId);
            feedback.setProduct(
                    productDao.getProductByID(
                            String.valueOf(feedback.getProductID())
                    )
            );
            feedback.setUser(
                    userDao.getUsersByID(feedback.getUserID())
            );
            
            // send to jsp page
            request.setAttribute("feedback", feedback);
            String rep= request.getParameter("rep");
            FeedbackRepliesDAO replyDAO= new FeedbackRepliesDAO();
            FeedbackReplies theReply= new FeedbackReplies();
            theReply.setFeedbackID(feedbackId);
            theReply.setRepliesText(rep);
            theReply.setUserID(a.getUserID());
            replyDAO.addReplies(theReply);
             request.setAttribute("rep", rep);
            request.getRequestDispatcher("ViewFeedback.jsp").forward(request, response);
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
