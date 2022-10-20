/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.LoginDAO;
import entity.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */

public class LoginControl extends HttpServlet {

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
        //Lấy dữ liệu từ jsp
       String action = request.getParameter("action");
       if("Login".equals(action))
       {
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            //Kết nối vs DB
            LoginDAO dao = new LoginDAO();
            Users u = dao.login(username, password);
            //Kiểm tra
            if(u==null){
                //login fail -> Đẩy về trang Login.jsp (nhập lại)
                //Message thông báo Login sai: thay đổi giá trị của biến mess
               request.setAttribute("mess1", "Login fail!");
               //ko thì quay trở lại trang login.jsp
               //Yêu cầu người dùng Login lại
               request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            else{
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.sendRedirect(request.getContextPath()+"/home");  
            }
       }
       else
       {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
