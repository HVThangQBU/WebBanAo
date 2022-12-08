/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANG_THANG
 */
@WebServlet(name = "ManagerCategoryServlet", urlPatterns = {"/ManagerCategoryServlet"})
public class ManagerCategoryServlet extends HttpServlet {

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
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ManagerCategoryServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ManagerCategoryServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//            System.out.println("ccon cá bên b? ao");
//            System.out.println("jaha");
//        }
    
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
           response.setContentType("text/html;charset=UTF-8");
     //   processRequest(request, response);
        CategoryDAO categoryDAO = new CategoryDAO();
        String action = request.getParameter("action");
        if (action == null) {
           
            List<Category> categoryList = categoryDAO.getAllCategory();
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("ManagerCategory.jsp").forward(request, response);
        }
        else 
        if (action.equalsIgnoreCase("editCategory")) {
            String id = request.getParameter("aid");
            request.setCharacterEncoding("UTF-8");              
            Category category = categoryDAO.getCategoryById(id);               
            response.setContentType("application/json");
            response.getWriter().write(new Gson().toJson(category));
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
    //    processRequest(request, response);
      request.setCharacterEncoding("UTF-8"); 
        CategoryDAO categoryDAO = new CategoryDAO();
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("addCategory")) {
            String name = request.getParameter("name");
            categoryDAO.insertCategory(name);   
        }
        else 
        if (action.equalsIgnoreCase("editCategory")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            categoryDAO.updateCategory(name,id);
        }
         else 
        if (action.equalsIgnoreCase("deleteCategory")) {
            int n = 0;
            String id = request.getParameter("aid");
            n = categoryDAO.deleteCategory(id);
        }
        
        
           response.sendRedirect("ManagerCategoryServlet");
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
