/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HOANG_THANG
 */
public class Order {
    private int id_order;
    private int accountId;
    private String address;
    private String phoneNumber;
    private String email;
     private float totalPrice;
    public Order() {}

    public Order(int id_order, int accountId, String address, String phoneNumber, String email, float totalPrice) {
        this.id_order = id_order;
        this.accountId = accountId;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.totalPrice = totalPrice;
    }

    public Order(int accountId, String address, String phoneNumber, String email, float totalPrice) {
        this.accountId = accountId;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.totalPrice = totalPrice;
    }

   
    

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public int getAccount() {
        return accountId;
    }

    public void setAccount(int accountId) {
        this.accountId = accountId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    

  
}
