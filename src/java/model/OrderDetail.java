/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    String cageID;
    String cageName;
    int quantity;
    double price;
    String imageUrl;

    public OrderDetail() {
    }

    public OrderDetail(String cageID, String cageName, int quantity, double price, String imageUrl) {
        this.cageID = cageID;
        this.cageName = cageName;
        this.quantity = quantity;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public String getCageID() {
        return cageID;
    }

    public void setCageID(String cageID) {
        this.cageID = cageID;
    }

    public String getCageName() {
        return cageName;
    }

    public void setCageName(String cageName) {
        this.cageName = cageName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    
    
    
}
