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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOANG_THANG
 */
public class OrderDAO {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public int insetOrder(Order order) {
        String query = "insert into webbanhangjsp.order (id_account, address, phone_number,email, total,order_status,date_order,shipped_date)"
                + " values(?,?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, order.getAccountId());
            preparedStatement.setString(2, order.getAddress());
            preparedStatement.setString(3, order.getPhoneNumber());
            preparedStatement.setString(4, order.getEmail());
            preparedStatement.setFloat(5, order.getTotalPrice());
            preparedStatement.setInt(6, order.getOrderStatus());
            preparedStatement.setString(7, order.getDateOrder());
            preparedStatement.setString(8, order.getShippedDateString());
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

    public List<Order> getAllOrder() {
        String query = "SELECT * FROM webbanhangjsp.order";
        List<Order> list = new ArrayList<>();

        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                int accId = resultSet.getInt(2);
                String address = resultSet.getString(3);
                String phone = resultSet.getString(4);
                String email = resultSet.getString(5);
                float total = resultSet.getFloat(6);
                int orderStatus = resultSet.getInt(7);
                String dateOrder = resultSet.getString(8);
                String shippedDate = resultSet.getString(9);
                Order order  = new Order(id, accId, address, phone, email, total, orderStatus, dateOrder, shippedDate);
                list.add(order);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrderByAccountId(String accountId) {
        String query = "SELECT * FROM webbanhangjsp.order where id_account = ?";
        List<Order> list = new ArrayList<>();

        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, accountId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                int accId = resultSet.getInt(2);
                String address = resultSet.getString(3);
                String phone = resultSet.getString(4);
                String email = resultSet.getString(5);
                float total = resultSet.getFloat(6);
                int orderStatus = resultSet.getInt(7);
                String dateOrder = resultSet.getString(8);
                String shippedDate = resultSet.getString(9);
                Order order = new Order();
                order = new Order(id, accId, address, phone, email, total, orderStatus, dateOrder, shippedDate);
                list.add(order);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getOrderByOrderId(String idOrder) {
        String query = "SELECT * FROM webbanhangjsp.order where id_order = ?";
       
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idOrder);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                int accId = resultSet.getInt(2);
                String address = resultSet.getString(3);
                String phone = resultSet.getString(4);
                String email = resultSet.getString(5);
                float total = resultSet.getFloat(6);
                int orderStatus = resultSet.getInt(7);
                String dateOrder = resultSet.getString(8);
                String shippedDate = resultSet.getString(9);
                 Order order  = new Order(id, accId, address, phone, email, total, orderStatus, dateOrder, shippedDate);
                   return order;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void updateStatusOrderByIdOrder(String idOrder, String status) {
        String query = "update webbanhangjsp.order set order_status = ?  where id_order = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, idOrder);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        } 
    }
    public void updateInfoOrderByIdOrder(String addr,String phone, String email, int statusOr, String shipperDay, int id ) {
        String query = "update webbanhangjsp.order set address =?, phone_number =?, email =?,shipped_date=?, order_status =?  where id_order =?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, addr);
            preparedStatement.setString(2,phone);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4,shipperDay );
            preparedStatement.setInt(5,statusOr);
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

}
