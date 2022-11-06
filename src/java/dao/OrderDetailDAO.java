/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Order_detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HOANG_THANG
 */
public class OrderDetailDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    public int insertOrderDetail(Order_detail order_detail) {
        String query = "insert into webbanhangjsp.order_details (order_id, id_product, quantity, price ) values(?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, order_detail.getOrderId());
            preparedStatement.setInt(2, order_detail.getProductId());
            preparedStatement.setInt(3, order_detail.getQuantity());
            preparedStatement.setFloat(4, order_detail.getPrice());
        
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
        return 0;
    }
    
}
