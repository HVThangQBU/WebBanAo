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
    private Account account;
    private Product product;
    private int isSell;
    private int quantity;
    private float totalPrice;
    private String address;
    private String phoneNumber;
    private String dateOrder;
    private String dateDelivary;
    private int status;
    
    public Order() {}

    public Order(int id_order, Account account, Product product, int isSell, int quantity, float totalPrice, String address, String phoneNumber, String dateOrder, String dateDelivary, int status) {
        this.id_order = id_order;
        this.account = account;
        this.product = product;
        this.isSell = isSell;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.dateOrder = dateOrder;
        this.dateDelivary = dateDelivary;
        this.status = status;
    }

    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
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

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getDateDelivary() {
        return dateDelivary;
    }

    public void setDateDelivary(String dateDelivary) {
        this.dateDelivary = dateDelivary;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
}
