/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Cart {
    private String CageID;
    private String CageName;
    private double price;
    private int quantity;
    private String image;

    public Cart() {
    }

    public Cart(String CageID, String CageName, double price, int quantity, String image) {
        this.CageID = CageID;
        this.CageName = CageName;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public String getCageID() {
        return CageID;
    }

    public void setCageID(String CageID) {
        this.CageID = CageID;
    }

    public String getCageName() {
        return CageName;
    }

    public void setCageName(String CageName) {
        this.CageName = CageName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }



    
    
}
