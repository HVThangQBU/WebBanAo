/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author HOANG_THANG
 */
public class OrderDAO {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public int insetOrder(Order order) {
        String query = "insert into webbanhangjsp.order (id_account, address, phone_number,email, total) values(?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, order.getAccountId());
            preparedStatement.setString(2, order.getAddress());
            preparedStatement.setString(3, order.getPhoneNumber());
            preparedStatement.setString(4, order.getEmail());
            preparedStatement.setFloat(5, order.getTotalPrice());
            preparedStatement.executeUpdate();
            try {
                resultSet = preparedStatement.getGeneratedKeys();
                if (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    return id;
                }
                resultSet.close();
            } catch (Exception e) {
                return 0;
            }
            
        } catch (Exception e) {
        }
        return 0;
    }

}
