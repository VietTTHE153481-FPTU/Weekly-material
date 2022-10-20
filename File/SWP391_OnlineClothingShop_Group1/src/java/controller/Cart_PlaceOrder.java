/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.CartDAO;
import DBContext.NotificationDAO;
import DBContext.OrderDAO;
import DBContext.OrderDetailDAO;
import DBContext.ShipDAO;
import DBContext.ShipInfoDAO;
import SMTP.GmailAPI;
import entity.Cart;
import entity.Notification;
import entity.Order;
import entity.OrderDetail;
import entity.Ship;
import entity.ShipInfo;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
//import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.StringDecode;

/**
 *
 * @author Bach Ngoc Minh Chau HE153019
 */
public class Cart_PlaceOrder extends HttpServlet {

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
        response.sendRedirect(request.getContextPath()+"/user/cart");
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
        HttpSession session = request.getSession();
        Users user=(Users) session.getAttribute("user");
        CartDAO cdao=new CartDAO();
        List<Cart> carts = cdao.getCart(user.getUserID());
        int totalPrice=0;
        for(Cart cart:carts){
            totalPrice+=cart.getSellPrice()*cart.getAmount();
        }
        ShipDAO sdao=new ShipDAO();
        Ship ship=sdao.getShip(Integer.parseInt(request.getParameter("inputCity")));
        String note=request.getParameter("inputNote");
        note= (note==null?"":note);
        Order order = new Order(user.getUserID() , totalPrice+ship.getShipPrice(), StringDecode.decode(note));
        OrderDAO odao= new OrderDAO();
        int orderId=odao.addOrder(order);
        ShipInfo shipinfo = new ShipInfo(orderId,StringDecode.decode(request.getParameter("inputName")), StringDecode.decode(request.getParameter("inputAddress")), Integer.parseInt(request.getParameter("inputCity")), request.getParameter("inputPhone"), StringDecode.decode(note));
        ShipInfoDAO sidao = new ShipInfoDAO();
        sidao.addShipInfo(shipinfo);
        OrderDetailDAO oddao = new OrderDetailDAO();
        for(Cart cart:carts){
            OrderDetail orderdetail=new OrderDetail(orderId, cart.getProductID(), cart.getProductName(), cart.getSellPrice(), cart.getAmount());
            oddao.addOrderDetail(orderdetail);
        }
//        Notification
        Notification notification= new Notification(user.getUserID(), orderId, "Order #"+Integer.toString(orderId)+" has been placed!");
        NotificationDAO ndao=new NotificationDAO();
        ndao.addNotification(notification);
//        Remove Cart
        cdao.removeCart(user.getUserID());
//        GMAIL 
        String subject = "Order placed";
//        String message = ("Order #"+Integer.toString(orderId)+" has been placed!");
//        String gmailFrom = "duclee028@gmail.com";
//        String passfrom = "duc25092000";
//        try {
//            //(String toEmail, String subject, String msg, String fromEmail, String password
//            GmailAPI.send(user.getEmail(), subject, message, gmailFrom, passfrom);
//        } catch (MessagingException ex) {
//            Logger.getLogger(Cart_PlaceOrder.class.getName()).log(Level.SEVERE, null, ex);
//        }
////        GMAIL
        request.getRequestDispatcher("/finishedorder.jsp").forward(request, response);
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
