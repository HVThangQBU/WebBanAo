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
import java.util.ArrayList;
import java.util.List;

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
    public List<Order_detail> getOrderDetailById(String idOrder) {
        String queryString="SELECT * FROM webbanhangjsp.order_details where order_id = ?";
        List<Order_detail> order_detailsList = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(queryString);
            preparedStatement.setString(1, idOrder);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                int orderId = resultSet.getInt(2);
                int idProduct = resultSet.getInt(3);
                int quantity = resultSet.getInt(4);
                float price = resultSet.getFloat(5);
                Order_detail order_detail  = new Order_detail(id, orderId, idProduct, quantity, price);
                order_detailsList.add(order_detail);
                
            }
        } catch (Exception e) {
        }
        return order_detailsList;
    }

//    public void getAllOrderAccount() {
//        String query = "SELECT webbanhangjsp.order_details.id, webbanhangjsp.order_details.order_id, webbanhangjsp.order_details.id_product, webbanhangjsp.order_details.price, webbanhangjsp.order_details.quantity,\n" +
//"webbanhangjsp.order.total, webbanhangjsp.order.address, webbanhangjsp.order.phone_number, webbanhangjsp.order.email FROM webbanhangjsp.order_details inner join webbanhangjsp.order on webbanhangjsp.order.id_order = webbanhangjsp.order_details.order_id\n" +
//" where id_account = ?";
//        try {
//            connection = new DBContext().getConnection();
//            preparedStatement = connection.prepareStatement(query);
//            resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                
//                
//            }
//        } catch (Exception e) {
//        }
//    }
    public static void main(String[] args) {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        
        List<Order_detail> order_detailList = orderDetailDAO.getOrderDetailById(String.valueOf(8));
        for (Order_detail order_detail : order_detailList) {
            System.out.println(order_detail);
        }
  

}
}