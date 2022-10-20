/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.OrderDAO;
import DBContext.ProductDAO;
import DBContext.TrendDAO;
import DBContext.UserDAO;
import entity.Trend;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author SAKURA
 */
public class Marketing_Dashboard extends HttpServlet {

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
        UserDAO udao=new UserDAO();
        request.setAttribute("customercount", udao.countCustomer());
        ProductDAO pdao=new ProductDAO();
        request.setAttribute("productcount", pdao.countProduct() );
        OrderDAO odao= new OrderDAO();
        request.setAttribute("ordercount", odao.getTotalOrders());
        String daterange = request.getParameter("daterange");
        Date start=null,end=null;
        if(daterange==null){
            long DAY_IN_MS = 1000 * 60 * 60 * 24;
            start = new Date(System.currentTimeMillis() - (7 * DAY_IN_MS));
            end= new Date(System.currentTimeMillis());
        }
        else{
            SimpleDateFormat SDF = new SimpleDateFormat("MM/dd/yyyy");
            String[] startend = daterange.split(" - ");
            
            try {
                start = SDF.parse(startend[0]);
                end = SDF.parse(startend[1]);
            } catch (ParseException ex) {
                Logger.getLogger(Marketing_Dashboard.class.getName()).log(Level.SEVERE, null, ex);
            }  
        }
        TrendDAO tdao = new TrendDAO();
        System.out.println(start);
        System.out.println(end);
        List<Trend> catetrend=tdao.getCategoryTrend(start, end);
        request.setAttribute("catetrends", catetrend);
        List<Trend> producttrend=tdao.getProductTrend(start, end);
        request.setAttribute("producttrends", producttrend);
        List<Trend> brandtrend=tdao.getBrandTrend(start, end);
        request.setAttribute("brandtrends", brandtrend);
        request.getRequestDispatcher("/mktdashboard.jsp").forward(request, response);
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
