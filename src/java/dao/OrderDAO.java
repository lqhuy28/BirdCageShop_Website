/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.ProductDTO;
import utils.DBUtils;

/**
 *
 * @author trand
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void insertOrder(String orderID, String userID, String phone, String address, Date orderDate, String orderStatus, String discount,double ship, double totalPrice) {
        String query = "insert into tblOrders\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, userID);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setDate(5, orderDate);
            ps.setString(6, orderStatus);
            ps.setString(7, discount);
            ps.setDouble(8, ship);
            ps.setDouble(9, totalPrice);
            int rowInserted = ps.executeUpdate();

            if (rowInserted > 0) {
                System.out.println("ngu");
            } else {
                System.out.println("ngu");
            }
        } catch (Exception e) {
        }
    }

    public void insertOrderDetail(String orderID, String cageId, String cageName, String price, int quantity) {
        String query = "insert into tblOrderDetails\n"
                + "values(?,?,?,?,?)";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, orderID);
            ps.setString(2, cageId);
            ps.setString(3, cageName);
            ps.setString(4, price);
            ps.setInt(5, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrder(String userID) {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total from tblOrders o where o.UserID = ?";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getDouble(7)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Order> getOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select o.OrderID, o.UserID, o.Phone, o.Address,o.OrderDate,o.ShippingCod, o.Total from tblOrders o";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getDouble(6),
                        rs.getDouble(7)));
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return list;
    }
}
