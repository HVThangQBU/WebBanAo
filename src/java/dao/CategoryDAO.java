/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HOANG_THANG
 */
public class CategoryDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    public List<Category> getAllCategory() {
        List<Category> categoryList = new ArrayList<>();
        String query = "select * from category";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                Category category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (Exception e) {
        }
        return categoryList;
    }
    
//    public List<Category> getCategoryByIdCategory(String cid) {
//        List<Category> categoryList = new ArrayList<>();
//        String query = "SELECT * FROM webbanhangjsp.category where cid = ?";
//        try {
//            connection = new DBContext().getConnection();
//            preparedStatement = connection.prepareStatement(query);
//            preparedStatement.setString(1, cid);
//            resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                
//            }
//        } catch (Exception e) {
//        }
//    }
    
    public void insertCategory(String category_name) {
        String query = " insert into webbanhangjsp.category (cname) values (?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,category_name);
            preparedStatement.executeUpdate();
        } catch (Exception e) { 
        }
    }
    public void updateCategory(String cateString, String id) {
        String query = "UPDATE `webbanhangjsp`.`category` SET `cname` = ? WHERE (`cid` = ?)";
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cateString);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Category getCategoryById(String id) {
        String query = "SELECT * FROM webbanhangjsp.category where cid = ?";
        Category category = new Category();
        try {
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int idd = resultSet.getInt(1);
                String name = resultSet.getString(2);
                category = new Category(idd, name);
            }
        } catch (Exception e) {
        }
        return category;
    }
}
