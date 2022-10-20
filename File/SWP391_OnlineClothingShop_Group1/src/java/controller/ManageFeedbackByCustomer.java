/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.FeedbackDAO;
import DBContext.ProductDAO;
import DBContext.UserDAO;
import entity.Feedback;
import entity.Product;
import entity.Users;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Ottelia
 */
public class ManageFeedbackByCustomer extends HttpServlet {

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
        try {
            // get current user
            HttpSession session = request.getSession();
            Users a = (Users) session.getAttribute("user");

            // get all dao
            ProductDAO productDao = new ProductDAO();
            FeedbackDAO feedbackDao = new FeedbackDAO();
            UserDAO userDao = new UserDAO();

            List<Feedback> lsFeedback = feedbackDao.getFeedbacksByUserId(a.getUserID());

            for (Feedback feedback : lsFeedback) {            
                // get all product of feedback
                Product productWithFeedback
                        = productDao.getProductByID(String.valueOf(feedback.getProductID())                       );
                feedback.setProduct(productWithFeedback);
            }

            // allow sort by name, product, star
            if (request.getParameter("sort-flag") != null) {
                int sortOption = Integer.parseInt(request.getParameter("sort-order"));
                int sortOrder = Integer.parseInt(request.getParameter("sort-by-order"));
                switch (sortOption) {
                    // sort by star
                    case 1: {
                        if (sortOrder == 1) {
                            // sort ascending
                            lsFeedback.sort(Comparator.comparing((Feedback::getStar)));
                        } else {
                            // sort descending
                            lsFeedback.sort(Comparator.comparing((Feedback::getStar)).reversed());
                        }
                        break;
                    }
                    // sort by user
                    case 2: {
                        if (sortOrder == 1) {
                            // sort ascending
                            lsFeedback.sort(Comparator.comparing((x -> x.getUser().getUserName())));
                        } else {
                            // sort descending
                            lsFeedback.sort(Comparator.comparing((x -> x.getUser().getUserName())));
                            Collections.reverse(lsFeedback);
                        }
                        break;
                    }
                    // sort by product
                    case 3: {
                        if (sortOrder == 1) {
                            // sort ascending
                            lsFeedback.sort(Comparator.comparing((x -> x.getProduct().getProductName())));
                        } else {
                            // sort descending
                            lsFeedback.sort(Comparator.comparing((x -> x.getProduct().getProductName())));
                            Collections.reverse(lsFeedback);
                        }
                        break;
                    }
                    //sort by time
                    case 4: {
                        if (sortOrder == 1) {
                            // sort ascending
                            lsFeedback.sort(Comparator.comparing((Feedback::getId)));
                        } else {
                            // sort descending
                            lsFeedback.sort(Comparator.comparing((Feedback::getId)).reversed());
                        }
                        break;
                    }
                    

                }

            }
            System.out.println(a.toString());
            for (Feedback feedback : lsFeedback) {
                System.out.println(feedback.toString());
            }
            request.setAttribute("lsFeedback", lsFeedback);
            request.getRequestDispatcher("ManageFeedbackByCustomer.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
