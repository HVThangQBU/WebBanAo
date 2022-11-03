/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HOANG_THANG
 */
public class CartDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
//    public int insertCart(Cart cart) {
//        String query = "insert into webbanhangjsp.cart (account_id, product_id, amount) values (?, ?,?)";
//        int n = 0;
//        try {
//            connection = new DBContext().getConnection();
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setInt(1, cart.getAccountId());
//            preparedStatement.setInt(2, cart.getProductId());
//            preparedStatement.setInt(3, cart.getAmount());
//         n = preparedStatement.executeUpdate();
//        } catch (Exception e) {
//        }
//        return n;
//    }
}
