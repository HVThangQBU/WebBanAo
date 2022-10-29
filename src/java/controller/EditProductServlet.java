/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.ProductDAO;
import entity.Account;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.json.JsonWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HOANG_THANG
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
public class EditProductServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String pid = request.getParameter("pid");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductsById(pid);
        //request.setAttribute("Product", product);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(product));
        
//        request.getRequestDispatcher("ManagerProductServlet").forward(request, response);
        
        
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        String id = request.getParameter("id");
//        String name = request.getParameter("name");
//        String image = request.getParameter("image");
//        String price = request.getParameter("price");
//        String title = request.getParameter("title");
//        String description = request.getParameter("description");
//        String category = request.getParameter("category");
//        int sellId = account.getId();
////        Product product2 = new Product(Integer.parseInt(id), name, image, Float.parseFloat(price), title, description, Integer.parseInt(category), sellId);
//        product = new Product(Integer.parseInt(id), name, image, Float.parseFloat(price), title, description, Integer.parseInt(category), sellId);
////productDAO.updateProduct(product2);
//          response.sendRedirect("ManagerProductServlet");
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
       // processRequest(request, response);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        int sellId = account.getId();
        ProductDAO productDAO = new ProductDAO();
    //        Product product2 = new Product(Integer.parseInt(id), name, image, Float.parseFloat(price), title, description, Integer.parseInt(category), sellId);
        Product product = new Product(Integer.parseInt(id), name, image, Float.parseFloat(price), title, description, Integer.parseInt(category), sellId);
        productDAO.updateProduct(product);
          response.sendRedirect("ManagerProductServlet");
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
