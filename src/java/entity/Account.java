/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HOANG_THANG
 */
public class Account {
    private int id;
    private String userName;
    private String password;
    private int isSell;
    private int isAdmin;
    public Account() {}

    public Account(String userName, String password, int isSell, int isAdmin) {
        this.userName = userName;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }
    
    public Account(int id, String userName, String password, int isSell, int isAdmin) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", userName=" + userName + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }
    
    
    
}
