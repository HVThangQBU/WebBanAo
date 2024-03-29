/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.OrderDAO;
import entity.Account;
import entity.Order;
import entity.OrderStatusEnum;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

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
        //    processRequest(request, response);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String accountId = String.valueOf(account.getId());
        if (account.getIsAdmin() == 1) {
             OrderDAO orderDAO = new OrderDAO();
            List<Order> listOrder = orderDAO.getAllOrder();
            request.setAttribute("listOrder", listOrder);
            Map<String, String> map = OrderStatusEnum.getOrderStatusMap();
            request.setAttribute("mapStatus", map);
        
            AccountDAO accountDAO = new AccountDAO();
             List<Account> account1 = accountDAO.getAllAcount();
            request.setAttribute("account1", account1);
        }
        else {
             OrderDAO orderDAO = new OrderDAO();
            List<Order> listOrder = orderDAO.getAllOrderByAccountId(accountId);
            request.setAttribute("listOrder", listOrder);
//        OrderStatusEnum orderStatusEnum = new OrderStatusEnum();
            Map<String, String> map = OrderStatusEnum.getOrderStatusMap();
            request.setAttribute("mapStatus", map);
        }
        request.getRequestDispatcher("OderSuccess.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("updateStt")) {
           String id = request.getParameter("idOrder2");
           String stat = request.getParameter("sttust");
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.updateStatusOrderByIdOrder(id, stat);
            
            
        }
        response.sendRedirect("OrderServlet");
        
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
