/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trand
 */
public class OrderSuccess {

    String orderID;
    String cageName;
    Date orderDate;
    int quantity;
    double price;
    double shipcod;

    public OrderSuccess() {
    }

    public OrderSuccess(String orderID, String cageName, Date orderDate, int quantity, double price, double shipcod) {
        this.orderID = orderID;
        this.cageName = cageName;
        this.orderDate = orderDate;
        this.quantity = quantity;
        this.price = price;
        this.shipcod = shipcod;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCageName() {
        return cageName;
    }

    public void setCageName(String cageName) {
        this.cageName = cageName;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
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

    public double getShipcod() {
        return shipcod;
    }

    public void setShipcod(double shipcod) {
        this.shipcod = shipcod;
    }

}
