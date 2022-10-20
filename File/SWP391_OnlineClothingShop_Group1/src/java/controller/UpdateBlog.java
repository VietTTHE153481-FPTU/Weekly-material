/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DBContext.BlogDAO;
import entity.Blog;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ottelia
 */
public class UpdateBlog extends HttpServlet {

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
           //Vietnamese character
          request.setCharacterEncoding("UTF-8"); 
        try {  
            String id = request.getParameter("BlogID");
            BlogDAO BlogDAO = new BlogDAO();
            Blog blog=BlogDAO.getBlogByID(Integer.parseInt(id));
            //set data to page update
            request.setAttribute("id", blog.getId());
            request.setAttribute("author", blog.getAuthor());
            request.setAttribute("title", blog.getTitle());
            request.setAttribute("content", blog.getContent());
            request.setAttribute("imageLink", blog.getImageLink());
            request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
        } catch (Exception e) {
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
           //Vietnamese character
          request.setCharacterEncoding("UTF-8"); 
        try {
            // get data from page Update
            String title = request.getParameter("title"); 
            String content = request.getParameter("content");           
            String imageLink = request.getParameter("imageLink");
            String author = request.getParameter("author");
            int id = Integer.parseInt(request.getParameter("id"));
            // set Blog data to database
            BlogDAO dao = new BlogDAO();
            dao.update(author, title, content, imageLink, id);           
            ArrayList<Blog> blogList = dao.getAllBlogs();
            request.setAttribute("blogList", blogList);
            // Redirect to manage Blog after update successful
            response.sendRedirect("ManageBlog");
        } catch (Exception e) {
            //response.sendRedirect("error.jsp");
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

