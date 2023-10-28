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
public class Order {
    String orderID;
    String UserID;
    String cageID;
    String cageName;
    String phone;
    String address;
    Date orderDate;
    double shipCost;
    double total;
    boolean status;

    public Order() {
    }

    public Order(String orderID, String UserID, String phone, String address, Date orderDate, double shipCost, double total, boolean status) {
        this.orderID = orderID;
        this.UserID = UserID;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.shipCost = shipCost;
        this.total = total;
        this.status = status;
    }

    public Order(String orderID, String UserID, String cageName, String phone, String address, Date orderDate, double shipCost, double total, boolean status) {
        this.orderID = orderID;
        this.UserID = UserID;
        this.cageName = cageName;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.shipCost = shipCost;
        this.total = total;
        this.status = status;
    }

    public Order(String orderID, String UserID, String cageID, String cageName, String phone, String address, Date orderDate, double shipCost, double total, boolean status) {
        this.orderID = orderID;
        this.UserID = UserID;
        this.cageID = cageID;
        this.cageName = cageName;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.shipCost = shipCost;
        this.total = total;
        this.status = status;
    }

    public String getCageID() {
        return cageID;
    }

    public void setCageID(String cageID) {
        this.cageID = cageID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getShipCost() {
        return shipCost;
    }

    public void setShipCost(double shipCost) {
        this.shipCost = shipCost;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCageName() {
        return cageName;
    }

    public void setCageName(String cageName) {
        this.cageName = cageName;
    }

    
    
    
}
