/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOANG_THANG
 */
public class AccountDAO {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Account loginAccount(String user, String pass) {
        Account account = new Account();
        String query ="SELECT * FROM webbanhangjsp.account where user_name = ? and pass = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String password = resultSet.getString(3);
                int isSell = resultSet.getInt(4);
                int isAdmin = resultSet.getInt(5);
                account = new Account(id, userName, password, isSell, isAdmin);
                return account;
            }  
        } catch (Exception e) {
        }
        return null;
    }
    public Account checkAccountExitst(String user) {
        Account account = new Account();
        String query ="SELECT * FROM webbanhangjsp.account where user_name = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String password = resultSet.getString(3);
                int isSell = resultSet.getInt(4);
                int isAdmin = resultSet.getInt(5);
                account = new Account(id, userName, password, isSell, isAdmin);
                return account;
            }  
        } catch (Exception e) {
        }
        return null;
    }
    public void singUp(String userString, String passString) {
        String query = "insert into webbanhangjsp.account (user_name, pass, is_sell, is_admin) values (?, ?, ?,?);";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userString);
            preparedStatement.setString(2, passString);
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    public List<Account> getAllAcount() {
        String query = "SELECT * FROM webbanhangjsp.account";
        List<Account> accountList = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String password = resultSet.getString(3);
                int isSell = resultSet.getInt(4);
                int isAdmin = resultSet.getInt(5);
                Account account = new Account(id, userName, password, isSell, isAdmin);
                accountList.add(account);
            }
        } catch (Exception e) {
        }
        return accountList;
    }
    public void insertAccount(Account account) {
        String query = "insert into webbanhangjsp.account (user_name, pass, is_sell, is_admin) values(?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getIsSell());
            preparedStatement.setInt(4, account.getIsAdmin());
            preparedStatement.executeUpdate();   
            
        } catch (Exception e) {
        }
    }
       public Account getAccountById(String idString) {
        String query = "SELECT * FROM webbanhangjsp.account WHERE id = ?";
        Account account = new Account();
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idString);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String passString = resultSet.getString(3);
                int isSell = resultSet.getInt(4);
                int isADmin = resultSet.getInt(5);
                account = new Account(id, name, passString, isSell, isADmin);
            }
        } catch (Exception e) {
        }
        return account;
    }
       
    public void updateAccount (Account account) {
        String query ="update webbanhangjsp.account set user_name =?, pass=?, is_sell =?, is_admin =? where id =?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getIsSell());
            preparedStatement.setInt(4, account.getIsAdmin());
            preparedStatement.setInt(5, account.getId());
            preparedStatement.executeUpdate();   
        } catch (Exception e) {
        }
    }
    public int deleteAccount (String idString) {
        String quey = "delete from webbanhangjsp.account where id = ?";
        int n = 0;
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(quey);
            preparedStatement.setString(1, idString);
            n = preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }
}
