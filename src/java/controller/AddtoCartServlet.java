/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HOANG_THANG
 */
@WebServlet(name = "AddtoCartServlet", urlPatterns = {"/AddtoCartServlet"})
public class AddtoCartServlet extends HttpServlet {

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
        //processRequest(request, response);

        HttpSession session = request.getSession();

        List<Product> productList = new ArrayList<>();
        String proId = request.getParameter("productid");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductsById(proId);
        Object obj = session.getAttribute("cart");
        if (proId != null) {
            if (obj == null) {
                Cart cart = new Cart();
                cart.setProduct(product);
                cart.setQuantity(1);
                cart.setUnitPrice(product.getPrice());
                Map<String, Cart> map = new HashMap<>();
                map.put(proId, cart);
                session.setAttribute("cart", map);
            } else {
                Map<String, Cart> map = (Map<String, Cart>) obj;
                Cart cart = map.get(proId);
                if (cart == null) {
                    cart = new Cart();
                    cart.setProduct(product);
                    cart.setQuantity(1);
                    cart.setUnitPrice(product.getPrice());
                    map.put(proId, cart);
                } else {
                    cart.setQuantity(cart.getQuantity() + 1);
                }

                session.setAttribute("cart", map);
            }
        }

        request.getRequestDispatcher("AddtoCart.jsp").forward(request, response);
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
        //processRequest(request, response);
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("updatequantity")) {
            String id = request.getParameter("id");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductsById(id);

            HttpSession session = request.getSession();
            Object obj = session.getAttribute("cart");

            if (obj == null) {
                Cart cart = new Cart();
                cart.setProduct(product);
                cart.setQuantity(quantity);
                cart.setUnitPrice(product.getPrice());
                Map<String, Cart> map = new HashMap<>();
                map.put(id, cart);
                session.setAttribute("cart", map);
            } else {
                Map<String, Cart> map = (Map<String, Cart>) obj;
                Cart cart = map.get(id);
                if (cart == null) {
                    cart = new Cart();
                    cart.setProduct(product);
                    cart.setQuantity(quantity);
                    cart.setUnitPrice(product.getPrice());
                    map.put(id, cart);
                } else if (quantity == 0) {
                    cart = map.remove(id);
                } else {
                    cart.setQuantity(quantity);
                }

                session.setAttribute("cart", map);
            }

        }
        request.getRequestDispatcher("AddtoCart.jsp").forward(request, response);
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
