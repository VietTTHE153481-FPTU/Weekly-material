/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.ChatFriendDAO;
import DBContext.UserDAO;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Ottelia
 */

public class Chat extends HttpServlet {

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
            throws ServletException, IOException ,Exception{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                                    
            HttpSession session = request.getSession();
            
            UserDAO userdao = new UserDAO();
            ChatFriendDAO frienddao = new ChatFriendDAO();
            
            int uId = 0;            
            Users user = (Users) session.getAttribute("user");
            if(user==null) {
                response.sendRedirect("login");
            } else {
                uId = user.getUserID();
            }
            
            int friendId = 0;
            int status = 0;
            // check if user and person user want to chat are friend
            try {
                
            friendId = Integer.parseInt(request.getParameter("friendId"));
            
            status = frienddao.checkIfNotFriendYetToAdd(uId, friendId);
            
            } catch (NumberFormatException | NullPointerException e) { // get message for the first friend in list
            }
            
             // get user friend list
            ArrayList<Integer> friendIdList = frienddao.getYourChatFriendId(uId);
            
            //if user get no friend
            if(friendIdList.isEmpty()) {                
                request.setAttribute("chaterror", "There no message for you");               
            } else {
            
            // if there is no friendId parameter on URL
            if (status == 0) friendId = friendIdList.get(0);           
            ArrayList<Users> friendList = new ArrayList();          
            friendIdList.forEach((id) -> {
                friendList.add(userdao.getUsersByID(id));
                });
            
            request.setAttribute("friendList", friendList);
            
            if(friendId!=0){
            request.setAttribute("friendId", friendId);
            }            
            }            
            RequestDispatcher rd = request.getRequestDispatcher("/chatbox.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            
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
