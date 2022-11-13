/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.AccountDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Order;
import entity.OrderStatusEnum;
import entity.Order_detail;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "ManagerOrderDetail", urlPatterns = {"/ManagerOrderDetail"})
public class ManagerOrderDetail extends HttpServlet {

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
       
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            OrderDAO orderDAO = new OrderDAO();
            ProductDAO productDAO = new ProductDAO();
            String idOrder = request.getParameter("idOrder");
            List<Order_detail> order_detailList = orderDetailDAO.getOrderDetailById(idOrder);
            request.setAttribute("order_detailList", order_detailList);

            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);

            Order order = orderDAO.getOrderByOrderId(idOrder);
            request.setAttribute("order", order);
            //        HttpSession session = request.getSession();
            //        Account account = (Account) session.getAttribute("account");
            AccountDAO accountDAO = new AccountDAO();
            List<Account> accountList = accountDAO.getAllAcount();
            request.setAttribute("accountList", accountList);
            Map<String, String> map = OrderStatusEnum.getOrderStatusMap();
            request.setAttribute("mapStatus", map);
            request.getRequestDispatcher("ManagerOrderDetail.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("editOrder")) {
        
           
            // get orderbyOrderId
            String aid = request.getParameter("aid");
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderByOrderId(aid);

            int acc = order.getAccount();
            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountById(String.valueOf(acc));
            String nameAcc = account.getUserName();

            Map<String, String> map = OrderStatusEnum.getOrderStatusMap();
            request.setAttribute("mapStatus", map);
             String status = null;
            for (Map.Entry<String, String> entry : map.entrySet()) {
                 if (order.getOrderStatus() == Integer.parseInt( entry.getKey())){
                      status = entry.getValue();                   
                 }   
            }

            Map<String, Object> map1 = new HashMap<>();
            map1.put("order", order);
            map1.put("name", account);
            map1.put("status", status);
        
            response.setContentType("application/json");
            response.getWriter().write(new Gson().toJson(map1));
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
        //processRequest(request, response);
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
