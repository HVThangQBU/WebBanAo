/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HOANG_THANG
 */
public class Product {
    private int id;
    private String pname;
    private String image;
    private float price;
    private String title;
    private String description;
    private int cateId;
    private int sellId;
    public Product() {}

    public Product(int id, String pname, String image, float price, String title, String description, int cateId, int sellId) {
        this.id = id;
        this.pname = pname;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateId = cateId;
        this.sellId = sellId;
    }

    
    

    public Product(int id, String pname, String image, float price, String title, String description) {
        this.id = id;
        this.pname = pname;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
    }
    

    public Product(String pname, String image, float price, String title, String description, int cateId, int sellId) {
        this.pname = pname;
        this.image = image;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateId = cateId;
        this.sellId = sellId;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public int getSellId() {
        return sellId;
    }

    public void setSellId(int sellId) {
        this.sellId = sellId;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", pname=" + pname + ", image=" + image + ", price=" + price + ", title=" + title + ", description=" + description + '}';
    }
    
    
    
}
