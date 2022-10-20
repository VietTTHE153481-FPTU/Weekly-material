/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.CartDAO;
import DBContext.ShipDAO;
import entity.Cart;
import entity.Ship;
import entity.Users;
import java.io.IOException;
import java.util.List;
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
public class Cart_Checkout extends HttpServlet {

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
        response.sendRedirect(request.getContextPath()+"/user/cart");
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
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("carts", carts);
        request.setAttribute("shipName", StringDecode.decode(request.getParameter("inputName")));
        request.setAttribute("shipAddress", StringDecode.decode(request.getParameter("inputAddress")));
        request.setAttribute("shipPhone", request.getParameter("inputPhone"));
        String note=request.getParameter("inputNote");
        note= (note==null?"":note);
        request.setAttribute("shipNote", StringDecode.decode(note) );
        ShipDAO sdao=new ShipDAO();
        Ship ship=sdao.getShip(Integer.parseInt(request.getParameter("inputCity")));
        request.setAttribute("shipCity", ship);
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
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
