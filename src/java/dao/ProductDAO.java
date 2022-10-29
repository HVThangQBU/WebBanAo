/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOANG_THANG
 */
public class ProductDAO {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
// lay tat ca product

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "select * from product";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }

    // lay product cuoi cung co id lon nhat (san pham moi)
    public Product getLastProduct() {
        Product product = new Product();
        String query = "select * from webbanhangjsp.product where id = (select MAX(id) from webbanhangjsp.product)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                product = new Product(id, pname, image, price, title, desciption);
            }
        } catch (Exception e) {
        }
        return product;
    }

    // lay product theo Category 
    public List<Product> getProductsByCategoryId(String cid) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM webbanhangjsp.product where cate_id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }
    // lay product theo id

    public Product getProductsById(String pid) {
        Product product = new Product();
        String query = "SELECT * FROM webbanhangjsp.product where id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, pid);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                int category_Id = resultSet.getInt(7);
                int sellId = resultSet.getInt(8);
                product = new Product(id, pname, image, price, title, desciption, category_Id, sellId);

            }
        } catch (Exception e) {
        }
        return product;
    }

    // tim kiem san pham theo name
    public List<Product> SearchProductsByName(String name) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM webbanhangjsp.product where pname like ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, "%" + name + "%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }

    // lay ra 6 san pham trong sql
    public List<Product> getTop6Products() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT  * FROM webbanhangjsp.product LIMIT 6";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }
    // lay ra 6 san pham tiep theo
    public List<Product> getNext6Products(int amount) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT  * FROM webbanhangjsp.product order by id offset ? row fetch next 6 row only;";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, amount);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }
    // lay product theo sell id
    public List<Product> getProductsBySellId(String sid) {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM webbanhangjsp.product where sell_id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, sid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String pname = resultSet.getString(2);
                String image = resultSet.getString(3);
                float price = resultSet.getFloat(4);
                String title = resultSet.getString(5);
                String desciption = resultSet.getString(6);
                Product product = new Product(id, pname, image, price, title, desciption);
                productList.add(product);
            }
        } catch (Exception e) {
        }
        return productList;
    }
    // xoa san pham theo id
    public void deleteProductById (String pid) {
        String query = "delete from webbanhangjsp.product where id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, pid);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }   
    // them san pham moi
    public void insertProduct (Product product) {
        String query = "insert into webbanhangjsp.product (pname, image, price, title, description, cate_id, sell_id) values (?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,product.getPname());
            preparedStatement.setString(2, product.getImage());
            preparedStatement.setFloat(3, product.getPrice());
            preparedStatement.setString(4, product.getTitle());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getCateId());
            preparedStatement.setInt(7, product.getSellId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }
    // update product
    public void updateProduct (Product product) {
        String query = "update webbanhangjsp.product set pname=?, image=?, price=?, title=?, description=?, cate_id=?, sell_id=? where id = ?";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,product.getPname());
            preparedStatement.setString(2, product.getImage());
            preparedStatement.setFloat(3, product.getPrice());
            preparedStatement.setString(4, product.getTitle());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setInt(6, product.getCateId());
            preparedStatement.setInt(7, product.getSellId());
            preparedStatement.setInt(8, product.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = productDAO.getProductsByCategoryId("3");
            for (Product product : products) {
                System.out.println(product);

            }
        } catch (Exception e) {
        }
    }
}
