/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DateHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entity.Customer;
import DBContext.CustomerDAO;
/**
 *
 * @author Duy Manh
 */
@WebServlet(name = "CustomerServlet", urlPatterns = {"/CustomerServlet"})
public class CustomerServlet extends HttpServlet {

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
            String id = null;
            Customer cus = null;
            String action = request.getParameter("action");
            CustomerDAO cusDao = new CustomerDAO();
            if (action == null || action.equals("")) {
                request.getRequestDispatcher("view-customers.jsp").forward(request, response);
                return;
            }
            switch (action) {
                case "List":
                    request.setAttribute("LIST_CUSTOMER", cusDao.getAll());
                    request.getRequestDispatcher("view-customers.jsp").forward(request, response);
                    break;
                case "AddOrEdit":
                    id = request.getParameter("id");
                    if (id != null) {
                        cus = (Customer) cusDao.findByID(Integer.parseInt(id));
                        if (cus == null) {
                            cus = new Customer(0, "", DateHelper.now(), true, "", "", "", "", DateHelper.now());
                        }
                    }
                    request.setAttribute("CUSTOMER", cus);
                    request.setAttribute("ACTION", "SaveOrUpdate");
                    request.getRequestDispatcher("add-customer.jsp").forward(request, response);
                    break;
                case "SaveOrUpdate":
                    id = request.getParameter("id");
                    String name = request.getParameter("name");
                    Date birthday = DateHelper.todate(request.getParameter("birthday"));
                    int gender = Integer.parseInt(request.getParameter("gender"));
                    boolean _gender = false;
                    if (gender == 1){
                        _gender = true;
                    }
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String pass = request.getParameter("password");
                    cus = new Customer(Integer.parseInt(id), name, birthday, _gender, email, phone, "1", pass, birthday);
                    if (cusDao.findByID(Integer.parseInt(id)) == null) {
                        cusDao.insert(cus);
                    }
                    
            }
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
