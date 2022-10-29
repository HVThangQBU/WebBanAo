/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ManagerAccountServlet", urlPatterns = {"/ManagerAccountServlet"})
public class ManagerAccountServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action == null) {
            AccountDAO accountDAO = new AccountDAO();
            List<Account> accountList = accountDAO.getAllAcount();
            request.setAttribute("accountList", accountList);
            request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("editAccount")) {
                String id = request.getParameter("aid");
                request.setCharacterEncoding("UTF-8");
                AccountDAO accountDAO = new AccountDAO();
                Account account = accountDAO.getAccountById(id);

                //request.setAttribute("Product", product);
                response.setContentType("application/json");

                response.getWriter().write(new Gson().toJson(account));
                //  response.sendRedirect("ManagerAccountServlet");
            }

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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("addAccount")) {

            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String sell = request.getParameter("sell");
            String admin = request.getParameter("admin");

            Account account = new Account(name, password, Integer.parseInt(sell), Integer.parseInt(admin));
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.insertAccount(account);
           
        }
        else if (action.equalsIgnoreCase("editAccount")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String sell = request.getParameter("sell");
            String admin = request.getParameter("admin");

            Account account = new Account(Integer.parseInt(id), name, password, Integer.parseInt(sell), Integer.parseInt(admin));
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.updateAccount(account);
         //   response.sendRedirect("ManagerAccountServlet");
        } else if (action.equalsIgnoreCase("deleteAccount")) {
             String id = request.getParameter("aid");
             AccountDAO accountDAO = new AccountDAO();
             int n = accountDAO.deleteAccount(id);
        } else if (action.equalsIgnoreCase("deleteAllAccount")) {
           
        }
        
         response.sendRedirect("ManagerAccountServlet");

    }
//tring[] checkedIds = request.getParameterValues("checkedRows");

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
