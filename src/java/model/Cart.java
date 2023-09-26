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
    private String ProductID;
    private String ProductName;
    private double price;
    private int quantity;

    public Cart() {
    }

    public Cart(String ProductID, String ProductName, double price, int quantity) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.price = price;
        this.quantity = quantity;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
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

    @Override
    public String toString() {
        return "Cart{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", price=" + price + ", quantity=" + quantity + '}';
    }
    
}
