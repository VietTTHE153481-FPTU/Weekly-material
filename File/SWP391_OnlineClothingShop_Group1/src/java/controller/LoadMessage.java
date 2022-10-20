/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.ChatMessageDAO;

import entity.ChatMessage;
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
 * @author Ottelia
 */
public class LoadMessage extends HttpServlet {

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
            throws ServletException, IOException, Exception {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * This get method will load new message for the user and send to ajax and
     * load newly inserted messages if they have not been shown
     *
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
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            ChatMessageDAO messdao = new ChatMessageDAO();
            int offset = Integer.parseInt(request.getParameter("offset"));
            int uId = user.getUserID();
            int friendId = Integer.parseInt(request.getParameter("friendId"));
            ArrayList<ChatMessage> messageList = messdao.getNewMessageThroughTwoFriendId(uId, friendId, offset);
            for (ChatMessage message : messageList) {
                if (message.getFromId() == uId) {
                    out.println("<div class=\"outgoing_msg\">\n"
                            + "                  <div class=\"sent_msg\">\n"
                            + "                    <p>" + message.getContent() + "</p>\n"
                            + "                    <span class=\"time_date\">" + message.getDateCreated() + "</span>\n"
                            + "                  </div>\n"
                            + "                </div>");
                } else {
                    out.println("<div class=\"incoming_msg\">\n"
                            + "                  <div class=\"received_msg\">\n"
                            + "                    <div class=\"received_withd_msg\">\n"
                            + "                      <p>" + message.getContent() + "</p>\n"
                            + "                      <span class=\"time_date\">" + message.getDateCreated() + "</span>\n"
                            + "                    </div>\n"
                            + "                  </div>\n"
                            + "                </div>");
                }
            }

        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    }

    /**
     
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            ChatMessageDAO messdao = new ChatMessageDAO();
            String message = request.getParameter("message");
            //System.out.println(message);
            Users user = (Users) session.getAttribute("user");
            int uId = user.getUserID();
            int friendId = Integer.parseInt(request.getParameter("friendId"));
            ChatMessage mess = new ChatMessage(uId, friendId, message);
            messdao.insertMessage(mess);
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
